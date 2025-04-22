.class public Landroid/util/apk/ApkSignatureVerifier;
.super Ljava/lang/Object;
.source "ApkSignatureVerifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;,
        Landroid/util/apk/ApkSignatureVerifier$Result;
    }
.end annotation


# static fields
.field private static final greylist-max-o sBuffer:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "[B>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor blacklist <clinit>()V
    .registers 1

    .line 61
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    sput-object v0, Landroid/util/apk/ApkSignatureVerifier;->sBuffer:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public constructor greylist-max-o <init>()V
    .registers 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static greylist-max-o closeQuietly(Landroid/util/jar/StrictJarFile;)V
    .registers 2
    .param p0, "jarFile"    # Landroid/util/jar/StrictJarFile;

    .line 484
    if-eqz p0, :cond_7

    .line 486
    :try_start_2
    invoke-virtual {p0}, Landroid/util/jar/StrictJarFile;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5} :catch_6

    .line 488
    goto :goto_7

    .line 487
    :catch_6
    move-exception v0

    .line 490
    :cond_7
    :goto_7
    return-void
.end method

.method private static greylist-max-o convertToSignatures([[Ljava/security/cert/Certificate;)[Landroid/content/pm/Signature;
    .registers 5
    .param p0, "certs"    # [[Ljava/security/cert/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .line 476
    array-length v0, p0

    new-array v0, v0, [Landroid/content/pm/Signature;

    .line 477
    .local v0, "res":[Landroid/content/pm/Signature;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    array-length v2, p0

    if-ge v1, v2, :cond_13

    .line 478
    new-instance v2, Landroid/content/pm/Signature;

    aget-object v3, p0, v1

    invoke-direct {v2, v3}, Landroid/content/pm/Signature;-><init>([Ljava/security/cert/Certificate;)V

    aput-object v2, v0, v1

    .line 477
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 480
    .end local v1    # "i":I
    :cond_13
    return-object v0
.end method

.method public static greylist-max-o generateApkVerity(Ljava/lang/String;Landroid/util/apk/ByteBufferFactory;)[B
    .registers 3
    .param p0, "apkPath"    # Ljava/lang/String;
    .param p1, "bufferFactory"    # Landroid/util/apk/ByteBufferFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Landroid/util/apk/SignatureNotFoundException;,
            Ljava/lang/SecurityException;,
            Ljava/security/DigestException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 546
    :try_start_0
    invoke-static {p0, p1}, Landroid/util/apk/ApkSignatureSchemeV3Verifier;->generateApkVerity(Ljava/lang/String;Landroid/util/apk/ByteBufferFactory;)[B

    move-result-object v0
    :try_end_4
    .catch Landroid/util/apk/SignatureNotFoundException; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    .line 547
    :catch_5
    move-exception v0

    .line 550
    invoke-static {p0, p1}, Landroid/util/apk/ApkSignatureSchemeV2Verifier;->generateApkVerity(Ljava/lang/String;Landroid/util/apk/ByteBufferFactory;)[B

    move-result-object v0

    return-object v0
.end method

.method public static blacklist generateApkVerityRootHash(Ljava/lang/String;)[B
    .registers 3
    .param p0, "apkPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/DigestException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 563
    :try_start_0
    invoke-static {p0}, Landroid/util/apk/ApkSignatureSchemeV3Verifier;->generateApkVerityRootHash(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_4
    .catch Landroid/util/apk/SignatureNotFoundException; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    .line 564
    :catch_5
    move-exception v0

    .line 568
    :try_start_6
    invoke-static {p0}, Landroid/util/apk/ApkSignatureSchemeV2Verifier;->generateApkVerityRootHash(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_a
    .catch Landroid/util/apk/SignatureNotFoundException; {:try_start_6 .. :try_end_a} :catch_b

    return-object v0

    .line 569
    :catch_b
    move-exception v0

    .line 570
    .local v0, "e":Landroid/util/apk/SignatureNotFoundException;
    const/4 v1, 0x0

    return-object v1
.end method

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

.method public static greylist-max-o getVerityRootHash(Ljava/lang/String;)[B
    .registers 3
    .param p0, "apkPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/SecurityException;
        }
    .end annotation

    .line 524
    :try_start_0
    invoke-static {p0}, Landroid/util/apk/ApkSignatureSchemeV3Verifier;->getVerityRootHash(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_4
    .catch Landroid/util/apk/SignatureNotFoundException; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    .line 525
    :catch_5
    move-exception v0

    .line 529
    :try_start_6
    invoke-static {p0}, Landroid/util/apk/ApkSignatureSchemeV2Verifier;->getVerityRootHash(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_a
    .catch Landroid/util/apk/SignatureNotFoundException; {:try_start_6 .. :try_end_a} :catch_b

    return-object v0

    .line 530
    :catch_b
    move-exception v0

    .line 531
    .local v0, "e":Landroid/util/apk/SignatureNotFoundException;
    const/4 v1, 0x0

    return-object v1
.end method

.method private static greylist-max-o loadCertificates(Landroid/util/jar/StrictJarFile;Ljava/util/zip/ZipEntry;)[[Ljava/security/cert/Certificate;
    .registers 8
    .param p0, "jarFile"    # Landroid/util/jar/StrictJarFile;
    .param p1, "entry"    # Ljava/util/zip/ZipEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageParser$PackageParserException;
        }
    .end annotation

    .line 437
    const/4 v0, 0x0

    .line 441
    .local v0, "is":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {p0, p1}, Landroid/util/jar/StrictJarFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v1

    move-object v0, v1

    .line 442
    invoke-static {v0}, Landroid/util/apk/ApkSignatureVerifier;->readFullyIgnoringContents(Ljava/io/InputStream;)V

    .line 443
    invoke-virtual {p0, p1}, Landroid/util/jar/StrictJarFile;->getCertificateChains(Ljava/util/zip/ZipEntry;)[[Ljava/security/cert/Certificate;

    move-result-object v1
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_d} :catch_13
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_d} :catch_13
    .catchall {:try_start_1 .. :try_end_d} :catchall_11

    .line 448
    invoke-static {v0}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 443
    return-object v1

    .line 448
    :catchall_11
    move-exception v1

    goto :goto_39

    .line 444
    :catch_13
    move-exception v1

    .line 445
    .local v1, "e":Ljava/lang/Exception;
    :try_start_14
    new-instance v2, Landroid/content/pm/PackageParser$PackageParserException;

    const/16 v3, -0x66

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed reading "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " in "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4, v1}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "is":Ljava/io/InputStream;
    .end local p0    # "jarFile":Landroid/util/jar/StrictJarFile;
    .end local p1    # "entry":Ljava/util/zip/ZipEntry;
    throw v2
    :try_end_39
    .catchall {:try_start_14 .. :try_end_39} :catchall_11

    .line 448
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "is":Ljava/io/InputStream;
    .restart local p0    # "jarFile":Landroid/util/jar/StrictJarFile;
    .restart local p1    # "entry":Ljava/util/zip/ZipEntry;
    :goto_39
    invoke-static {v0}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 449
    throw v1
.end method

.method private static greylist-max-o readFullyIgnoringContents(Ljava/io/InputStream;)V
    .registers 6
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 453
    sget-object v0, Landroid/util/apk/ApkSignatureVerifier;->sBuffer:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 454
    .local v0, "buffer":[B
    if-nez v0, :cond_f

    .line 455
    const/16 v1, 0x1000

    new-array v0, v1, [B

    .line 458
    :cond_f
    const/4 v1, 0x0

    .line 459
    .local v1, "n":I
    const/4 v2, 0x0

    .line 460
    .local v2, "count":I
    :goto_11
    const/4 v3, 0x0

    array-length v4, v0

    invoke-virtual {p0, v0, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    move v1, v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1d

    .line 461
    add-int/2addr v2, v1

    goto :goto_11

    .line 464
    :cond_1d
    sget-object v3, Landroid/util/apk/ApkSignatureVerifier;->sBuffer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 465
    return-void
.end method

.method public static blacklist unsafeGetCertsWithoutVerification(Ljava/lang/String;I)Landroid/content/pm/PackageParser$SigningDetails;
    .registers 3
    .param p0, "apkPath"    # Ljava/lang/String;
    .param p1, "minSignatureSchemeVersion"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageParser$PackageParserException;
        }
    .end annotation

    .line 84
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/util/apk/ApkSignatureVerifier;->verifySignatures(Ljava/lang/String;IZ)Landroid/content/pm/PackageParser$SigningDetails;

    move-result-object v0

    return-object v0
.end method

.method public static greylist-max-o verify(Ljava/lang/String;I)Landroid/content/pm/PackageParser$SigningDetails;
    .registers 3
    .param p0, "apkPath"    # Ljava/lang/String;
    .param p1, "minSignatureSchemeVersion"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageParser$PackageParserException;
        }
    .end annotation

    .line 71
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/util/apk/ApkSignatureVerifier;->verifySignatures(Ljava/lang/String;IZ)Landroid/content/pm/PackageParser$SigningDetails;

    move-result-object v0

    return-object v0
.end method

.method private static blacklist verifySignatures(Ljava/lang/String;IZ)Landroid/content/pm/PackageParser$SigningDetails;
    .registers 4
    .param p0, "apkPath"    # Ljava/lang/String;
    .param p1, "minSignatureSchemeVersion"    # I
    .param p2, "verifyFull"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageParser$PackageParserException;
        }
    .end annotation

    .line 96
    invoke-static {p0, p1, p2}, Landroid/util/apk/ApkSignatureVerifier;->verifySignaturesInternal(Ljava/lang/String;IZ)Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;

    move-result-object v0

    iget-object v0, v0, Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;->signingDetails:Landroid/content/pm/PackageParser$SigningDetails;

    return-object v0
.end method

.method public static blacklist verifySignaturesInternal(Ljava/lang/String;IZ)Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;
    .registers 8
    .param p0, "apkPath"    # Ljava/lang/String;
    .param p1, "minSignatureSchemeVersion"    # I
    .param p2, "verifyFull"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageParser$PackageParserException;
        }
    .end annotation

    .line 111
    const-string v0, " or newer for package "

    const-string v1, "No signature found in package of version "

    const/4 v2, 0x4

    const/16 v3, -0x67

    if-gt p1, v2, :cond_4b

    .line 120
    :try_start_9
    invoke-static {p0, p1, p2}, Landroid/util/apk/ApkSignatureVerifier;->verifyV4Signature(Ljava/lang/String;IZ)Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;

    move-result-object v0
    :try_end_d
    .catch Landroid/util/apk/SignatureNotFoundException; {:try_start_9 .. :try_end_d} :catch_e

    return-object v0

    .line 121
    :catch_e
    move-exception v4

    .line 123
    .local v4, "e":Landroid/util/apk/SignatureNotFoundException;
    if-ge p1, v2, :cond_34

    .line 129
    .end local v4    # "e":Landroid/util/apk/SignatureNotFoundException;
    const/4 v2, 0x3

    if-gt p1, v2, :cond_19

    .line 136
    invoke-static {p0, p1, p2}, Landroid/util/apk/ApkSignatureVerifier;->verifyV3AndBelowSignatures(Ljava/lang/String;IZ)Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;

    move-result-object v0

    return-object v0

    .line 131
    :cond_19
    new-instance v2, Landroid/content/pm/PackageParser$PackageParserException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v3, v0}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;)V

    throw v2

    .line 124
    .restart local v4    # "e":Landroid/util/apk/SignatureNotFoundException;
    :cond_34
    new-instance v0, Landroid/content/pm/PackageParser$PackageParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No APK Signature Scheme v4 signature in package "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v3, v1, v4}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 113
    .end local v4    # "e":Landroid/util/apk/SignatureNotFoundException;
    :cond_4b
    new-instance v2, Landroid/content/pm/PackageParser$PackageParserException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v3, v0}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;)V

    throw v2
.end method

.method private static blacklist verifyV1Signature(Ljava/lang/String;Z)Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;
    .registers 21
    .param p0, "apkPath"    # Ljava/lang/String;
    .param p1, "verifyFull"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageParser$PackageParserException;
        }
    .end annotation

    .line 357
    move-object/from16 v1, p0

    move/from16 v2, p1

    const-string v3, "Failed to collect certificates from "

    const-string v0, "AndroidManifest.xml"

    const/4 v4, 0x0

    .line 363
    .local v4, "jarFile":Landroid/util/jar/StrictJarFile;
    const-wide/32 v6, 0x40000

    :try_start_c
    const-string/jumbo v8, "strictJarFileCtor"

    invoke-static {v6, v7, v8}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 367
    new-instance v8, Landroid/util/jar/StrictJarFile;

    const/4 v9, 0x1

    invoke-direct {v8, v1, v9, v2}, Landroid/util/jar/StrictJarFile;-><init>(Ljava/lang/String;ZZ)V

    move-object v4, v8

    .line 371
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 375
    .local v8, "toVerify":Ljava/util/List;, "Ljava/util/List<Ljava/util/zip/ZipEntry;>;"
    invoke-virtual {v4, v0}, Landroid/util/jar/StrictJarFile;->findEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v10
    :try_end_22
    .catch Ljava/security/GeneralSecurityException; {:try_start_c .. :try_end_22} :catch_14f
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_22} :catch_137
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_22} :catch_137
    .catchall {:try_start_c .. :try_end_22} :catchall_135

    .line 377
    .local v10, "manifestEntry":Ljava/util/zip/ZipEntry;
    const-string v11, "Package "

    if-eqz v10, :cond_119

    .line 381
    :try_start_26
    invoke-static {v4, v10}, Landroid/util/apk/ApkSignatureVerifier;->loadCertificates(Landroid/util/jar/StrictJarFile;Ljava/util/zip/ZipEntry;)[[Ljava/security/cert/Certificate;

    move-result-object v12

    .line 382
    .local v12, "lastCerts":[[Ljava/security/cert/Certificate;
    invoke-static {v12}, Lcom/android/internal/util/ArrayUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v13
    :try_end_2e
    .catch Ljava/security/GeneralSecurityException; {:try_start_26 .. :try_end_2e} :catch_14f
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_2e} :catch_137
    .catch Ljava/lang/RuntimeException; {:try_start_26 .. :try_end_2e} :catch_137
    .catchall {:try_start_26 .. :try_end_2e} :catchall_135

    const-string v14, " has no certificates at entry "

    if-nez v13, :cond_fc

    .line 387
    :try_start_32
    invoke-static {v12}, Landroid/util/apk/ApkSignatureVerifier;->convertToSignatures([[Ljava/security/cert/Certificate;)[Landroid/content/pm/Signature;

    move-result-object v13

    .line 390
    .local v13, "lastSigs":[Landroid/content/pm/Signature;
    if-eqz v2, :cond_e6

    .line 391
    invoke-virtual {v4}, Landroid/util/jar/StrictJarFile;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .line 392
    .local v15, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/zip/ZipEntry;>;"
    :goto_3c
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_78

    .line 393
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/zip/ZipEntry;

    move-object/from16 v17, v16

    .line 394
    .local v17, "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual/range {v17 .. v17}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v16

    if-eqz v16, :cond_51

    goto :goto_3c

    .line 396
    :cond_51
    invoke-virtual/range {v17 .. v17}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v18, v16

    .line 397
    .local v18, "entryName":Ljava/lang/String;
    const-string v6, "META-INF/"

    move-object/from16 v7, v18

    .end local v18    # "entryName":Ljava/lang/String;
    .local v7, "entryName":Ljava/lang/String;
    invoke-virtual {v7, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_65

    const-wide/32 v6, 0x40000

    goto :goto_3c

    .line 398
    :cond_65
    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6f

    const-wide/32 v6, 0x40000

    goto :goto_3c

    .line 400
    :cond_6f
    move-object/from16 v6, v17

    .end local v17    # "entry":Ljava/util/zip/ZipEntry;
    .local v6, "entry":Ljava/util/zip/ZipEntry;
    invoke-interface {v8, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 401
    const-wide/32 v6, 0x40000

    .end local v6    # "entry":Ljava/util/zip/ZipEntry;
    .end local v7    # "entryName":Ljava/lang/String;
    goto :goto_3c

    .line 403
    :cond_78
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_7c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_e6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/zip/ZipEntry;

    .line 404
    .restart local v6    # "entry":Ljava/util/zip/ZipEntry;
    invoke-static {v4, v6}, Landroid/util/apk/ApkSignatureVerifier;->loadCertificates(Landroid/util/jar/StrictJarFile;Ljava/util/zip/ZipEntry;)[[Ljava/security/cert/Certificate;

    move-result-object v7

    .line 405
    .local v7, "entryCerts":[[Ljava/security/cert/Certificate;
    invoke-static {v7}, Lcom/android/internal/util/ArrayUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_c5

    .line 412
    invoke-static {v7}, Landroid/util/apk/ApkSignatureVerifier;->convertToSignatures([[Ljava/security/cert/Certificate;)[Landroid/content/pm/Signature;

    move-result-object v16

    move-object/from16 v17, v16

    .line 413
    .local v17, "entrySigs":[Landroid/content/pm/Signature;
    move-object/from16 v9, v17

    .end local v17    # "entrySigs":[Landroid/content/pm/Signature;
    .local v9, "entrySigs":[Landroid/content/pm/Signature;
    invoke-static {v13, v9}, Landroid/content/pm/Signature;->areExactMatch([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)Z

    move-result v17

    if-eqz v17, :cond_a2

    .line 419
    .end local v6    # "entry":Ljava/util/zip/ZipEntry;
    .end local v7    # "entryCerts":[[Ljava/security/cert/Certificate;
    .end local v9    # "entrySigs":[Landroid/content/pm/Signature;
    const/4 v9, 0x1

    goto :goto_7c

    .line 414
    .restart local v6    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v7    # "entryCerts":[[Ljava/security/cert/Certificate;
    .restart local v9    # "entrySigs":[Landroid/content/pm/Signature;
    :cond_a2
    new-instance v0, Landroid/content/pm/PackageParser$PackageParserException;

    const/16 v14, -0x68

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, " has mismatched certificates at entry "

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 417
    invoke-virtual {v6}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v14, v5}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;)V

    .end local v4    # "jarFile":Landroid/util/jar/StrictJarFile;
    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "verifyFull":Z
    throw v0

    .line 406
    .end local v9    # "entrySigs":[Landroid/content/pm/Signature;
    .restart local v4    # "jarFile":Landroid/util/jar/StrictJarFile;
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "verifyFull":Z
    :cond_c5
    new-instance v0, Landroid/content/pm/PackageParser$PackageParserException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 408
    invoke-virtual {v6}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/16 v9, -0x67

    invoke-direct {v0, v9, v5}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;)V

    .end local v4    # "jarFile":Landroid/util/jar/StrictJarFile;
    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "verifyFull":Z
    throw v0

    .line 421
    .end local v6    # "entry":Ljava/util/zip/ZipEntry;
    .end local v7    # "entryCerts":[[Ljava/security/cert/Certificate;
    .end local v15    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/zip/ZipEntry;>;"
    .restart local v4    # "jarFile":Landroid/util/jar/StrictJarFile;
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "verifyFull":Z
    :cond_e6
    new-instance v0, Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;

    new-instance v5, Landroid/content/pm/PackageParser$SigningDetails;

    const/4 v6, 0x1

    invoke-direct {v5, v13, v6}, Landroid/content/pm/PackageParser$SigningDetails;-><init>([Landroid/content/pm/Signature;I)V

    const/4 v6, 0x0

    invoke-direct {v0, v5, v6}, Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;-><init>(Landroid/content/pm/PackageParser$SigningDetails;Ljava/util/Map;)V
    :try_end_f2
    .catch Ljava/security/GeneralSecurityException; {:try_start_32 .. :try_end_f2} :catch_14f
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_f2} :catch_137
    .catch Ljava/lang/RuntimeException; {:try_start_32 .. :try_end_f2} :catch_137
    .catchall {:try_start_32 .. :try_end_f2} :catchall_135

    .line 430
    const-wide/32 v5, 0x40000

    invoke-static {v5, v6}, Landroid/os/Trace;->traceEnd(J)V

    .line 431
    invoke-static {v4}, Landroid/util/apk/ApkSignatureVerifier;->closeQuietly(Landroid/util/jar/StrictJarFile;)V

    .line 421
    return-object v0

    .line 383
    .end local v13    # "lastSigs":[Landroid/content/pm/Signature;
    :cond_fc
    :try_start_fc
    new-instance v5, Landroid/content/pm/PackageParser$PackageParserException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v6, -0x67

    invoke-direct {v5, v6, v0}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;)V

    .end local v4    # "jarFile":Landroid/util/jar/StrictJarFile;
    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "verifyFull":Z
    throw v5

    .line 378
    .end local v12    # "lastCerts":[[Ljava/security/cert/Certificate;
    .restart local v4    # "jarFile":Landroid/util/jar/StrictJarFile;
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "verifyFull":Z
    :cond_119
    new-instance v0, Landroid/content/pm/PackageParser$PackageParserException;

    const/16 v5, -0x65

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " has no manifest"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v5, v6}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;)V

    .end local v4    # "jarFile":Landroid/util/jar/StrictJarFile;
    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "verifyFull":Z
    throw v0
    :try_end_135
    .catch Ljava/security/GeneralSecurityException; {:try_start_fc .. :try_end_135} :catch_14f
    .catch Ljava/io/IOException; {:try_start_fc .. :try_end_135} :catch_137
    .catch Ljava/lang/RuntimeException; {:try_start_fc .. :try_end_135} :catch_137
    .catchall {:try_start_fc .. :try_end_135} :catchall_135

    .line 430
    .end local v8    # "toVerify":Ljava/util/List;, "Ljava/util/List<Ljava/util/zip/ZipEntry;>;"
    .end local v10    # "manifestEntry":Ljava/util/zip/ZipEntry;
    .restart local v4    # "jarFile":Landroid/util/jar/StrictJarFile;
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "verifyFull":Z
    :catchall_135
    move-exception v0

    goto :goto_167

    .line 426
    :catch_137
    move-exception v0

    .line 427
    .local v0, "e":Ljava/lang/Exception;
    :try_start_138
    new-instance v5, Landroid/content/pm/PackageParser$PackageParserException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v6, -0x67

    invoke-direct {v5, v6, v3, v0}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local v4    # "jarFile":Landroid/util/jar/StrictJarFile;
    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "verifyFull":Z
    throw v5

    .line 423
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v4    # "jarFile":Landroid/util/jar/StrictJarFile;
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "verifyFull":Z
    :catch_14f
    move-exception v0

    .line 424
    .local v0, "e":Ljava/security/GeneralSecurityException;
    new-instance v5, Landroid/content/pm/PackageParser$PackageParserException;

    const/16 v6, -0x69

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v6, v3, v0}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local v4    # "jarFile":Landroid/util/jar/StrictJarFile;
    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "verifyFull":Z
    throw v5
    :try_end_167
    .catchall {:try_start_138 .. :try_end_167} :catchall_135

    .line 430
    .end local v0    # "e":Ljava/security/GeneralSecurityException;
    .restart local v4    # "jarFile":Landroid/util/jar/StrictJarFile;
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "verifyFull":Z
    :goto_167
    const-wide/32 v5, 0x40000

    invoke-static {v5, v6}, Landroid/os/Trace;->traceEnd(J)V

    .line 431
    invoke-static {v4}, Landroid/util/apk/ApkSignatureVerifier;->closeQuietly(Landroid/util/jar/StrictJarFile;)V

    .line 432
    throw v0
.end method

.method private static blacklist verifyV2Signature(Ljava/lang/String;Z)Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;
    .registers 10
    .param p0, "apkPath"    # Ljava/lang/String;
    .param p1, "verifyFull"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/util/apk/SignatureNotFoundException;,
            Landroid/content/pm/PackageParser$PackageParserException;
        }
    .end annotation

    .line 329
    if-eqz p1, :cond_6

    const-string/jumbo v0, "verifyV2"

    goto :goto_8

    :cond_6
    const-string v0, "certsOnlyV2"

    :goto_8
    const-wide/32 v1, 0x40000

    invoke-static {v1, v2, v0}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 331
    nop

    .line 332
    :try_start_f
    invoke-static {p0, p1}, Landroid/util/apk/ApkSignatureSchemeV2Verifier;->verify(Ljava/lang/String;Z)Landroid/util/apk/ApkSignatureSchemeV2Verifier$VerifiedSigner;

    move-result-object v0

    .line 333
    .local v0, "vSigner":Landroid/util/apk/ApkSignatureSchemeV2Verifier$VerifiedSigner;
    iget-object v3, v0, Landroid/util/apk/ApkSignatureSchemeV2Verifier$VerifiedSigner;->certs:[[Ljava/security/cert/X509Certificate;

    .line 334
    .local v3, "signerCerts":[[Ljava/security/cert/Certificate;
    invoke-static {v3}, Landroid/util/apk/ApkSignatureVerifier;->convertToSignatures([[Ljava/security/cert/Certificate;)[Landroid/content/pm/Signature;

    move-result-object v4

    .line 335
    .local v4, "signerSigs":[Landroid/content/pm/Signature;
    new-instance v5, Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;

    new-instance v6, Landroid/content/pm/PackageParser$SigningDetails;

    const/4 v7, 0x2

    invoke-direct {v6, v4, v7}, Landroid/content/pm/PackageParser$SigningDetails;-><init>([Landroid/content/pm/Signature;I)V

    iget-object v7, v0, Landroid/util/apk/ApkSignatureSchemeV2Verifier$VerifiedSigner;->contentDigests:Ljava/util/Map;

    invoke-direct {v5, v6, v7}, Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;-><init>(Landroid/content/pm/PackageParser$SigningDetails;Ljava/util/Map;)V
    :try_end_26
    .catch Landroid/util/apk/SignatureNotFoundException; {:try_start_f .. :try_end_26} :catch_4b
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_26} :catch_2c
    .catchall {:try_start_f .. :try_end_26} :catchall_2a

    .line 345
    invoke-static {v1, v2}, Landroid/os/Trace;->traceEnd(J)V

    .line 335
    return-object v5

    .line 345
    .end local v0    # "vSigner":Landroid/util/apk/ApkSignatureSchemeV2Verifier$VerifiedSigner;
    .end local v3    # "signerCerts":[[Ljava/security/cert/Certificate;
    .end local v4    # "signerSigs":[Landroid/content/pm/Signature;
    :catchall_2a
    move-exception v0

    goto :goto_4e

    .line 339
    :catch_2c
    move-exception v0

    .line 341
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2d
    new-instance v3, Landroid/content/pm/PackageParser$PackageParserException;

    const/16 v4, -0x67

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to collect certificates from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " using APK Signature Scheme v2"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5, v0}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "verifyFull":Z
    throw v3

    .line 337
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "verifyFull":Z
    :catch_4b
    move-exception v0

    .line 338
    .local v0, "e":Landroid/util/apk/SignatureNotFoundException;
    nop

    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "verifyFull":Z
    throw v0
    :try_end_4e
    .catchall {:try_start_2d .. :try_end_4e} :catchall_2a

    .line 345
    .end local v0    # "e":Landroid/util/apk/SignatureNotFoundException;
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "verifyFull":Z
    :goto_4e
    invoke-static {v1, v2}, Landroid/os/Trace;->traceEnd(J)V

    .line 346
    throw v0
.end method

.method private static blacklist verifyV3AndBelowSignatures(Ljava/lang/String;IZ)Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;
    .registers 8
    .param p0, "apkPath"    # Ljava/lang/String;
    .param p1, "minSignatureSchemeVersion"    # I
    .param p2, "verifyFull"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageParser$PackageParserException;
        }
    .end annotation

    .line 144
    :try_start_0
    invoke-static {p0, p2}, Landroid/util/apk/ApkSignatureVerifier;->verifyV3Signature(Ljava/lang/String;Z)Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;

    move-result-object v0
    :try_end_4
    .catch Landroid/util/apk/SignatureNotFoundException; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    .line 145
    :catch_5
    move-exception v0

    .line 147
    .local v0, "e":Landroid/util/apk/SignatureNotFoundException;
    const/4 v1, 0x3

    const/16 v2, -0x67

    if-ge p1, v1, :cond_6f

    .line 154
    .end local v0    # "e":Landroid/util/apk/SignatureNotFoundException;
    const-string v0, " or newer for package "

    const-string v1, "No signature found in package of version "

    const/4 v3, 0x2

    if-gt p1, v3, :cond_54

    .line 163
    :try_start_12
    invoke-static {p0, p2}, Landroid/util/apk/ApkSignatureVerifier;->verifyV2Signature(Ljava/lang/String;Z)Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;

    move-result-object v0
    :try_end_16
    .catch Landroid/util/apk/SignatureNotFoundException; {:try_start_12 .. :try_end_16} :catch_17

    return-object v0

    .line 164
    :catch_17
    move-exception v4

    .line 166
    .local v4, "e":Landroid/util/apk/SignatureNotFoundException;
    if-ge p1, v3, :cond_3d

    .line 173
    .end local v4    # "e":Landroid/util/apk/SignatureNotFoundException;
    const/4 v3, 0x1

    if-gt p1, v3, :cond_22

    .line 181
    invoke-static {p0, p2}, Landroid/util/apk/ApkSignatureVerifier;->verifyV1Signature(Ljava/lang/String;Z)Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;

    move-result-object v0

    return-object v0

    .line 175
    :cond_22
    new-instance v3, Landroid/content/pm/PackageParser$PackageParserException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v2, v0}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 167
    .restart local v4    # "e":Landroid/util/apk/SignatureNotFoundException;
    :cond_3d
    new-instance v0, Landroid/content/pm/PackageParser$PackageParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No APK Signature Scheme v2 signature in package "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v2, v1, v4}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 156
    .end local v4    # "e":Landroid/util/apk/SignatureNotFoundException;
    :cond_54
    new-instance v3, Landroid/content/pm/PackageParser$PackageParserException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v2, v0}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 148
    .restart local v0    # "e":Landroid/util/apk/SignatureNotFoundException;
    :cond_6f
    new-instance v1, Landroid/content/pm/PackageParser$PackageParserException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No APK Signature Scheme v3 signature in package "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static blacklist verifyV3Signature(Ljava/lang/String;Z)Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;
    .registers 11
    .param p0, "apkPath"    # Ljava/lang/String;
    .param p1, "verifyFull"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/util/apk/SignatureNotFoundException;,
            Landroid/content/pm/PackageParser$PackageParserException;
        }
    .end annotation

    .line 287
    if-eqz p1, :cond_6

    const-string/jumbo v0, "verifyV3"

    goto :goto_8

    :cond_6
    const-string v0, "certsOnlyV3"

    :goto_8
    const-wide/32 v1, 0x40000

    invoke-static {v1, v2, v0}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 290
    if-eqz p1, :cond_15

    :try_start_10
    invoke-static {p0}, Landroid/util/apk/ApkSignatureSchemeV3Verifier;->verify(Ljava/lang/String;)Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;

    move-result-object v0

    goto :goto_19

    .line 291
    :cond_15
    invoke-static {p0}, Landroid/util/apk/ApkSignatureSchemeV3Verifier;->unsafeGetCertsWithoutVerification(Ljava/lang/String;)Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;

    move-result-object v0

    :goto_19
    nop

    .line 293
    .local v0, "vSigner":Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;
    const/4 v3, 0x1

    new-array v3, v3, [[Ljava/security/cert/Certificate;

    const/4 v4, 0x0

    iget-object v5, v0, Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;->certs:[Ljava/security/cert/X509Certificate;

    aput-object v5, v3, v4

    .line 294
    .local v3, "signerCerts":[[Ljava/security/cert/Certificate;
    invoke-static {v3}, Landroid/util/apk/ApkSignatureVerifier;->convertToSignatures([[Ljava/security/cert/Certificate;)[Landroid/content/pm/Signature;

    move-result-object v4

    .line 295
    .local v4, "signerSigs":[Landroid/content/pm/Signature;
    const/4 v5, 0x0

    .line 296
    .local v5, "pastSignerSigs":[Landroid/content/pm/Signature;
    iget-object v6, v0, Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;->por:Landroid/util/apk/ApkSigningBlockUtils$VerifiedProofOfRotation;

    if-eqz v6, :cond_65

    .line 298
    iget-object v6, v0, Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;->por:Landroid/util/apk/ApkSigningBlockUtils$VerifiedProofOfRotation;

    iget-object v6, v6, Landroid/util/apk/ApkSigningBlockUtils$VerifiedProofOfRotation;->certs:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [Landroid/content/pm/Signature;

    move-object v5, v6

    .line 299
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_37
    array-length v7, v5

    if-ge v6, v7, :cond_65

    .line 300
    new-instance v7, Landroid/content/pm/Signature;

    iget-object v8, v0, Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;->por:Landroid/util/apk/ApkSigningBlockUtils$VerifiedProofOfRotation;

    iget-object v8, v8, Landroid/util/apk/ApkSigningBlockUtils$VerifiedProofOfRotation;->certs:Ljava/util/List;

    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/security/cert/X509Certificate;

    invoke-virtual {v8}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/content/pm/Signature;-><init>([B)V

    aput-object v7, v5, v6

    .line 301
    aget-object v7, v5, v6

    iget-object v8, v0, Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;->por:Landroid/util/apk/ApkSigningBlockUtils$VerifiedProofOfRotation;

    iget-object v8, v8, Landroid/util/apk/ApkSigningBlockUtils$VerifiedProofOfRotation;->flagsList:Ljava/util/List;

    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/content/pm/Signature;->setFlags(I)V

    .line 299
    add-int/lit8 v6, v6, 0x1

    goto :goto_37

    .line 304
    .end local v6    # "i":I
    :cond_65
    new-instance v6, Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;

    new-instance v7, Landroid/content/pm/PackageParser$SigningDetails;

    const/4 v8, 0x3

    invoke-direct {v7, v4, v8, v5}, Landroid/content/pm/PackageParser$SigningDetails;-><init>([Landroid/content/pm/Signature;I[Landroid/content/pm/Signature;)V

    iget-object v8, v0, Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;->contentDigests:Ljava/util/Map;

    invoke-direct {v6, v7, v8}, Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;-><init>(Landroid/content/pm/PackageParser$SigningDetails;Ljava/util/Map;)V
    :try_end_72
    .catch Landroid/util/apk/SignatureNotFoundException; {:try_start_10 .. :try_end_72} :catch_97
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_72} :catch_78
    .catchall {:try_start_10 .. :try_end_72} :catchall_76

    .line 315
    invoke-static {v1, v2}, Landroid/os/Trace;->traceEnd(J)V

    .line 304
    return-object v6

    .line 315
    .end local v0    # "vSigner":Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;
    .end local v3    # "signerCerts":[[Ljava/security/cert/Certificate;
    .end local v4    # "signerSigs":[Landroid/content/pm/Signature;
    .end local v5    # "pastSignerSigs":[Landroid/content/pm/Signature;
    :catchall_76
    move-exception v0

    goto :goto_9a

    .line 309
    :catch_78
    move-exception v0

    .line 311
    .local v0, "e":Ljava/lang/Exception;
    :try_start_79
    new-instance v3, Landroid/content/pm/PackageParser$PackageParserException;

    const/16 v4, -0x67

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to collect certificates from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " using APK Signature Scheme v3"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5, v0}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "verifyFull":Z
    throw v3

    .line 307
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "verifyFull":Z
    :catch_97
    move-exception v0

    .line 308
    .local v0, "e":Landroid/util/apk/SignatureNotFoundException;
    nop

    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "verifyFull":Z
    throw v0
    :try_end_9a
    .catchall {:try_start_79 .. :try_end_9a} :catchall_76

    .line 315
    .end local v0    # "e":Landroid/util/apk/SignatureNotFoundException;
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "verifyFull":Z
    :goto_9a
    invoke-static {v1, v2}, Landroid/os/Trace;->traceEnd(J)V

    .line 316
    throw v0
.end method

.method private static blacklist verifyV4Signature(Ljava/lang/String;IZ)Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;
    .registers 18
    .param p0, "apkPath"    # Ljava/lang/String;
    .param p1, "minSignatureSchemeVersion"    # I
    .param p2, "verifyFull"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/util/apk/SignatureNotFoundException;,
            Landroid/content/pm/PackageParser$PackageParserException;
        }
    .end annotation

    .line 195
    move-object v1, p0

    if-eqz p2, :cond_7

    const-string/jumbo v0, "verifyV4"

    goto :goto_9

    :cond_7
    const-string v0, "certsOnlyV4"

    :goto_9
    const-wide/32 v2, 0x40000

    invoke-static {v2, v3, v0}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 197
    nop

    .line 198
    :try_start_10
    invoke-static {p0}, Landroid/util/apk/ApkSignatureSchemeV4Verifier;->extractCertificates(Ljava/lang/String;)Landroid/util/apk/ApkSignatureSchemeV4Verifier$VerifiedSigner;

    move-result-object v0

    move-object v4, v0

    .line 199
    .local v4, "vSigner":Landroid/util/apk/ApkSignatureSchemeV4Verifier$VerifiedSigner;
    const/4 v0, 0x1

    new-array v5, v0, [[Ljava/security/cert/Certificate;

    iget-object v6, v4, Landroid/util/apk/ApkSignatureSchemeV4Verifier$VerifiedSigner;->certs:[Ljava/security/cert/Certificate;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    .line 200
    .local v5, "signerCerts":[[Ljava/security/cert/Certificate;
    invoke-static {v5}, Landroid/util/apk/ApkSignatureVerifier;->convertToSignatures([[Ljava/security/cert/Certificate;)[Landroid/content/pm/Signature;

    move-result-object v6
    :try_end_21
    .catch Landroid/util/apk/SignatureNotFoundException; {:try_start_10 .. :try_end_21} :catch_12e
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_21} :catch_10f
    .catchall {:try_start_10 .. :try_end_21} :catchall_10d

    .line 201
    .local v6, "signerSigs":[Landroid/content/pm/Signature;
    const/4 v8, 0x0

    .line 203
    .local v8, "pastSignerSigs":[Landroid/content/pm/Signature;
    if-eqz p2, :cond_fc

    .line 210
    nop

    .line 211
    :try_start_25
    invoke-static {p0}, Landroid/util/apk/ApkSignatureSchemeV3Verifier;->unsafeGetCertsWithoutVerification(Ljava/lang/String;)Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;

    move-result-object v9

    .line 212
    .local v9, "v3Signer":Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;
    iget-object v10, v9, Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;->contentDigests:Ljava/util/Map;

    .line 213
    .local v10, "nonstreamingDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[B>;"
    new-array v0, v0, [[Ljava/security/cert/Certificate;

    iget-object v11, v9, Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;->certs:[Ljava/security/cert/X509Certificate;

    aput-object v11, v0, v7

    .line 214
    .local v0, "nonstreamingCerts":[[Ljava/security/cert/Certificate;
    iget-object v11, v9, Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;->por:Landroid/util/apk/ApkSigningBlockUtils$VerifiedProofOfRotation;

    if-eqz v11, :cond_6f

    .line 216
    iget-object v11, v9, Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;->por:Landroid/util/apk/ApkSigningBlockUtils$VerifiedProofOfRotation;

    iget-object v11, v11, Landroid/util/apk/ApkSigningBlockUtils$VerifiedProofOfRotation;->certs:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    new-array v11, v11, [Landroid/content/pm/Signature;

    move-object v8, v11

    .line 217
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_41
    array-length v12, v8

    if-ge v11, v12, :cond_6f

    .line 218
    new-instance v12, Landroid/content/pm/Signature;

    iget-object v13, v9, Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;->por:Landroid/util/apk/ApkSigningBlockUtils$VerifiedProofOfRotation;

    iget-object v13, v13, Landroid/util/apk/ApkSigningBlockUtils$VerifiedProofOfRotation;->certs:Ljava/util/List;

    .line 219
    invoke-interface {v13, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/security/cert/X509Certificate;

    invoke-virtual {v13}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v13

    invoke-direct {v12, v13}, Landroid/content/pm/Signature;-><init>([B)V

    aput-object v12, v8, v11

    .line 220
    aget-object v12, v8, v11

    iget-object v13, v9, Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;->por:Landroid/util/apk/ApkSigningBlockUtils$VerifiedProofOfRotation;

    iget-object v13, v13, Landroid/util/apk/ApkSigningBlockUtils$VerifiedProofOfRotation;->flagsList:Ljava/util/List;

    invoke-interface {v13, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-virtual {v12, v13}, Landroid/content/pm/Signature;->setFlags(I)V
    :try_end_6c
    .catch Landroid/util/apk/SignatureNotFoundException; {:try_start_25 .. :try_end_6c} :catch_70
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_6c} :catch_10f
    .catchall {:try_start_25 .. :try_end_6c} :catchall_10d

    .line 217
    add-int/lit8 v11, v11, 0x1

    goto :goto_41

    .line 234
    .end local v9    # "v3Signer":Landroid/util/apk/ApkSignatureSchemeV3Verifier$VerifiedSigner;
    .end local v11    # "i":I
    :cond_6f
    goto :goto_7d

    .line 223
    .end local v0    # "nonstreamingCerts":[[Ljava/security/cert/Certificate;
    .end local v10    # "nonstreamingDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[B>;"
    :catch_70
    move-exception v0

    move-object v9, v0

    .line 225
    .local v9, "e":Landroid/util/apk/SignatureNotFoundException;
    nop

    .line 226
    :try_start_73
    invoke-static {p0, v7}, Landroid/util/apk/ApkSignatureSchemeV2Verifier;->verify(Ljava/lang/String;Z)Landroid/util/apk/ApkSignatureSchemeV2Verifier$VerifiedSigner;

    move-result-object v0

    .line 227
    .local v0, "v2Signer":Landroid/util/apk/ApkSignatureSchemeV2Verifier$VerifiedSigner;
    iget-object v7, v0, Landroid/util/apk/ApkSignatureSchemeV2Verifier$VerifiedSigner;->contentDigests:Ljava/util/Map;

    move-object v10, v7

    .line 228
    .restart local v10    # "nonstreamingDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[B>;"
    iget-object v7, v0, Landroid/util/apk/ApkSignatureSchemeV2Verifier$VerifiedSigner;->certs:[[Ljava/security/cert/X509Certificate;
    :try_end_7c
    .catch Landroid/util/apk/SignatureNotFoundException; {:try_start_73 .. :try_end_7c} :catch_e4
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_7c} :catch_10f
    .catchall {:try_start_73 .. :try_end_7c} :catchall_10d

    .line 233
    .end local v0    # "v2Signer":Landroid/util/apk/ApkSignatureSchemeV2Verifier$VerifiedSigner;
    .local v7, "nonstreamingCerts":[[Ljava/security/cert/Certificate;
    move-object v0, v7

    .line 236
    .end local v7    # "nonstreamingCerts":[[Ljava/security/cert/Certificate;
    .end local v9    # "e":Landroid/util/apk/SignatureNotFoundException;
    .local v0, "nonstreamingCerts":[[Ljava/security/cert/Certificate;
    :goto_7d
    :try_start_7d
    invoke-static {v0}, Landroid/util/apk/ApkSignatureVerifier;->convertToSignatures([[Ljava/security/cert/Certificate;)[Landroid/content/pm/Signature;

    move-result-object v7

    .line 237
    .local v7, "nonstreamingSigs":[Landroid/content/pm/Signature;
    array-length v9, v7

    array-length v11, v6

    if-ne v9, v11, :cond_cc

    .line 242
    const/4 v9, 0x0

    .local v9, "i":I
    array-length v11, v6

    .local v11, "size":I
    :goto_87
    if-ge v9, v11, :cond_9e

    .line 243
    aget-object v12, v7, v9

    aget-object v13, v6, v9

    invoke-virtual {v12, v13}, Landroid/content/pm/Signature;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_96

    .line 242
    add-int/lit8 v9, v9, 0x1

    goto :goto_87

    .line 244
    :cond_96
    new-instance v12, Ljava/lang/SecurityException;

    const-string v13, "V4 signature certificate does not match V2/V3"

    invoke-direct {v12, v13}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "minSignatureSchemeVersion":I
    .end local p2    # "verifyFull":Z
    throw v12

    .line 249
    .end local v9    # "i":I
    .end local v11    # "size":I
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "minSignatureSchemeVersion":I
    .restart local p2    # "verifyFull":Z
    :cond_9e
    const/4 v9, 0x0

    .line 250
    .local v9, "found":Z
    invoke-interface {v10}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_a7
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_c1

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [B

    .line 251
    .local v12, "nonstreamingDigest":[B
    iget-object v13, v4, Landroid/util/apk/ApkSignatureSchemeV4Verifier$VerifiedSigner;->apkDigest:[B

    iget-object v14, v4, Landroid/util/apk/ApkSignatureSchemeV4Verifier$VerifiedSigner;->apkDigest:[B

    array-length v14, v14

    invoke-static {v13, v12, v14}, Lcom/android/internal/util/ArrayUtils;->equals([B[BI)Z

    move-result v13

    if-eqz v13, :cond_c0

    .line 253
    const/4 v9, 0x1

    .line 254
    goto :goto_c1

    .line 256
    .end local v12    # "nonstreamingDigest":[B
    :cond_c0
    goto :goto_a7

    .line 257
    :cond_c1
    :goto_c1
    if-eqz v9, :cond_c4

    goto :goto_fc

    .line 258
    :cond_c4
    new-instance v11, Ljava/lang/SecurityException;

    const-string v12, "APK digest in V4 signature does not match V2/V3"

    invoke-direct {v11, v12}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "minSignatureSchemeVersion":I
    .end local p2    # "verifyFull":Z
    throw v11

    .line 238
    .end local v9    # "found":Z
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "minSignatureSchemeVersion":I
    .restart local p2    # "verifyFull":Z
    :cond_cc
    new-instance v9, Ljava/lang/SecurityException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Invalid number of certificates: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v12, v7

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v11}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "minSignatureSchemeVersion":I
    .end local p2    # "verifyFull":Z
    throw v9

    .line 229
    .end local v0    # "nonstreamingCerts":[[Ljava/security/cert/Certificate;
    .end local v7    # "nonstreamingSigs":[Landroid/content/pm/Signature;
    .end local v10    # "nonstreamingDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[B>;"
    .local v9, "e":Landroid/util/apk/SignatureNotFoundException;
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "minSignatureSchemeVersion":I
    .restart local p2    # "verifyFull":Z
    :catch_e4
    move-exception v0

    .line 230
    .local v0, "ee":Landroid/util/apk/SignatureNotFoundException;
    new-instance v7, Ljava/lang/SecurityException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "V4 verification failed to collect V2/V3 certificates from : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v7, v10, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "minSignatureSchemeVersion":I
    .end local p2    # "verifyFull":Z
    throw v7

    .line 262
    .end local v0    # "ee":Landroid/util/apk/SignatureNotFoundException;
    .end local v9    # "e":Landroid/util/apk/SignatureNotFoundException;
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "minSignatureSchemeVersion":I
    .restart local p2    # "verifyFull":Z
    :cond_fc
    :goto_fc
    new-instance v0, Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;

    new-instance v7, Landroid/content/pm/PackageParser$SigningDetails;

    const/4 v9, 0x4

    invoke-direct {v7, v6, v9, v8}, Landroid/content/pm/PackageParser$SigningDetails;-><init>([Landroid/content/pm/Signature;I[Landroid/content/pm/Signature;)V

    iget-object v9, v4, Landroid/util/apk/ApkSignatureSchemeV4Verifier$VerifiedSigner;->contentDigests:Ljava/util/Map;

    invoke-direct {v0, v7, v9}, Landroid/util/apk/ApkSignatureVerifier$SigningDetailsWithDigests;-><init>(Landroid/content/pm/PackageParser$SigningDetails;Ljava/util/Map;)V
    :try_end_109
    .catch Landroid/util/apk/SignatureNotFoundException; {:try_start_7d .. :try_end_109} :catch_12e
    .catch Ljava/lang/Exception; {:try_start_7d .. :try_end_109} :catch_10f
    .catchall {:try_start_7d .. :try_end_109} :catchall_10d

    .line 273
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 262
    return-object v0

    .line 273
    .end local v4    # "vSigner":Landroid/util/apk/ApkSignatureSchemeV4Verifier$VerifiedSigner;
    .end local v5    # "signerCerts":[[Ljava/security/cert/Certificate;
    .end local v6    # "signerSigs":[Landroid/content/pm/Signature;
    .end local v8    # "pastSignerSigs":[Landroid/content/pm/Signature;
    :catchall_10d
    move-exception v0

    goto :goto_131

    .line 267
    :catch_10f
    move-exception v0

    .line 269
    .local v0, "e":Ljava/lang/Exception;
    :try_start_110
    new-instance v4, Landroid/content/pm/PackageParser$PackageParserException;

    const/16 v5, -0x67

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to collect certificates from "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " using APK Signature Scheme v4"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, v0}, Landroid/content/pm/PackageParser$PackageParserException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "minSignatureSchemeVersion":I
    .end local p2    # "verifyFull":Z
    throw v4

    .line 265
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "minSignatureSchemeVersion":I
    .restart local p2    # "verifyFull":Z
    :catch_12e
    move-exception v0

    .line 266
    .local v0, "e":Landroid/util/apk/SignatureNotFoundException;
    nop

    .end local p0    # "apkPath":Ljava/lang/String;
    .end local p1    # "minSignatureSchemeVersion":I
    .end local p2    # "verifyFull":Z
    throw v0
    :try_end_131
    .catchall {:try_start_110 .. :try_end_131} :catchall_10d

    .line 273
    .end local v0    # "e":Landroid/util/apk/SignatureNotFoundException;
    .restart local p0    # "apkPath":Ljava/lang/String;
    .restart local p1    # "minSignatureSchemeVersion":I
    .restart local p2    # "verifyFull":Z
    :goto_131
    invoke-static {v2, v3}, Landroid/os/Trace;->traceEnd(J)V

    .line 274
    throw v0
.end method
