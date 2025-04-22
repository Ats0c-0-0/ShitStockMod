# Correção para Private Share e Secure WiFi
Vou te mostrar como corrigir essas duas funções na sua OneUI 4.1

## Esse patch foi feito por quem?
Pelo [ricci206](https://xdaforums.com/m/ricci206.679552/) do forúm [Samsung & Android Mods Collection](https://xdaforums.com/t/mods-samsung-not-android-mods-collection-exynos.3772017/) da XDA

### O que deve ser feito?
- Primeiramente, descompacte o samsungkeystoreutils.jar usando o BatchApkTool
- Vá para a pasta do samsungkeystoreutils.jar e siga esse caminho -> `smali\com\samsung\android\security\keystore` e abra o __AttestParameterSpec.smali__ dentro do VS Code ou Notepad++
- Procure esse metodo isVerifiableIntegrity
- Você vai encontrar algo desse tipo:
  ```
  .method public isVerifiableIntegrity()Z
      .registers 2
      
      .line 93
      iget-boolean v0, p0, Lcom/samsung/android/security/keystore/AttestParameterSpec;->mVerifiableIntegrity:Z
      
      return v0
  .end method
  ```
- Você deve deixar assim:
  ```
  .method public isVerifiableIntegrity()Z
      .registers 2
      
      const/4 v0, 0x1
      
      return v0
  .end method
  ```
- Recompile sem assinar o jar, coloque dentro de framework e substitua o que for necessário