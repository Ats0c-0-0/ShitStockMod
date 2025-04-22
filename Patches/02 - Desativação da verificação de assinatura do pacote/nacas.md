# Desativação da verificação de assinatura do pacote

## Esse patch foi feito por quem?
Pelo [ricci206](https://xdaforums.com/m/ricci206.679552/) do forúm [Samsung & Android Mods Collection](https://xdaforums.com/t/mods-samsung-not-android-mods-collection-exynos.3772017/) da XDA

### O que deve ser feito?
- Primeiramente, descompacte o services.jar usando o BatchApkTool
- Vá para a pasta do services.jar e siga esse caminho -> `smali_classes2\com\android\server\pm` e abra o __PackageManagerServiceUtils.smali__ dentro do VS Code ou Notepad++
- Procure esse metodo `compareSignatures`
- Você vai encontrar algo desse tipo:
  ```
  .method public static compareSignatures([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)I
      .registers 9
      .param p0, "s1"    # [Landroid/content/pm/Signature;
      .param p1, "s2"    # [Landroid/content/pm/Signature;
      
      .line 478
      const/4 v0, 0x1
      
      if-nez p0, :cond_8
      
      .line 479
      if-nez p1, :cond_6
      
      .line 480
      goto :goto_7
      
      .line 481
      :cond_6
      const/4 v0, -0x1
      
      .line 479
      :goto_7
      return v0
      
      .line 484
      :cond_8
      if-nez p1, :cond_c
      
      .line 485
      const/4 v0, -0x2
      
      return v0
      
      .line 488
      :cond_c
      array-length v1, p0
      
      array-length v2, p1
      
      const/4 v3, -0x3
      
      if-eq v1, v2, :cond_12
      
      .line 489
      return v3
      
      .line 493
      :cond_12
      array-length v1, p0
      
      const/4 v2, 0x0
      
      if-ne v1, v0, :cond_24
      
      .line 494
      aget-object v0, p0, v2
      
      aget-object v1, p1, v2
      
      invoke-virtual {v0, v1}, Landroid/content/pm/Signature;->equals(Ljava/lang/Object;)Z
      
      move-result v0
      
      if-eqz v0, :cond_22
      
      .line 495
      move v3, v2
      
      goto :goto_23
      
      .line 496
      :cond_22
      nop
      
      .line 494
      :goto_23
      return v3
      
      .line 499
      :cond_24
      new-instance v0, Landroid/util/ArraySet;
      
      invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V
      
      .line 500
      .local v0, "set1":Landroid/util/ArraySet;, "Landroid/util/ArraySet<Landroid/content/pm/Signature;>;"
      array-length v1, p0
      
      move v4, v2
      
      :goto_2b
      if-ge v4, v1, :cond_35
      
      aget-object v5, p0, v4
      
      .line 501
      .local v5, "sig":Landroid/content/pm/Signature;
      invoke-virtual {v0, v5}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z
      
      .line 500
      .end local v5    # "sig":Landroid/content/pm/Signature;
      add-int/lit8 v4, v4, 0x1
      
      goto :goto_2b
      
      .line 503
      :cond_35
      new-instance v1, Landroid/util/ArraySet;
      
      invoke-direct {v1}, Landroid/util/ArraySet;-><init>()V
      
      .line 504
      .local v1, "set2":Landroid/util/ArraySet;, "Landroid/util/ArraySet<Landroid/content/pm/Signature;>;"
      array-length v4, p1
      
      move v5, v2
      
      :goto_3c
      if-ge v5, v4, :cond_46
      
      aget-object v6, p1, v5
      
      .line 505
      .local v6, "sig":Landroid/content/pm/Signature;
      invoke-virtual {v1, v6}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z
      
      .line 504
      .end local v6    # "sig":Landroid/content/pm/Signature;
      add-int/lit8 v5, v5, 0x1
      
      goto :goto_3c
      
      .line 508
      :cond_46
      invoke-virtual {v0, v1}, Landroid/util/ArraySet;->equals(Ljava/lang/Object;)Z
      
      move-result v4
      
      if-eqz v4, :cond_4d
      
      .line 509
      return v2
      
      .line 511
      :cond_4d
      return v3
  .end method
  ```

- Você deve deixar assim:
  ```
  .method public static compareSignatures([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)I
      .registers 9
      
      const/4 v0, 0x0
      
      return v0
  .end method
  ```
- Agora procure esse metodo nesse mesmo arquivo `.method public static matchSignaturesCompat` e você vai encontrar algo mais ao menos assim:
  ```
  .method private static matchSignaturesCompat(Ljava/lang/String;Lcom/android/server/pm/PackageSignatures;Landroid/content/pm/PackageParser$SigningDetails;)Z
      .registers 14
      .param p0, "packageName"    # Ljava/lang/String;
      .param p1, "packageSignatures"    # Lcom/android/server/pm/PackageSignatures;
      .param p2, "parsedSignatures"    # Landroid/content/pm/PackageParser$SigningDetails;
      
      .line 534
      new-instance v0, Landroid/util/ArraySet;
      
      invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V
      
      .line 535
      .local v0, "existingSet":Landroid/util/ArraySet;, "Landroid/util/ArraySet<Landroid/content/pm/Signature;>;"
      iget-object v1, p1, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;
      
      iget-object v1, v1, Landroid/content/pm/PackageParser$SigningDetails;->signatures:[Landroid/content/pm/Signature;
      
      array-length v2, v1
      
      const/4 v3, 0x0
      
      move v4, v3
      
      :goto_c
      if-ge v4, v2, :cond_16
      
      aget-object v5, v1, v4
      
      .line 536
      .local v5, "sig":Landroid/content/pm/Signature;
      invoke-virtual {v0, v5}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z
      
      .line 535
      .end local v5    # "sig":Landroid/content/pm/Signature;
      add-int/lit8 v4, v4, 0x1
      
      goto :goto_c
      
      .line 538
      :cond_16
      new-instance v1, Landroid/util/ArraySet;
      
      invoke-direct {v1}, Landroid/util/ArraySet;-><init>()V
      
      .line 539
      .local v1, "scannedCompatSet":Landroid/util/ArraySet;, "Landroid/util/ArraySet<Landroid/content/pm/Signature;>;"
      iget-object v2, p2, Landroid/content/pm/PackageParser$SigningDetails;->signatures:[Landroid/content/pm/Signature;
      
      array-length v4, v2
      
      move v5, v3
      
      :goto_1f
      if-ge v5, v4, :cond_3c
      
      aget-object v6, v2, v5
      
      .line 541
      .local v6, "sig":Landroid/content/pm/Signature;
      :try_start_23
      invoke-virtual {v6}, Landroid/content/pm/Signature;->getChainSignatures()[Landroid/content/pm/Signature;
      
      move-result-object v7
      
      .line 542
      .local v7, "chainSignatures":[Landroid/content/pm/Signature;
      array-length v8, v7
      
      move v9, v3
      
      :goto_29
      if-ge v9, v8, :cond_34
      
      aget-object v10, v7, v9
      
      .line 543
      .local v10, "chainSig":Landroid/content/pm/Signature;
      invoke-virtual {v1, v10}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z
      :try_end_30
      .catch Ljava/security/cert/CertificateEncodingException; {:try_start_23 .. :try_end_30} :catch_35
      
      .line 542
      nop
      
      .end local v10    # "chainSig":Landroid/content/pm/Signature;
      add-int/lit8 v9, v9, 0x1
      
      goto :goto_29
      
      .line 547
      .end local v7    # "chainSignatures":[Landroid/content/pm/Signature;
      :cond_34
      goto :goto_39
      
      .line 545
      :catch_35
      move-exception v7
      
      .line 546
      .local v7, "e":Ljava/security/cert/CertificateEncodingException;
      invoke-virtual {v1, v6}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z
      
      .line 539
      .end local v6    # "sig":Landroid/content/pm/Signature;
      .end local v7    # "e":Ljava/security/cert/CertificateEncodingException;
      :goto_39
      add-int/lit8 v5, v5, 0x1
      
      goto :goto_1f
      
      .line 550
      :cond_3c
      invoke-virtual {v1, v0}, Landroid/util/ArraySet;->equals(Ljava/lang/Object;)Z
      
      move-result v2
      
      if-eqz v2, :cond_46
      
      .line 552
      iput-object p2, p1, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;
      
      .line 553
      const/4 v2, 0x1
      
      return v2
      
      .line 554
      :cond_46
      invoke-virtual {p2}, Landroid/content/pm/PackageParser$SigningDetails;->hasPastSigningCertificates()Z
      
      move-result v2
      
      if-eqz v2, :cond_66
      
      .line 559
      const/4 v2, 0x4
      
      new-instance v4, Ljava/lang/StringBuilder;
      
      invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
      
      const-string v5, "Existing package "
      
      invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
      
      invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
      
      const-string v5, " has flattened signing certificate chain. Unable to install newer version with rotated signing certificate."
      
      invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
      
      invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
      
      move-result-object v4
      
      invoke-static {v2, v4}, Lcom/android/server/pm/PackageManagerServiceUtils;->logCriticalInfo(ILjava/lang/String;)V
      
      .line 563
      :cond_66
      return v3
  .end method
  ```

- Você terá que deixar assim:
  ```
  .method private static matchSignaturesCompat(Ljava/lang/String;Lcom/android/server/pm/PackageSignatures;Landroid/content/pm/PackageParser$SigningDetails;)Z
      .registers 14
      
      const/4 v0, 0x0
      
      return v0
  .end method
  ```

- E por último pesquise esse metodo `matchSignaturesRecover` e encontrar algo assim:
  ```
  .method private static matchSignaturesRecover(Ljava/lang/String;Landroid/content/pm/PackageParser$SigningDetails;Landroid/content/pm/PackageParser$SigningDetails;I)Z
      .registers 8
      .param p0, "packageName"    # Ljava/lang/String;
      .param p1, "existingSignatures"    # Landroid/content/pm/PackageParser$SigningDetails;
      .param p2, "parsedSignatures"    # Landroid/content/pm/PackageParser$SigningDetails;
      .param p3, "flags"    # I
      
      .line 571
      const/4 v0, 0x0
      
      .line 573
      .local v0, "msg":Ljava/lang/String;
      const/4 v1, 0x4
      
      :try_start_2
      invoke-virtual {p2, p1, p3}, Landroid/content/pm/PackageParser$SigningDetails;->checkCapabilityRecover(Landroid/content/pm/PackageParser$SigningDetails;I)Z
      
      move-result v2
      
      if-eqz v2, :cond_1e
      
      .line 574
      new-instance v2, Ljava/lang/StringBuilder;
      
      invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
      
      const-string v3, "Recovered effectively matching certificates for "
      
      invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
      
      invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
      
      invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
      
      move-result-object v2
      
      invoke-static {v1, v2}, Lcom/android/server/pm/PackageManagerServiceUtils;->logCriticalInfo(ILjava/lang/String;)V
      :try_end_1c
      .catch Ljava/security/cert/CertificateException; {:try_start_2 .. :try_end_1c} :catch_1f
      
      .line 576
      const/4 v1, 0x1
      
      return v1
      
      .line 580
      :cond_1e
      goto :goto_24
      
      .line 578
      :catch_1f
      move-exception v2
      
      .line 579
      .local v2, "e":Ljava/security/cert/CertificateException;
      invoke-virtual {v2}, Ljava/security/cert/CertificateException;->getMessage()Ljava/lang/String;
      
      move-result-object v0
      
      .line 581
      .end local v2    # "e":Ljava/security/cert/CertificateException;
      :goto_24
      new-instance v2, Ljava/lang/StringBuilder;
      
      invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
      
      const-string v3, "Failed to recover certificates for "
      
      invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
      
      invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
      
      const-string v3, ": "
      
      invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
      
      invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
      
      invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
      
      move-result-object v2
      
      invoke-static {v1, v2}, Lcom/android/server/pm/PackageManagerServiceUtils;->logCriticalInfo(ILjava/lang/String;)V
      
      .line 583
      const/4 v1, 0x0
      
      return v1
  .end method
  ```
- Você terá que deixar assim:
  ```
  .method public static matchSignaturesRecover(Ljava/lang/String;Landroid/content/pm/SigningDetails;Landroid/content/pm/SigningDetails;I)Z
      .registers 8
      .param p3 # I
          .annotation build Landroid/content/pm/PackageParser$SigningDetails$CertCapabilities;
          .end annotation
      .end param
      
      const/4 v0, 0x0
      
      return v0
  .end method
  ```
- Recompile sem assinar o jar, coloque dentro de framework e substitua o que for necessário