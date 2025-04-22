# Corrigindo Pasta Segura

## Esse patch foi feito por quem?
Pelo [ricci206](https://xdaforums.com/m/ricci206.679552/) do forúm [Samsung & Android Mods Collection](https://xdaforums.com/t/mods-samsung-not-android-mods-collection-exynos.3772017/) da XDA

### O que deve ser feito?
- Primeiramente, descompacte o services.jar usando o BatchApkTool
- Vá para a pasta do services.jar e siga esse caminho -> `services\smali_classes2\com\android\server\knox\dar` e abra o __DarManagerService.smali__ dentro do VS Code ou Notepad++
- Procure esse metodo `isDeviceRootKeyInstalled`
- Você vai encontrar algo desse tipo:
  ```
  .method public isDeviceRootKeyInstalled()Z
      .registers 7
      
      .line 274
      invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->isGRDMSupported()Z
      
      move-result v0
      
      const-string v1, "DarManagerService"
      
      if-eqz v0, :cond_16
      
      .line 275
      const-string v0, "Check SAK instead for GRDM device"
      
      invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
      
      .line 276
      invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSAKInstalled()Z
      
      move-result v0
      
      invoke-static {v0}, Lcom/android/server/knox/dar/SecureUtil;->record(Z)Z
      
      move-result v0
      
      return v0
      
      .line 279
      :cond_16
      const/4 v0, 0x0
      
      .line 280
      .local v0, "result":Z
      invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
      
      move-result-wide v2
      
      .line 282
      .local v2, "identity":J
      :try_start_1b
      new-instance v4, Lcom/samsung/android/service/DeviceRootKeyService/DeviceRootKeyServiceManager;
      
      iget-object v5, p0, Lcom/android/server/knox/dar/DarManagerService;->mContext:Landroid/content/Context;
      
      invoke-direct {v4, v5}, Lcom/samsung/android/service/DeviceRootKeyService/DeviceRootKeyServiceManager;-><init>(Landroid/content/Context;)V
      
      .line 283
      .local v4, "drkService":Lcom/samsung/android/service/DeviceRootKeyService/DeviceRootKeyServiceManager;
      invoke-virtual {v4}, Lcom/samsung/android/service/DeviceRootKeyService/DeviceRootKeyServiceManager;->isAliveDeviceRootKeyService()Z
      
      move-result v5
      
      if-nez v5, :cond_2e
      
      .line 284
      const-string v5, "DRK service is not ready..."
      
      invoke-static {v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
      
      goto :goto_3b
      
      .line 286
      :cond_2e
      const/4 v1, 0x1
      
      invoke-virtual {v4, v1}, Lcom/samsung/android/service/DeviceRootKeyService/DeviceRootKeyServiceManager;->isExistDeviceRootKey(I)Z
      
      move-result v1
      :try_end_33
      .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_33} :catch_37
      .catchall {:try_start_1b .. :try_end_33} :catchall_35
      
      move v0, v1
      
      goto :goto_3b
      
      .line 292
      .end local v4    # "drkService":Lcom/samsung/android/service/DeviceRootKeyService/DeviceRootKeyServiceManager;
      :catchall_35
      move-exception v1
      
      goto :goto_44
      
      .line 289
      :catch_37
      move-exception v1
      
      .line 290
      .local v1, "e":Ljava/lang/Exception;
      :try_start_38
      invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
      :try_end_3b
      .catchall {:try_start_38 .. :try_end_3b} :catchall_35
      
      .line 292
      .end local v1    # "e":Ljava/lang/Exception;
      :goto_3b
      invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V
      
      .line 293
      nop
      
      .line 294
      invoke-static {v0}, Lcom/android/server/knox/dar/SecureUtil;->record(Z)Z
      
      move-result v1
      
      return v1
      
      .line 292
      :goto_44
      invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V
      
      .line 293
      throw v1
  .end method
  ```
- Você terá que alterar ficando assim:
  ```
  .method public isDeviceRootKeyInstalled()Z
      .registers 7

      const/4 v0, 0x1

      return v0

  .end method
  ```
- Ainda neste mesmo arquivo, procure por `isKnoxKeyInstallable` e encontrará algo desse tipo:
  ```
  .method public isKnoxKeyInstallable()Z
      .registers 9
  
      .line 317
      const-string v0, "KnoxTestKey"
  
      const/4 v1, 0x0
  
      .line 318
      .local v1, "result":Z
      invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J
  
      move-result-wide v2
  
      .line 320
      .local v2, "identity":J
      :try_start_7
      new-instance v4, Lcom/samsung/android/security/keystore/AttestationUtils;
  
      invoke-direct {v4}, Lcom/samsung/android/security/keystore/AttestationUtils;-><init>()V
  
      .line 321
      .local v4, "attestationUtils":Lcom/samsung/android/security/keystore/AttestationUtils;
      new-instance v5, Lcom/samsung/android/security/keystore/AttestParameterSpec$Builder;
  
      const/16 v6, 0x8
  
      .line 322
      invoke-static {v6}, Lcom/android/server/knox/dar/SecureUtil;->generateRandomBytes(I)[B
  
      move-result-object v6
  
      invoke-direct {v5, v0, v6}, Lcom/samsung/android/security/keystore/AttestParameterSpec$Builder;-><init>(Ljava/lang/String;[B)V
  
      const/4 v6, 0x1
  
      .line 323
      invoke-virtual {v5, v6}, Lcom/samsung/android/security/keystore/AttestParameterSpec$Builder;->setVerifiableIntegrity(Z)Lcom/samsung/android/security/keystore/AttestParameterSpec$Builder;
  
      move-result-object v5
  
      .line 324
      .local v5, "specBuilder":Lcom/samsung/android/security/keystore/AttestParameterSpec$Builder;
      invoke-virtual {v5}, Lcom/samsung/android/security/keystore/AttestParameterSpec$Builder;->build()Lcom/samsung/android/security/keystore/AttestParameterSpec;
  
      move-result-object v6
  
      invoke-virtual {v4, v6}, Lcom/samsung/android/security/keystore/AttestationUtils;->generateKeyPair(Lcom/samsung/android/security/keystore/AttestParameterSpec;)Ljava/security/KeyPair;
  
      move-result-object v6
  
      .line 325
      .local v6, "kp":Ljava/security/KeyPair;
      if-eqz v6, :cond_3b
  
      .line 326
      invoke-virtual {v4, v0}, Lcom/samsung/android/security/keystore/AttestationUtils;->getCertificateChain(Ljava/lang/String;)[Ljava/security/cert/Certificate;
  
      move-result-object v7
  
      invoke-direct {p0, v7}, Lcom/android/server/knox/dar/DarManagerService;->checkDeviceIntegrity([Ljava/security/cert/Certificate;)Z
  
      move-result v7
  
      move v1, v7
  
      .line 327
      if-eqz v1, :cond_3b
  
      .line 328
      invoke-virtual {v4, v0}, Lcom/samsung/android/security/keystore/AttestationUtils;->deleteKey(Ljava/lang/String;)V
      :try_end_34
      .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_34} :catch_37
      .catchall {:try_start_7 .. :try_end_34} :catchall_35
  
      goto :goto_3b
  
      .line 334
      .end local v4    # "attestationUtils":Lcom/samsung/android/security/keystore/AttestationUtils;
      .end local v5    # "specBuilder":Lcom/samsung/android/security/keystore/AttestParameterSpec$Builder;
      .end local v6    # "kp":Ljava/security/KeyPair;
      :catchall_35
      move-exception v0
  
      goto :goto_40
  
      .line 331
      :catch_37
      move-exception v0
  
      .line 332
      .local v0, "e":Ljava/lang/Exception;
      :try_start_38
      invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
      :try_end_3b
      .catchall {:try_start_38 .. :try_end_3b} :catchall_35
  
      .line 334
      .end local v0    # "e":Ljava/lang/Exception;
      :cond_3b
      :goto_3b
      invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V
  
      .line 335
      nop
  
      .line 336
      return v1
  
      .line 334
      :goto_40
      invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V
  
      .line 335
      throw v0
  .end method
  ```
- Corrigido vai ficar assim:
  ```
  .method public isKnoxKeyInstallable()Z
      .registers 9
  
      const/4 v0, 0x1
  
  	  return v0
  .end method
  ```
- Recompile sem assinar o jar, coloque dentro da sua devida pasta e substitua o que for necessário