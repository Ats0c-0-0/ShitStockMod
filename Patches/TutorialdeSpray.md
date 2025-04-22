# Tutorial de spray

## Bom, aqui vou ensinar a configurar o BatchApkTool para que possam construir os jar/apk's sem nenhum problema

- Abra o BAT e configure assim
  - SMALI -> N�o mexe
  - API Level -> Vai depender da vers�o do Android que est� mexendo (o mesmo explica qual vers�o tem que usar dependendo da vers�o que est� querendo mexer)
  - APKTOOL -> N�o mexe
  - Resolve resources mode -> remove
  - Build in EXPERT mode -> YES
  - AAPT Version -> N�o mexe
  - Sign output APKs -> NO
- Tem que ficar exatamente assim:
- <img src="/imgandgifs/BATConfig.png">


### Lista de mods presentes at� agora:
- [Corre��o para Private Share e Secure WiFi](https://github.com/Ats0c-0-0/ShitStockMod/blob/main/Patches/FixPSWS/nacas.md)
- [Desativa��o da verifica��o de assinatura do pacote](https://github.com/Ats0c-0-0/ShitStockMod/blob/main/Patches/DisableSignaturePackage/nacas.md)
- [Desativa��o de verifica��o de assinatura de APK](https://github.com/Ats0c-0-0/ShitStockMod/blob/main/Patches/DisableSignatureAPK/nacas.md)
- [Ativando o Outdoor Mode](https://github.com/Ats0c-0-0/ShitStockMod/blob/main/Patches/EnablingOutdoorMode/nacas.md)
- [Corrigindo Pasta Segura](https://github.com/Ats0c-0-0/ShitStockMod/blob/main/Patches/FixSecureFolder/nacas.md)