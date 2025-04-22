# Ativação do Outdoor Mode

## Esse patch foi feito por quem?
Pelo [ShaDisNX255](https://xdaforums.com/m/shadisnx255.5802828/) do forúm [Samsung & Android Mods Collection](https://xdaforums.com/t/mods-samsung-not-android-mods-collection-exynos.3772017/) da XDA

### O que deve ser feito?
- Primeiramente, descompacte o SecSettings.apk usando o BatchApkTool
- Vá para a pasta do SecSettings.apk e siga esse caminho -> `smali_classes2/com/samsung/android/settings/display/controller` e abra o __SecOutDoorModePreferenceController.smali__ dentro do VS Code ou Notepad++
- Procure esse metodo `isAvailable`
- Você vai encontrar algo desse tipo:
  ```
  .method public isAvailable()Z
      .locals 0
      
      .line 90
      iget-object p0, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;
      
      invoke-static {p0}, Lcom/samsung/android/settings/Rune;->supportOutdoorMode(Landroid/content/Context;)Z
      
      move-result p0
      
      return p0
  .end method
  ```
- Você terá que alterar ficando assim:
  ```
  .method public isAvailable()Z
      .locals 1
      
      const/4 v0, 0x1
      
      return v0
  .end method
  ```
- Recompile sem assinar o jar, coloque dentro da sua devida pasta e substitua o que for necessário