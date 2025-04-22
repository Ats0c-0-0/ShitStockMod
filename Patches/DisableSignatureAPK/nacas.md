# Desativação da verificação de assinatura de APK
Essa alteração vai permitir você a modificar apps do sistema com SecSettings ou até mesmo a SystemUI

## Esse patch foi feito por quem?
Pelo [ricci206](https://xdaforums.com/m/ricci206.679552/) do forúm [Samsung & Android Mods Collection](https://xdaforums.com/t/mods-samsung-not-android-mods-collection-exynos.3772017/) da XDA

### O que deve ser feito?
- Primeiramente, descompacte o framework.jar usando o BatchApkTool
- Vá para a pasta do framework.jar e siga esse caminho -> `smali_classes3\android\util\apk` e abra o __ApkSignatureVerifier.smali__ dentro do VS Code ou Notepad++
- Procure esse metodo `getMinimumSignatureSchemeVersionForTargetSdk`
- Você vai encontrar algo desse tipo:
  ```
  .method public static blacklist getMinimumSignatureSchemeVersionForTargetSdk(I)I
      .registers 2
      .param p0, "targetSdk"    # I
      
      .line 497
      const/16 v0, 0x1e
      
      if-lt p0, v0, :cond_6
      
      .line 498
      const/4 v0, 0x2
      
      return v0
      
      .line 500
      :cond_6
      const/4 v0, 0x1
      
      return v0
  .end method
  ```
- Você terá que alterar `const/4 v0, 0x2` para `const/4 v0, 0x1` ficando assim:
  ```
  .method public static blacklist getMinimumSignatureSchemeVersionForTargetSdk(I)I
      .registers 2
      .param p0, "targetSdk"    # I
      
      .line 497
      const/16 v0, 0x1e
      
      if-lt p0, v0, :cond_6
      
      .line 498
      const/4 v0, 0x1
      
      return v0
      
      .line 500
      :cond_6
      const/4 v0, 0x1
      
      return v0
  .end method
  ```
- Recompile sem assinar o jar, coloque dentro de framework e substitua o que for necessário