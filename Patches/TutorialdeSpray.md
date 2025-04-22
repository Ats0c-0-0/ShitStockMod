# Tutorial de spray

## Bom, aqui vou ensinar a configurar o BatchApkTool para que possam construir os jar/apk's sem nenhum problema

- Abra o BAT e configure assim
  - SMALI -> Não mexe
  - API Level -> Vai depender da versão do Android que está mexendo (o mesmo explica qual versão tem que usar dependendo da versão que está querendo mexer)
  - APKTOOL -> Não mexe
  - Resolve resources mode -> remove
  - Build in EXPERT mode -> YES
  - AAPT Version -> Não mexe
  - Sign output APKs -> NO
- Tem que ficar exatamente assim:
- <img src="/imgandgifs/BATConfig.png">


### Lista de mods presentes até agora:
- [Correção para Private Share e Secure WiFi](https://github.com/Ats0c-0-0/ShitStockMod/blob/main/Patches/FixPSWS/nacas.md)
- [Desativação da verificação de assinatura do pacote](https://github.com/Ats0c-0-0/ShitStockMod/blob/main/Patches/DisableSignaturePackage/nacas.md)
- [Desativação de verificação de assinatura de APK](https://github.com/Ats0c-0-0/ShitStockMod/blob/main/Patches/DisableSignatureAPK/nacas.md)
- [Ativando o Outdoor Mode](https://github.com/Ats0c-0-0/ShitStockMod/blob/main/Patches/EnablingOutdoorMode/nacas.md)
- [Corrigindo Pasta Segura](https://github.com/Ats0c-0-0/ShitStockMod/blob/main/Patches/FixSecureFolder/nacas.md)