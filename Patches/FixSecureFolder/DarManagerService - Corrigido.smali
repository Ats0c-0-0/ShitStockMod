.class public Lcom/android/server/knox/dar/DarManagerService;
.super Lcom/samsung/android/knox/dar/IDarManagerService$Stub;
.source "DarManagerService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/knox/dar/DarManagerService$DarHandler;,
        Lcom/android/server/knox/dar/DarManagerService$Injector;
    }
.end annotation


# static fields
.field private static final ALIAS_KNOX_TEST_KEY:Ljava/lang/String; = "KnoxTestKey"

.field private static final DAR_SUPPORT_VIRTUAL_LOCK:Z = true

.field public static final DEFAULT_KEY_LEN:I = 0x20

.field private static final MSG_SET_RESET_TOKEN_FOR_LEGACY:I = 0x76

.field private static final MSG_UNLOCK_SECURE_FOLDER_WITH_TOKEN:I = 0x96

.field private static final NULL_USER:Landroid/content/pm/UserInfo;

.field private static final SERVICE_NAME:Ljava/lang/String; = "DarManagerService"

.field private static final TAG_DAR:Ljava/lang/String; = "DarManagerService"

.field private static final TAG_DUAL_DAR:Ljava/lang/String; = "DarManagerService_DUAL_DAR"

.field private static final TAG_SDP:Ljava/lang/String; = "DarManagerService_SDP"

.field private static mSystemReady:Z


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mDarDatabaseCache:Lcom/android/server/knox/dar/DarDatabaseCache;

.field private mDarHandler:Lcom/android/server/knox/dar/DarManagerService$DarHandler;

.field private final mDeviceEmergencyModeLock:Ljava/lang/Object;

.field private mDualDarManagerImpl:Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

.field private mEscrowTokenStateChangeCallback:Lcom/android/internal/widget/LockPatternUtils$EscrowTokenStateChangeCallback;

.field private mHandlerThread:Landroid/os/HandlerThread;

.field private final mInjector:Lcom/android/server/knox/dar/DarManagerService$Injector;

.field private mKeyProtector:Lcom/android/server/knox/dar/KeyProtector;

.field private final mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

.field private mSdpManagerImpl:Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

.field private mUserManager:Landroid/os/UserManager;

.field private mVirtualLockImpl:Lcom/android/server/knox/dar/VirtualLockImpl;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 92
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/server/knox/dar/DarManagerService;->mSystemReady:Z

    .line 108
    new-instance v1, Landroid/content/pm/UserInfo;

    const/16 v2, -0x2710

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, v3, v0}, Landroid/content/pm/UserInfo;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    sput-object v1, Lcom/android/server/knox/dar/DarManagerService;->NULL_USER:Landroid/content/pm/UserInfo;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .line 118
    invoke-direct {p0}, Lcom/samsung/android/knox/dar/IDarManagerService$Stub;-><init>()V

    .line 101
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mKeyProtector:Lcom/android/server/knox/dar/KeyProtector;

    .line 102
    iput-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mUserManager:Landroid/os/UserManager;

    .line 103
    iput-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mHandlerThread:Landroid/os/HandlerThread;

    .line 104
    iput-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mDarHandler:Lcom/android/server/knox/dar/DarManagerService$DarHandler;

    .line 105
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mDeviceEmergencyModeLock:Ljava/lang/Object;

    .line 221
    new-instance v0, Lcom/android/server/knox/dar/DarManagerService$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/android/server/knox/dar/DarManagerService$$ExternalSyntheticLambda1;-><init>(Lcom/android/server/knox/dar/DarManagerService;)V

    iput-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mEscrowTokenStateChangeCallback:Lcom/android/internal/widget/LockPatternUtils$EscrowTokenStateChangeCallback;

    .line 119
    const-string v0, "DarManagerService"

    const-string v1, "DarManagerService init"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    iput-object p1, p0, Lcom/android/server/knox/dar/DarManagerService;->mContext:Landroid/content/Context;

    .line 122
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->systemReady()V

    .line 123
    new-instance v0, Lcom/android/internal/widget/LockPatternUtils;

    invoke-direct {v0, p1}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 124
    new-instance v0, Lcom/android/server/knox/dar/DarDatabaseCache;

    invoke-direct {v0, p1}, Lcom/android/server/knox/dar/DarDatabaseCache;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mDarDatabaseCache:Lcom/android/server/knox/dar/DarDatabaseCache;

    .line 126
    new-instance v0, Lcom/android/server/knox/dar/DarManagerService$Injector;

    invoke-direct {v0, p0}, Lcom/android/server/knox/dar/DarManagerService$Injector;-><init>(Lcom/android/server/knox/dar/DarManagerService;)V

    iput-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mInjector:Lcom/android/server/knox/dar/DarManagerService$Injector;

    .line 129
    new-instance v1, Lcom/android/server/knox/dar/VirtualLockImpl;

    invoke-direct {v1, v0}, Lcom/android/server/knox/dar/VirtualLockImpl;-><init>(Lcom/android/server/knox/dar/DarManagerService$Injector;)V

    iput-object v1, p0, Lcom/android/server/knox/dar/DarManagerService;->mVirtualLockImpl:Lcom/android/server/knox/dar/VirtualLockImpl;

    .line 132
    new-instance v1, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    invoke-direct {v1, v0}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;-><init>(Lcom/android/server/knox/dar/DarManagerService$Injector;)V

    iput-object v1, p0, Lcom/android/server/knox/dar/DarManagerService;->mSdpManagerImpl:Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    .line 133
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->prepareSdpService()V

    .line 136
    new-instance v1, Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    invoke-direct {v1, v0}, Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;-><init>(Lcom/android/server/knox/dar/DarManagerService$Injector;)V

    iput-object v1, p0, Lcom/android/server/knox/dar/DarManagerService;->mDualDarManagerImpl:Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    .line 137
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->prepareDualDARService()V

    .line 139
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/knox/dar/DarManagerService;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/android/server/knox/dar/DarManagerService;

    .line 75
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/server/knox/dar/DarManagerService;)Lcom/android/server/knox/dar/DarDatabaseCache;
    .registers 2
    .param p0, "x0"    # Lcom/android/server/knox/dar/DarManagerService;

    .line 75
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mDarDatabaseCache:Lcom/android/server/knox/dar/DarDatabaseCache;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/server/knox/dar/DarManagerService;)Lcom/android/internal/widget/LockPatternUtils;
    .registers 2
    .param p0, "x0"    # Lcom/android/server/knox/dar/DarManagerService;

    .line 75
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/server/knox/dar/DarManagerService;)Lcom/android/internal/widget/LockPatternUtils$EscrowTokenStateChangeCallback;
    .registers 2
    .param p0, "x0"    # Lcom/android/server/knox/dar/DarManagerService;

    .line 75
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mEscrowTokenStateChangeCallback:Lcom/android/internal/widget/LockPatternUtils$EscrowTokenStateChangeCallback;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/server/knox/dar/DarManagerService;ILjava/lang/String;)V
    .registers 3
    .param p0, "x0"    # Lcom/android/server/knox/dar/DarManagerService;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;

    .line 75
    invoke-direct {p0, p1, p2}, Lcom/android/server/knox/dar/DarManagerService;->handleSetResetTokenForLegacy(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/server/knox/dar/DarManagerService;I)V
    .registers 2
    .param p0, "x0"    # Lcom/android/server/knox/dar/DarManagerService;
    .param p1, "x1"    # I

    .line 75
    invoke-direct {p0, p1}, Lcom/android/server/knox/dar/DarManagerService;->handleUnlockSecureFolderWithToken(I)V

    return-void
.end method

.method private checkDeviceIntegrity([Ljava/security/cert/Certificate;)Z
    .registers 7
    .param p1, "certs"    # [Ljava/security/cert/Certificate;

    .line 298
    const/4 v0, 0x0

    aget-object v1, p1, v0

    check-cast v1, Ljava/security/cert/X509Certificate;

    .line 302
    .local v1, "leafCert":Ljava/security/cert/X509Certificate;
    :try_start_5
    new-instance v2, Lcom/android/server/knox/dar/AttestedCertParser;

    invoke-direct {v2, v1}, Lcom/android/server/knox/dar/AttestedCertParser;-><init>(Ljava/security/cert/X509Certificate;)V

    .line 303
    .local v2, "acp":Lcom/android/server/knox/dar/AttestedCertParser;
    invoke-virtual {v2}, Lcom/android/server/knox/dar/AttestedCertParser;->getIntegrityStatus()Lcom/android/server/knox/dar/IntegrityStatus;

    move-result-object v3

    .line 304
    .local v3, "status":Lcom/android/server/knox/dar/IntegrityStatus;
    if-eqz v3, :cond_1e

    .line 305
    invoke-virtual {v3}, Lcom/android/server/knox/dar/IntegrityStatus;->getWarranty()I

    move-result v4

    if-nez v4, :cond_1e

    .line 306
    invoke-virtual {v3}, Lcom/android/server/knox/dar/IntegrityStatus;->getTrustBoot()I

    move-result v4
    :try_end_1a
    .catch Ljava/security/cert/CertificateParsingException; {:try_start_5 .. :try_end_1a} :catch_1f

    if-nez v4, :cond_1e

    .line 307
    const/4 v0, 0x1

    return v0

    .line 311
    :cond_1e
    goto :goto_23

    .line 309
    .end local v2    # "acp":Lcom/android/server/knox/dar/AttestedCertParser;
    .end local v3    # "status":Lcom/android/server/knox/dar/IntegrityStatus;
    :catch_1f
    move-exception v2

    .line 310
    .local v2, "e":Ljava/security/cert/CertificateParsingException;
    invoke-virtual {v2}, Ljava/security/cert/CertificateParsingException;->printStackTrace()V

    .line 313
    .end local v2    # "e":Ljava/security/cert/CertificateParsingException;
    :goto_23
    return v0
.end method

.method private checkSystemPermission()Z
    .registers 4

    .line 340
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    const/16 v1, 0x3e8

    if-ne v0, v1, :cond_a

    .line 345
    const/4 v0, 0x1

    return v0

    .line 341
    :cond_a
    const-string v0, "DarManagerService"

    const-string v1, "Require system permission."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    new-instance v0, Ljava/lang/SecurityException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Security Exception Occurred in pid["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] with uid["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private doesSpecificKeyExist(Ljava/lang/String;I)Z
    .registers 4
    .param p1, "alias"    # Ljava/lang/String;
    .param p2, "userId"    # I

    .line 510
    invoke-static {p1}, Lcom/android/server/knox/dar/SecureUtil;->isEmpty(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 511
    const/4 v0, 0x0

    return v0

    .line 513
    :cond_8
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mKeyProtector:Lcom/android/server/knox/dar/KeyProtector;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/KeyProtector;->exists(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method static fileRead(Ljava/lang/String;)[B
    .registers 6
    .param p0, "path"    # Ljava/lang/String;

    .line 434
    const/4 v0, 0x0

    if-eqz p0, :cond_39

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    goto :goto_39

    .line 438
    :cond_a
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 439
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_16

    .line 440
    return-object v0

    .line 443
    :cond_16
    const/4 v0, 0x0

    .line 444
    .local v0, "payload":[B
    :try_start_17
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_1c} :catch_34

    .line 445
    .local v2, "fis":Ljava/io/FileInputStream;
    :try_start_1c
    invoke-virtual {v2}, Ljava/io/FileInputStream;->available()I

    move-result v3

    .line 446
    .local v3, "length":I
    new-array v4, v3, [B

    .line 447
    .local v4, "buffer":[B
    invoke-virtual {v2, v4}, Ljava/io/FileInputStream;->read([B)I
    :try_end_25
    .catchall {:try_start_1c .. :try_end_25} :catchall_2a

    .line 448
    move-object v0, v4

    .line 449
    .end local v3    # "length":I
    .end local v4    # "buffer":[B
    :try_start_26
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_29} :catch_34

    .line 451
    .end local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_38

    .line 444
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    :catchall_2a
    move-exception v3

    :try_start_2b
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_2e
    .catchall {:try_start_2b .. :try_end_2e} :catchall_2f

    goto :goto_33

    :catchall_2f
    move-exception v4

    :try_start_30
    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "payload":[B
    .end local v1    # "file":Ljava/io/File;
    .end local p0    # "path":Ljava/lang/String;
    :goto_33
    throw v3
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_34} :catch_34

    .line 449
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v0    # "payload":[B
    .restart local v1    # "file":Ljava/io/File;
    .restart local p0    # "path":Ljava/lang/String;
    :catch_34
    move-exception v2

    .line 450
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 452
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_38
    return-object v0

    .line 435
    .end local v0    # "payload":[B
    .end local v1    # "file":Ljava/io/File;
    :cond_39
    :goto_39
    return-object v0
.end method

.method static fileWrite(Ljava/lang/String;[B)Z
    .registers 7
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "payload"    # [B

    .line 465
    if-eqz p0, :cond_30

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_30

    if-nez p1, :cond_b

    goto :goto_30

    .line 468
    :cond_b
    const/4 v0, 0x0

    .line 469
    .local v0, "result":Z
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 471
    .local v1, "file":Ljava/io/File;
    :try_start_11
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_16} :catch_2b

    .line 472
    .local v2, "fos":Ljava/io/FileOutputStream;
    :try_start_16
    invoke-virtual {v2, p1}, Ljava/io/FileOutputStream;->write([B)V

    .line 473
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V
    :try_end_1c
    .catchall {:try_start_16 .. :try_end_1c} :catchall_21

    .line 474
    const/4 v0, 0x1

    .line 475
    :try_start_1d
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_20} :catch_2b

    .line 477
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    goto :goto_2f

    .line 471
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    :catchall_21
    move-exception v3

    :try_start_22
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_25
    .catchall {:try_start_22 .. :try_end_25} :catchall_26

    goto :goto_2a

    :catchall_26
    move-exception v4

    :try_start_27
    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "result":Z
    .end local v1    # "file":Ljava/io/File;
    .end local p0    # "path":Ljava/lang/String;
    .end local p1    # "payload":[B
    :goto_2a
    throw v3
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_2b} :catch_2b

    .line 475
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v0    # "result":Z
    .restart local v1    # "file":Ljava/io/File;
    .restart local p0    # "path":Ljava/lang/String;
    .restart local p1    # "payload":[B
    :catch_2b
    move-exception v2

    .line 476
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 478
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_2f
    return v0

    .line 466
    .end local v0    # "result":Z
    .end local v1    # "file":Ljava/io/File;
    :cond_30
    :goto_30
    const/4 v0, 0x0

    return v0
.end method

.method private generateAndSaveSpecificKey(Ljava/lang/String;I)Z
    .registers 5
    .param p1, "alias"    # Ljava/lang/String;
    .param p2, "userId"    # I

    .line 517
    const/16 v0, 0x20

    invoke-static {v0}, Lcom/android/server/knox/dar/SecureUtil;->generateRandomBytes(I)[B

    move-result-object v0

    .line 519
    .local v0, "specificKey":[B
    :try_start_6
    invoke-static {p1}, Lcom/android/server/knox/dar/SecureUtil;->isEmpty(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18

    .line 520
    invoke-direct {p0, v0, p1, p2}, Lcom/android/server/knox/dar/DarManagerService;->saveSpecificKeyViaProtector([BLjava/lang/String;I)Z

    move-result v1

    invoke-static {v1}, Lcom/android/server/knox/dar/SecureUtil;->record(Z)Z

    move-result v1
    :try_end_14
    .catchall {:try_start_6 .. :try_end_14} :catchall_1d

    if-eqz v1, :cond_18

    const/4 v1, 0x1

    goto :goto_19

    :cond_18
    const/4 v1, 0x0

    .line 523
    :goto_19
    invoke-static {v0}, Lcom/android/server/knox/dar/SecureUtil;->clear([B)V

    .line 519
    return v1

    .line 523
    :catchall_1d
    move-exception v1

    invoke-static {v0}, Lcom/android/server/knox/dar/SecureUtil;->clear([B)V

    .line 524
    throw v1
.end method

.method private getSpecificKeyViaProtector(Ljava/lang/String;I)[B
    .registers 6
    .param p1, "alias"    # Ljava/lang/String;
    .param p2, "userId"    # I

    .line 488
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 490
    .local v0, "identity":J
    :try_start_4
    iget-object v2, p0, Lcom/android/server/knox/dar/DarManagerService;->mKeyProtector:Lcom/android/server/knox/dar/KeyProtector;

    invoke-virtual {v2, p1, p2}, Lcom/android/server/knox/dar/KeyProtector;->release(Ljava/lang/String;I)[B

    move-result-object v2
    :try_end_a
    .catchall {:try_start_4 .. :try_end_a} :catchall_e

    .line 492
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 490
    return-object v2

    .line 492
    :catchall_e
    move-exception v2

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 493
    throw v2
.end method

.method private getUserInfo(I)Landroid/content/pm/UserInfo;
    .registers 6
    .param p1, "userId"    # I

    .line 356
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 358
    .local v0, "identity":J
    iget-object v2, p0, Lcom/android/server/knox/dar/DarManagerService;->mUserManager:Landroid/os/UserManager;

    if-eqz v2, :cond_d

    invoke-virtual {v2, p1}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v2

    goto :goto_e

    :cond_d
    const/4 v2, 0x0

    .line 359
    .local v2, "ui":Landroid/content/pm/UserInfo;
    :goto_e
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 360
    if-eqz v2, :cond_15

    move-object v3, v2

    goto :goto_17

    :cond_15
    sget-object v3, Lcom/android/server/knox/dar/DarManagerService;->NULL_USER:Landroid/content/pm/UserInfo;

    :goto_17
    return-object v3
.end method

.method private getUserManager()Landroid/os/UserManager;
    .registers 3

    .line 349
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mUserManager:Landroid/os/UserManager;

    if-nez v0, :cond_11

    .line 350
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "user"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    iput-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mUserManager:Landroid/os/UserManager;

    .line 352
    :cond_11
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mUserManager:Landroid/os/UserManager;

    return-object v0
.end method

.method private getVirtualLock()Lcom/android/server/knox/dar/VirtualLockImpl;
    .registers 2

    .line 819
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mVirtualLockImpl:Lcom/android/server/knox/dar/VirtualLockImpl;

    return-object v0
.end method

.method private handleSetResetTokenForLegacy(ILjava/lang/String;)V
    .registers 20
    .param p1, "userId"    # I
    .param p2, "resetToken"    # Ljava/lang/String;

    .line 638
    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v3, p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Set reset token for Legacy User "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "DarManagerService"

    invoke-static {v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 639
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "token : "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ", userId : "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 641
    const/4 v5, 0x0

    .line 642
    .local v5, "ui":Landroid/content/pm/UserInfo;
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v6

    .line 644
    .local v6, "identity":J
    :try_start_3e
    invoke-direct/range {p0 .. p0}, Lcom/android/server/knox/dar/DarManagerService;->getUserManager()Landroid/os/UserManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v0
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_46} :catch_4e
    .catchall {:try_start_3e .. :try_end_46} :catchall_4b

    move-object v5, v0

    .line 649
    :goto_47
    invoke-static {v6, v7}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 650
    goto :goto_67

    .line 649
    :catchall_4b
    move-exception v0

    goto/16 :goto_145

    .line 645
    :catch_4e
    move-exception v0

    .line 646
    .local v0, "e":Ljava/lang/Exception;
    :try_start_4f
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "exception occurred during getUserInfo for Legacy user "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 647
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_66
    .catchall {:try_start_4f .. :try_end_66} :catchall_4b

    .end local v0    # "e":Ljava/lang/Exception;
    goto :goto_47

    .line 652
    :goto_67
    if-nez v5, :cond_7f

    .line 653
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "handle reset Token getUserInfo failed. "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 654
    return-void

    .line 657
    :cond_7f
    invoke-static {v5}, Lcom/android/server/knox/dar/DarUtil;->isLegacyContainerUser(Landroid/content/pm/UserInfo;)Z

    move-result v0

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-nez v0, :cond_99

    .line 658
    new-array v0, v9, [Ljava/lang/Object;

    .line 659
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v0, v8

    .line 658
    const-string v8, "On created - User %d workspace identified as new-fashioned"

    invoke-static {v8, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 667
    return-void

    .line 670
    :cond_99
    new-array v0, v9, [Ljava/lang/Object;

    .line 671
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v0, v8

    .line 670
    const-string v10, "On created - User %d workspace identified as old-fashioned"

    invoke-static {v10, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 673
    invoke-static/range {p2 .. p2}, Lcom/android/server/knox/dar/SecureUtil;->isEmpty(Ljava/lang/Object;)Z

    move-result v10

    .line 674
    .local v10, "isLegacyMinor":Z
    if-eqz v10, :cond_b7

    const/16 v0, 0x20

    invoke-static {v0}, Lcom/android/server/knox/dar/SecureUtil;->generateRandomBytes(I)[B

    move-result-object v0

    goto :goto_c1

    :cond_b7
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    :goto_c1
    move-object v11, v0

    .line 675
    .local v11, "token":[B
    const/4 v12, 0x2

    if-eqz v10, :cond_e0

    .line 676
    invoke-direct {v1, v11, v2}, Lcom/android/server/knox/dar/DarManagerService;->saveResetTokenViaProtectorForLegacy([BI)Z

    move-result v0

    .line 677
    .local v0, "result":Z
    new-array v13, v12, [Ljava/lang/Object;

    .line 679
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v8

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    aput-object v14, v13, v9

    .line 677
    const-string v14, "On created - Save reset token via protector for Legacy user %d has been deployed : %s"

    invoke-static {v14, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v4, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 682
    .end local v0    # "result":Z
    :cond_e0
    invoke-direct {v1, v11, v2}, Lcom/android/server/knox/dar/DarManagerService;->setResetTokenForLegacy([BI)Z

    move-result v0

    .line 684
    .restart local v0    # "result":Z
    invoke-static {v11}, Lcom/android/server/knox/dar/SecureUtil;->clear([B)V

    .line 686
    new-array v13, v12, [Ljava/lang/Object;

    .line 688
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v8

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    aput-object v14, v13, v9

    .line 686
    const-string v14, "On created - Set reset token for Legacy user %d has been deployed : %s"

    invoke-static {v14, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v4, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 690
    if-nez v10, :cond_144

    .line 691
    const/4 v13, 0x0

    .line 692
    .end local v0    # "result":Z
    .local v13, "result":Z
    invoke-static {}, Lcom/samsung/android/knox/EnterpriseKnoxManager;->getInstance()Lcom/samsung/android/knox/EnterpriseKnoxManager;

    move-result-object v14

    .line 694
    .local v14, "ekm":Lcom/samsung/android/knox/EnterpriseKnoxManager;
    :try_start_105
    iget-object v0, v1, Lcom/android/server/knox/dar/DarManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v14, v0, v2}, Lcom/samsung/android/knox/EnterpriseKnoxManager;->getKnoxContainerManager(Landroid/content/Context;I)Lcom/samsung/android/knox/container/KnoxContainerManager;

    move-result-object v0

    .line 695
    .local v0, "kcm":Lcom/samsung/android/knox/container/KnoxContainerManager;
    invoke-virtual {v0}, Lcom/samsung/android/knox/container/KnoxContainerManager;->getPasswordPolicy()Lcom/samsung/android/knox/devicesecurity/PasswordPolicy;

    move-result-object v15

    .line 696
    .local v15, "pwdPolicy":Lcom/samsung/android/knox/devicesecurity/PasswordPolicy;
    invoke-virtual {v15}, Lcom/samsung/android/knox/devicesecurity/PasswordPolicy;->enforcePwdChange()Z

    move-result v16
    :try_end_113
    .catch Ljava/lang/Exception; {:try_start_105 .. :try_end_113} :catch_116

    move/from16 v0, v16

    .line 699
    .end local v13    # "result":Z
    .end local v15    # "pwdPolicy":Lcom/samsung/android/knox/devicesecurity/PasswordPolicy;
    .local v0, "result":Z
    goto :goto_12c

    .line 697
    .end local v0    # "result":Z
    .restart local v13    # "result":Z
    :catch_116
    move-exception v0

    .line 698
    .local v0, "e":Ljava/lang/Exception;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unexpected exception while enforce password for Legacy user "

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v4, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v0, v13

    .line 701
    .end local v13    # "result":Z
    .local v0, "result":Z
    :goto_12c
    new-array v9, v12, [Ljava/lang/Object;

    .line 703
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v9, v8

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    const/4 v12, 0x1

    aput-object v8, v9, v12

    .line 701
    const-string v8, "On created - Password enforcement for Legacy user %d has been deployed : %s"

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 705
    .end local v14    # "ekm":Lcom/samsung/android/knox/EnterpriseKnoxManager;
    :cond_144
    return-void

    .line 649
    .end local v0    # "result":Z
    .end local v10    # "isLegacyMinor":Z
    .end local v11    # "token":[B
    :goto_145
    invoke-static {v6, v7}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 650
    throw v0
.end method

.method private handleUnlockSecureFolderWithToken(I)V
    .registers 11
    .param p1, "secureFolderId"    # I

    .line 790
    invoke-static {p1}, Lcom/samsung/android/knox/SemPersonaManager;->isSecureFolderId(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 791
    return-void

    .line 793
    :cond_7
    invoke-virtual {p0, p1}, Lcom/android/server/knox/dar/DarManagerService;->getSecureFolderTokenHandleViaProtector(I)J

    move-result-wide v0

    .line 794
    .local v0, "tokenHandle":J
    invoke-virtual {p0, p1}, Lcom/android/server/knox/dar/DarManagerService;->getSecureFolderResetTokenViaProtector(I)[B

    move-result-object v2

    .line 795
    .local v2, "token":[B
    const-class v3, Lcom/android/internal/widget/LockSettingsInternal;

    invoke-static {v3}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/widget/LockSettingsInternal;

    .line 796
    .local v3, "lockSettingsInternal":Lcom/android/internal/widget/LockSettingsInternal;
    const-string v4, "DarManagerService"

    if-eqz v3, :cond_34

    .line 798
    :try_start_1b
    invoke-virtual {v3, v0, v1, v2, p1}, Lcom/android/internal/widget/LockSettingsInternal;->unlockUserWithToken(J[BI)Z
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1e} :catch_1f

    .line 801
    goto :goto_34

    .line 799
    :catch_1f
    move-exception v5

    .line 800
    .local v5, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unexpected failure while unlock secure folder with token"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 804
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_34
    :goto_34
    invoke-static {v2}, Lcom/android/server/knox/dar/SecureUtil;->clear([B)V

    .line 806
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    .line 808
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->getUserManager()Landroid/os/UserManager;

    move-result-object v8

    invoke-virtual {v8, p1}, Landroid/os/UserManager;->isUserUnlocked(I)Z

    move-result v8

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    aput-object v8, v6, v7

    .line 806
    const-string v7, "SecureFolder user %d has been unlocked [ res : %b ]"

    invoke-static {v5, v7, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 809
    return-void
.end method

.method private isGRDMSupported()Z
    .registers 2

    .line 246
    const-string v0, ""

    invoke-virtual {v0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private isSAKInstalled()Z
    .registers 9

    .line 250
    const-string v0, "KnoxTestKey"

    const-string v1, "DarManagerService"

    const/4 v2, 0x0

    .line 251
    .local v2, "result":Z
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v3

    .line 253
    .local v3, "identity":J
    :try_start_9
    new-instance v5, Lcom/samsung/android/security/keystore/AttestationUtils;

    invoke-direct {v5}, Lcom/samsung/android/security/keystore/AttestationUtils;-><init>()V

    .line 254
    .local v5, "attestationUtils":Lcom/samsung/android/security/keystore/AttestationUtils;
    const/16 v6, 0x8

    invoke-static {v6}, Lcom/android/server/knox/dar/SecureUtil;->generateRandomBytes(I)[B

    move-result-object v6

    invoke-virtual {v5, v0, v6}, Lcom/samsung/android/security/keystore/AttestationUtils;->generateKeyPair(Ljava/lang/String;[B)Ljava/security/KeyPair;

    move-result-object v6

    .line 255
    .local v6, "kp":Ljava/security/KeyPair;
    if-eqz v6, :cond_1c

    const/4 v7, 0x1

    goto :goto_1d

    :cond_1c
    const/4 v7, 0x0

    :goto_1d
    move v2, v7

    if-eqz v7, :cond_28

    .line 256
    const-string v7, "Generated keypair is protected by SAK"

    invoke-static {v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    invoke-virtual {v5, v0}, Lcom/samsung/android/security/keystore/AttestationUtils;->deleteKey(Ljava/lang/String;)V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_28} :catch_2e
    .catchall {:try_start_9 .. :try_end_28} :catchall_2c

    .line 263
    .end local v5    # "attestationUtils":Lcom/samsung/android/security/keystore/AttestationUtils;
    .end local v6    # "kp":Ljava/security/KeyPair;
    :cond_28
    :goto_28
    invoke-static {v3, v4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 264
    goto :goto_4b

    .line 263
    :catchall_2c
    move-exception v0

    goto :goto_4c

    .line 259
    :catch_2e
    move-exception v0

    .line 260
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2f
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed while check SAK : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4a
    .catchall {:try_start_2f .. :try_end_4a} :catchall_2c

    .end local v0    # "e":Ljava/lang/Exception;
    goto :goto_28

    .line 265
    :goto_4b
    return v2

    .line 263
    :goto_4c
    invoke-static {v3, v4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 264
    throw v0
.end method

.method private isVirtualLockSupported()Z
    .registers 2

    .line 823
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->getVirtualLock()Lcom/android/server/knox/dar/VirtualLockImpl;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method private prepareDualDARService()V
    .registers 3

    .line 1224
    const-string v0, "DarManagerService_DUAL_DAR"

    const-string/jumbo v1, "prepare DualDAR Service"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1225
    return-void
.end method

.method private prepareSdpService()V
    .registers 3

    .line 916
    const-string v0, "DarManagerService_SDP"

    const-string/jumbo v1, "prepare Sdp Service"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 917
    return-void
.end method

.method private prepareSecuredDataKey(I)V
    .registers 6
    .param p1, "userId"    # I

    .line 502
    const-string v0, "SdpSecureDataKey"

    invoke-direct {p0, v0, p1}, Lcom/android/server/knox/dar/DarManagerService;->doesSpecificKeyExist(Ljava/lang/String;I)Z

    move-result v1

    if-nez v1, :cond_28

    .line 503
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 504
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    .line 505
    invoke-direct {p0, v0, p1}, Lcom/android/server/knox/dar/DarManagerService;->generateAndSaveSpecificKey(Ljava/lang/String;I)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v1, v2

    .line 503
    const-string v0, "Generate secure data key for user %d [ res : %b ]"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "DarManagerService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 507
    :cond_28
    return-void
.end method

.method private saveResetTokenViaProtectorForLegacy([BI)Z
    .registers 5
    .param p1, "key"    # [B
    .param p2, "userId"    # I

    .line 708
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mKeyProtector:Lcom/android/server/knox/dar/KeyProtector;

    .line 709
    const-string v1, "SdpResetToken"

    invoke-virtual {v0, p1, v1, p2}, Lcom/android/server/knox/dar/KeyProtector;->protect([BLjava/lang/String;I)Z

    move-result v0

    .line 708
    invoke-static {v0}, Lcom/android/server/knox/dar/SecureUtil;->record(Z)Z

    move-result v0

    return v0
.end method

.method private saveSpecificKeyViaProtector([BLjava/lang/String;I)Z
    .registers 9
    .param p1, "key"    # [B
    .param p2, "alias"    # Ljava/lang/String;
    .param p3, "userId"    # I

    .line 528
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 530
    .local v0, "identity":J
    const/4 v2, 0x2

    :try_start_5
    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v4, 0x1

    aput-object p2, v2, v4

    invoke-static {v2}, Lcom/android/server/knox/dar/SecureUtil;->isAnyoneEmptyHere([Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_21

    iget-object v2, p0, Lcom/android/server/knox/dar/DarManagerService;->mKeyProtector:Lcom/android/server/knox/dar/KeyProtector;

    .line 531
    invoke-virtual {v2, p1, p2, p3}, Lcom/android/server/knox/dar/KeyProtector;->protect([BLjava/lang/String;I)Z

    move-result v2

    invoke-static {v2}, Lcom/android/server/knox/dar/SecureUtil;->record(Z)Z

    move-result v2
    :try_end_1d
    .catchall {:try_start_5 .. :try_end_1d} :catchall_26

    if-eqz v2, :cond_21

    move v3, v4

    goto :goto_22

    :cond_21
    nop

    .line 533
    :goto_22
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 530
    return v3

    .line 533
    :catchall_26
    move-exception v2

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 534
    throw v2
.end method

.method private saveTokenHandleViaProtectorForLegacy(JI)Z
    .registers 7
    .param p1, "handle"    # J
    .param p3, "userId"    # I

    .line 739
    invoke-static {p1, p2}, Lcom/android/server/knox/dar/sdp/security/BytesUtil;->longToBytes(J)[B

    move-result-object v0

    .line 740
    .local v0, "handleBytes":[B
    iget-object v1, p0, Lcom/android/server/knox/dar/DarManagerService;->mKeyProtector:Lcom/android/server/knox/dar/KeyProtector;

    .line 741
    const-string v2, "SdpTokenHandle"

    invoke-virtual {v1, v0, v2, p3}, Lcom/android/server/knox/dar/KeyProtector;->protect([BLjava/lang/String;I)Z

    move-result v1

    .line 740
    invoke-static {v1}, Lcom/android/server/knox/dar/SecureUtil;->record(Z)Z

    move-result v1

    return v1
.end method

.method private setResetTokenForLegacy([BI)Z
    .registers 14
    .param p1, "token"    # [B
    .param p2, "userId"    # I

    .line 713
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Set reset token for Legacy user "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "DarManagerService"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 714
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v0, v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v0, v4

    const-string/jumbo v3, "token : %s, userId : %d"

    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 716
    const/4 v0, 0x0

    .line 717
    .local v0, "result":Z
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v5

    .line 719
    .local v5, "identity":J
    :try_start_32
    iget-object v3, p0, Lcom/android/server/knox/dar/DarManagerService;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    const/4 v7, 0x0

    invoke-virtual {v3, p1, p2, v7}, Lcom/android/internal/widget/LockPatternUtils;->addEscrowToken([BILcom/android/internal/widget/LockPatternUtils$EscrowTokenStateChangeCallback;)J

    move-result-wide v7

    .line 720
    .local v7, "handle":J
    const-wide/16 v9, 0x0

    cmp-long v3, v7, v9

    if-eqz v3, :cond_47

    .line 722
    invoke-direct {p0, v7, v8, p2}, Lcom/android/server/knox/dar/DarManagerService;->saveTokenHandleViaProtectorForLegacy(JI)Z

    move-result v3

    if-eqz v3, :cond_47

    move v2, v4

    goto :goto_48

    :cond_47
    nop

    :goto_48
    move v0, v2

    .line 721
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 720
    invoke-static {v2}, Lcom/android/server/knox/dar/SecureUtil;->isFailed(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_58

    .line 723
    iget-object v2, p0, Lcom/android/server/knox/dar/DarManagerService;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v2, v7, v8, p2}, Lcom/android/internal/widget/LockPatternUtils;->removeEscrowToken(JI)Z
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_58} :catch_5b
    .catchall {:try_start_32 .. :try_end_58} :catchall_59

    .line 731
    .end local v7    # "handle":J
    :cond_58
    goto :goto_65

    :catchall_59
    move-exception v1

    goto :goto_7e

    .line 725
    :catch_5b
    move-exception v2

    .line 726
    .local v2, "e":Ljava/lang/Exception;
    :try_start_5c
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 729
    const-string v3, "Unexpected exception while set reset token for Legacy"

    invoke-static {v1, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_64
    .catchall {:try_start_5c .. :try_end_64} :catchall_59

    .line 731
    nop

    .end local v2    # "e":Ljava/lang/Exception;
    :goto_65
    invoke-static {v5, v6}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 732
    nop

    .line 734
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Result of set reset token for Legacy : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 735
    return v0

    .line 731
    :goto_7e
    invoke-static {v5, v6}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 732
    throw v1
.end method

.method private setSystemReady(Z)V
    .registers 4
    .param p1, "isReady"    # Z

    .line 239
    const-class v0, Lcom/android/server/knox/dar/DarManagerService;

    monitor-enter v0

    .line 240
    :try_start_3
    sput-boolean p1, Lcom/android/server/knox/dar/DarManagerService;->mSystemReady:Z

    .line 241
    monitor-exit v0

    .line 242
    return-void

    .line 241
    :catchall_7
    move-exception v1

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v1
.end method


# virtual methods
.method public addBlockedClearablePackages(ILjava/lang/String;)V
    .registers 4
    .param p1, "userId"    # I
    .param p2, "packageName"    # Ljava/lang/String;

    .line 1275
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isDualDarSupported()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1276
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getDualDarManager()Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;->addBlockedClearablePackages(ILjava/lang/String;)V

    .line 1278
    :cond_d
    return-void
.end method

.method public addEngine(Lcom/samsung/android/knox/sdp/core/SdpCreationParam;Ljava/lang/String;Ljava/lang/String;)I
    .registers 5
    .param p1, "sdpCreationParam"    # Lcom/samsung/android/knox/sdp/core/SdpCreationParam;
    .param p2, "s"    # Ljava/lang/String;
    .param p3, "s1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1046
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1047
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->addEngine(Lcom/samsung/android/knox/sdp/core/SdpCreationParam;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0

    .line 1049
    :cond_f
    const/16 v0, -0xa

    return v0
.end method

.method public allow(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "s1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1021
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1022
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->allow(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0

    .line 1024
    :cond_f
    const/16 v0, -0xa

    return v0
.end method

.method public clearResetPasswordToken(I)Z
    .registers 4
    .param p1, "userId"    # I

    .line 877
    const/4 v0, 0x0

    .line 878
    .local v0, "result":Z
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->isVirtualLockSupported()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 879
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->getVirtualLock()Lcom/android/server/knox/dar/VirtualLockImpl;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/server/knox/dar/VirtualLockImpl;->clearResetPasswordToken(I)Z

    move-result v0

    .line 880
    if-eqz v0, :cond_1e

    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isDualDarSupported()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 881
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getDualDarManager()Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;->onClearResetPasswordToken(I)V

    .line 884
    :cond_1e
    return v0
.end method

.method public createEncPkgDir(ILjava/lang/String;)I
    .registers 4
    .param p1, "i"    # I
    .param p2, "s"    # Ljava/lang/String;

    .line 1086
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1087
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->createEncPkgDir(ILjava/lang/String;)I

    move-result v0

    return v0

    .line 1089
    :cond_f
    const/4 v0, 0x0

    return v0
.end method

.method public deleteToeknFromTrusted(Ljava/lang/String;)I
    .registers 3
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1103
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1104
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->deleteToeknFromTrusted(Ljava/lang/String;)I

    move-result v0

    return v0

    .line 1106
    :cond_f
    const/16 v0, -0xa

    return v0
.end method

.method public disallow(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "s1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1029
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1030
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->disallow(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0

    .line 1032
    :cond_f
    const/16 v0, -0xa

    return v0
.end method

.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 6
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "pw"    # Ljava/io/PrintWriter;
    .param p3, "args"    # [Ljava/lang/String;

    .line 398
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mContext:Landroid/content/Context;

    const-string v1, "DarManagerService"

    invoke-static {v0, v1, p2}, Lcom/android/internal/util/DumpUtils;->checkDumpPermission(Landroid/content/Context;Ljava/lang/String;Ljava/io/PrintWriter;)Z

    move-result v0

    if-nez v0, :cond_b

    return-void

    .line 399
    :cond_b
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 400
    const-string/jumbo v0, "sdp_dump"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 401
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 403
    :cond_1e
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isDualDarSupported()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 404
    const-string v0, "dualdar_dump"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 405
    new-instance v0, Lcom/android/server/knox/dar/DarManagerService$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/server/knox/dar/DarManagerService$$ExternalSyntheticLambda0;-><init>(Lcom/android/server/knox/dar/DarManagerService;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    invoke-static {v0}, Landroid/os/Binder;->withCleanCallingIdentity(Lcom/android/internal/util/FunctionalUtils$ThrowingRunnable;)V

    .line 407
    :cond_31
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isDarSupported()Z

    move-result v0

    if-eqz v0, :cond_6d

    .line 408
    if-eqz p3, :cond_57

    array-length v0, p3

    if-lez v0, :cond_57

    .line 409
    invoke-static {p3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const-string v1, "-a"

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_55

    invoke-static {p3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const-string/jumbo v1, "sdplog"

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_57

    :cond_55
    const/4 v0, 0x1

    goto :goto_58

    :cond_57
    const/4 v0, 0x0

    .line 410
    .local v0, "dumpSdpLog":Z
    :goto_58
    if-eqz v0, :cond_6d

    .line 411
    const-string/jumbo v1, "sdplog_dump"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 412
    const-string v1, "-------------------------------------------------- START DUMP --------------------------------------------------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 416
    invoke-static {p2}, Lcom/android/server/knox/dar/sdp/SDPLog;->dump(Ljava/io/PrintWriter;)V

    .line 417
    const-string v1, "-------------------------------------------------- END DUMP --------------------------------------------------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 423
    .end local v0    # "dumpSdpLog":Z
    :cond_6d
    return-void
.end method

.method public exists(Ljava/lang/String;)I
    .registers 3
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1013
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1014
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->exists(Ljava/lang/String;)I

    move-result v0

    return v0

    .line 1016
    :cond_f
    const/16 v0, -0xa

    return v0
.end method

.method public getAvailableUserId()I
    .registers 2

    .line 844
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->isVirtualLockSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 845
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->getVirtualLock()Lcom/android/server/knox/dar/VirtualLockImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/knox/dar/VirtualLockImpl;->getAvailableUserId()I

    move-result v0

    return v0

    .line 847
    :cond_f
    const/16 v0, -0x2710

    return v0
.end method

.method public getBlockedClearablePackages(I)Ljava/util/List;
    .registers 3
    .param p1, "userId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1282
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isDualDarSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1283
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getDualDarManager()Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;->getBlockedClearablePackages(I)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 1285
    :cond_f
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDualDarManager()Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;
    .registers 2

    .line 1220
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mDualDarManagerImpl:Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    return-object v0
.end method

.method public getEngineInfo(Ljava/lang/String;)Lcom/samsung/android/knox/sdp/core/SdpEngineInfo;
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .line 1062
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1063
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->getEngineInfo(Ljava/lang/String;)Lcom/samsung/android/knox/sdp/core/SdpEngineInfo;

    move-result-object v0

    return-object v0

    .line 1065
    :cond_f
    const/4 v0, 0x0

    return-object v0
.end method

.method public getInnerAuthUserId(I)I
    .registers 3
    .param p1, "userId"    # I

    .line 1252
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isDualDarSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1253
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getDualDarManager()Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;->getInnerAuthUserId(I)I

    move-result v0

    return v0

    .line 1255
    :cond_f
    const/16 v0, -0x2710

    return v0
.end method

.method public getMainUserId(I)I
    .registers 3
    .param p1, "innerAuthUserId"    # I

    .line 1267
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isDualDarSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1268
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getDualDarManager()Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;->getMainUserId(I)I

    move-result v0

    return v0

    .line 1270
    :cond_f
    const/16 v0, -0x2710

    return v0
.end method

.method public getReservedUserIdForSystem()I
    .registers 2

    .line 836
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->isVirtualLockSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 837
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->getVirtualLock()Lcom/android/server/knox/dar/VirtualLockImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/knox/dar/VirtualLockImpl;->getReservedUserIdForSystem()I

    move-result v0

    return v0

    .line 839
    :cond_f
    const/16 v0, -0x2710

    return v0
.end method

.method public getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;
    .registers 2

    .line 912
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mSdpManagerImpl:Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    return-object v0
.end method

.method public getSecureFolderResetTokenViaProtector(I)[B
    .registers 3
    .param p1, "secureFolderId"    # I

    .line 776
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->checkSystemPermission()Z

    .line 778
    const-string v0, "SdpResetToken"

    invoke-direct {p0, v0, p1}, Lcom/android/server/knox/dar/DarManagerService;->getSpecificKeyViaProtector(Ljava/lang/String;I)[B

    move-result-object v0

    return-object v0
.end method

.method public getSecureFolderTokenHandleViaProtector(I)J
    .registers 7
    .param p1, "secureFolderId"    # I

    .line 754
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->checkSystemPermission()Z

    .line 756
    const-wide/16 v0, 0x0

    .line 757
    .local v0, "tokenHandle":J
    const-string v2, "SdpTokenHandle"

    invoke-direct {p0, v2, p1}, Lcom/android/server/knox/dar/DarManagerService;->getSpecificKeyViaProtector(Ljava/lang/String;I)[B

    move-result-object v2

    .line 758
    .local v2, "handle":[B
    if-eqz v2, :cond_12

    .line 759
    invoke-static {v2}, Lcom/android/server/knox/dar/sdp/security/BytesUtil;->bytesToLong([B)J

    move-result-wide v0

    goto :goto_19

    .line 761
    :cond_12
    const-string v3, "DarManagerService"

    const-string v4, "get SecureFolder Token Handle Failed"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 763
    :goto_19
    return-wide v0
.end method

.method public getSecuredEscrowData(I)Landroid/os/Bundle;
    .registers 19
    .param p1, "userId"    # I

    .line 587
    move-object/from16 v0, p0

    move/from16 v1, p1

    const/4 v2, 0x0

    if-eqz v1, :cond_8

    .line 588
    return-object v2

    .line 590
    :cond_8
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Get secured escrow data for user "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "DarManagerService"

    invoke-static {v4, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 592
    new-instance v3, Ljava/io/File;

    invoke-static/range {p1 .. p1}, Landroid/os/Environment;->getDataSystemDeDirectory(I)Ljava/io/File;

    move-result-object v5

    const-string/jumbo v6, "spblob"

    invoke-direct {v3, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 593
    .local v3, "spblobDir":Ljava/io/File;
    new-instance v5, Ljava/io/File;

    const/4 v6, 0x2

    new-array v7, v6, [Ljava/lang/Object;

    const-wide/16 v8, 0x0

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    const/4 v11, 0x0

    aput-object v10, v7, v11

    const-string v10, "e0.bku"

    const/4 v12, 0x1

    aput-object v10, v7, v12

    const-string v10, "%016x.%s"

    invoke-static {v10, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v3, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 594
    .local v5, "e0":Ljava/io/File;
    new-instance v7, Ljava/io/File;

    new-array v13, v6, [Ljava/lang/Object;

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v13, v11

    const-string/jumbo v8, "p1.bku"

    aput-object v8, v13, v12

    invoke-static {v10, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v3, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 596
    .local v7, "p1":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/android/server/knox/dar/DarManagerService;->fileRead(Ljava/lang/String;)[B

    move-result-object v8

    .line 597
    .local v8, "e0Blob":[B
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/android/server/knox/dar/DarManagerService;->fileRead(Ljava/lang/String;)[B

    move-result-object v9

    .line 598
    .local v9, "p1Blob":[B
    new-array v10, v6, [Ljava/lang/Object;

    aput-object v8, v10, v11

    aput-object v9, v10, v12

    invoke-static {v10}, Lcom/android/server/knox/dar/SecureUtil;->isAnyoneEmptyHere([Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_79

    .line 599
    return-object v2

    .line 602
    :cond_79
    const-string v10, "SdpSecureDataKey"

    invoke-direct {v0, v10, v1}, Lcom/android/server/knox/dar/DarManagerService;->getSpecificKeyViaProtector(Ljava/lang/String;I)[B

    move-result-object v10

    .line 603
    .local v10, "secureDataKey":[B
    invoke-static {v10}, Lcom/android/server/knox/dar/SecureUtil;->isEmpty(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_94

    .line 604
    new-instance v6, Ljava/lang/Exception;

    const-string v11, "Unexpected failure while get secure data key"

    invoke-direct {v6, v11}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 605
    return-object v2

    .line 607
    :cond_94
    iget-object v2, v0, Lcom/android/server/knox/dar/DarManagerService;->mKeyProtector:Lcom/android/server/knox/dar/KeyProtector;

    invoke-virtual {v2, v10, v8}, Lcom/android/server/knox/dar/KeyProtector;->decryptFast([B[B)[B

    move-result-object v2

    .line 608
    .local v2, "e0Bytes":[B
    iget-object v13, v0, Lcom/android/server/knox/dar/DarManagerService;->mKeyProtector:Lcom/android/server/knox/dar/KeyProtector;

    invoke-virtual {v13, v10, v9}, Lcom/android/server/knox/dar/KeyProtector;->decryptFast([B[B)[B

    move-result-object v13

    .line 609
    .local v13, "p1Bytes":[B
    new-instance v14, Landroid/os/Bundle;

    invoke-direct {v14}, Landroid/os/Bundle;-><init>()V

    .line 610
    .local v14, "escrowData":Landroid/os/Bundle;
    const-string v15, "e0"

    invoke-virtual {v14, v15, v2}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 611
    const-string/jumbo v15, "p1"

    invoke-virtual {v14, v15, v13}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 612
    const/4 v15, 0x3

    new-array v15, v15, [Ljava/lang/Object;

    .line 614
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v15, v11

    invoke-static {v2}, Lcom/android/server/knox/dar/SecureUtil;->isEmpty(Ljava/lang/Object;)Z

    move-result v11

    xor-int/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    aput-object v11, v15, v12

    invoke-static {v13}, Lcom/android/server/knox/dar/SecureUtil;->isEmpty(Ljava/lang/Object;)Z

    move-result v11

    xor-int/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    aput-object v11, v15, v6

    .line 612
    const-string v6, "Secured escrow data for user %d prepared [ Res : %b/%b ]"

    invoke-static {v6, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 615
    return-object v14
.end method

.method public getSupportedSDKVersion()D
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1038
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1039
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->getSupportedSDKVersion()D

    move-result-wide v0

    return-wide v0

    .line 1041
    :cond_f
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getVirtualUsers()[I
    .registers 5

    .line 852
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->isVirtualLockSupported()Z

    move-result v0

    if-eqz v0, :cond_26

    .line 853
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mVirtualLockImpl:Lcom/android/server/knox/dar/VirtualLockImpl;

    invoke-virtual {v0}, Lcom/android/server/knox/dar/VirtualLockImpl;->getVirtualUsers()Ljava/util/List;

    move-result-object v0

    .line 854
    .local v0, "userList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [I

    .line 855
    .local v1, "ret":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_13
    array-length v3, v1

    if-ge v2, v3, :cond_25

    .line 856
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v1, v2

    .line 855
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 858
    .end local v2    # "i":I
    :cond_25
    return-object v1

    .line 860
    .end local v0    # "userList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v1    # "ret":[I
    :cond_26
    const/4 v0, 0x0

    new-array v0, v0, [I

    return-object v0
.end method

.method public handleDeviceOwnerChanged()V
    .registers 3

    .line 1154
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->checkSystemPermission()Z

    .line 1159
    invoke-static {}, Lcom/samsung/android/knox/dar/ddar/DualDarManager;->isOnDeviceOwnerEnabled()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 1160
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/android/server/knox/dar/DarUtil;->setDoEnabled(Z)V

    .line 1161
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/LockPatternUtils;->setDeviceOwner(I)V

    .line 1163
    const-string v0, "Skip sdp engine creation for dual-dar do"

    invoke-static {v0}, Lcom/android/server/knox/dar/sdp/SDPLog;->d(Ljava/lang/String;)V

    .line 1164
    return-void

    .line 1166
    :cond_19
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->handleDeviceOwnerChanged()V

    .line 1167
    return-void
.end method

.method public isDarSupported()Z
    .registers 2

    .line 147
    const/4 v0, 0x1

    return v0
.end method

.method public isDefaultPathUser(I)Z
    .registers 3
    .param p1, "i"    # I

    .line 1147
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1148
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->isDefaultPathUser(I)Z

    move-result v0

    return v0

    .line 1150
    :cond_f
    const/4 v0, 0x0

    return v0
.end method

.method public isDeviceRootKeyInstalled()Z
    .registers 7

    const/4 v0, 0x1

	return v0
.end method

.method public isDualDarSupported()Z
    .registers 2

    .line 1213
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getDualDarManager()Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    move-result-object v0

    if-eqz v0, :cond_8

    .line 1214
    const/4 v0, 0x1

    return v0

    .line 1216
    :cond_8
    const/4 v0, 0x0

    return v0
.end method

.method public isKnoxKeyInstallable()Z
    .registers 9

    const/4 v0, 0x1

	return v0
.end method

.method public isLicensed()I
    .registers 2

    .line 1005
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1006
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->isLicensed()I

    move-result v0

    return v0

    .line 1008
    :cond_f
    const/16 v0, -0xa

    return v0
.end method

.method public isResetPasswordTokenActive(I)Z
    .registers 3
    .param p1, "userId"    # I

    .line 889
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->isVirtualLockSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 890
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->getVirtualLock()Lcom/android/server/knox/dar/VirtualLockImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/VirtualLockImpl;->isResetPasswordTokenActive(I)Z

    move-result v0

    return v0

    .line 892
    :cond_f
    const/4 v0, 0x0

    return v0
.end method

.method public isSDPEnabled(I)Z
    .registers 3
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 921
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 922
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->isSDPEnabled(I)Z

    move-result v0

    return v0

    .line 924
    :cond_f
    const/4 v0, 0x0

    return v0
.end method

.method public isSdpSupported()Z
    .registers 3

    .line 929
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 930
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->isSdpSupported()Z

    move-result v0

    return v0

    .line 932
    :cond_f
    const-string v0, "DarManagerService_SDP"

    const-string v1, "SDP not supported"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 933
    const/4 v0, 0x0

    return v0
.end method

.method public isSdpSupportedSecureFolder(I)Z
    .registers 4
    .param p1, "userId"    # I

    .line 939
    invoke-direct {p0, p1}, Lcom/android/server/knox/dar/DarManagerService;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v0

    .line 940
    .local v0, "ui":Landroid/content/pm/UserInfo;
    if-eqz v0, :cond_14

    invoke-virtual {v0}, Landroid/content/pm/UserInfo;->isSecureFolder()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-virtual {v0}, Landroid/content/pm/UserInfo;->isSdpNotSupportedSecureFolder()Z

    move-result v1

    if-nez v1, :cond_14

    const/4 v1, 0x1

    goto :goto_15

    :cond_14
    const/4 v1, 0x0

    :goto_15
    return v1
.end method

.method public isSecondaryLockRequired(I)Z
    .registers 3
    .param p1, "userId"    # I

    .line 1237
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isDualDarSupported()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1238
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mDualDarManagerImpl:Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;->isSecondaryLockRequired(I)Z

    move-result v0

    return v0

    .line 1240
    :cond_d
    const/4 v0, 0x0

    return v0
.end method

.method public isSensitive(Ljava/lang/String;)Z
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .line 1078
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1079
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->isSensitive(Ljava/lang/String;)Z

    move-result v0

    return v0

    .line 1081
    :cond_f
    const/4 v0, 0x0

    return v0
.end method

.method public isSystemReady()Z
    .registers 3

    .line 233
    const-class v0, Lcom/android/server/knox/dar/DarManagerService;

    monitor-enter v0

    .line 234
    :try_start_3
    sget-boolean v1, Lcom/android/server/knox/dar/DarManagerService;->mSystemReady:Z

    monitor-exit v0

    return v1

    .line 235
    :catchall_7
    move-exception v1

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v1
.end method

.method public synthetic lambda$dump$1$DarManagerService(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 5
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "pw"    # Ljava/io/PrintWriter;
    .param p3, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 405
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getDualDarManager()Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    return-void
.end method

.method public synthetic lambda$new$0$DarManagerService(JI)V
    .registers 5
    .param p1, "handle"    # J
    .param p3, "userId"    # I

    .line 223
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isDualDarSupported()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 224
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getDualDarManager()Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;->onEscrowTokenActivated(JI)V

    .line 226
    :cond_d
    return-void
.end method

.method public lock(Ljava/lang/String;)I
    .registers 3
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 953
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 954
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->lock(Ljava/lang/String;)I

    move-result v0

    return v0

    .line 956
    :cond_f
    const/16 v0, -0xa

    return v0
.end method

.method public migrate(Ljava/lang/String;)I
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .line 977
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 978
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->migrate(Ljava/lang/String;)I

    move-result v0

    return v0

    .line 980
    :cond_f
    const/16 v0, -0xa

    return v0
.end method

.method public onBiometricsAuthenticated(I)V
    .registers 3
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1119
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1120
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->onBiometricsAuthenticated(I)V

    .line 1122
    :cond_d
    return-void
.end method

.method public onCMFALocked(I)V
    .registers 4
    .param p1, "userId"    # I

    .line 1174
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isDarSupported()Z

    move-result v0

    if-nez v0, :cond_7

    .line 1175
    return-void

    .line 1177
    :cond_7
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-nez v0, :cond_e

    .line 1178
    return-void

    .line 1180
    :cond_e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CMFA locked for user "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "DarManagerService_SDP"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1181
    invoke-direct {p0, p1}, Lcom/android/server/knox/dar/DarManagerService;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v0

    .line 1182
    .local v0, "ui":Landroid/content/pm/UserInfo;
    invoke-static {v0}, Lcom/android/server/knox/dar/DarUtil;->isEnterpriseUser(Landroid/content/pm/UserInfo;)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 1183
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->onMasterKeyEvictionRequired(I)V

    .line 1185
    :cond_35
    return-void
.end method

.method public onDeviceOwnerLocked(I)V
    .registers 3
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1126
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1127
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->onDeviceOwnerLocked(I)V

    .line 1129
    :cond_d
    return-void
.end method

.method public registerClient(ILcom/samsung/android/knox/dar/sdp/ISdpListener;)V
    .registers 4
    .param p1, "i"    # I
    .param p2, "iSdpListener"    # Lcom/samsung/android/knox/dar/sdp/ISdpListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1133
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1134
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->registerClient(ILcom/samsung/android/knox/dar/sdp/ISdpListener;)V

    .line 1136
    :cond_d
    return-void
.end method

.method public registerListener(Ljava/lang/String;Lcom/samsung/android/knox/dar/sdp/ISdpListener;)I
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "iSdpListener"    # Lcom/samsung/android/knox/dar/sdp/ISdpListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 985
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 986
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->registerListener(Ljava/lang/String;Lcom/samsung/android/knox/dar/sdp/ISdpListener;)I

    move-result v0

    return v0

    .line 988
    :cond_f
    const/16 v0, -0xa

    return v0
.end method

.method public removeEngine(Ljava/lang/String;)I
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .line 1054
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1055
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->removeEngine(Ljava/lang/String;)I

    move-result v0

    return v0

    .line 1057
    :cond_f
    const/16 v0, -0xa

    return v0
.end method

.method public reserveUserIdForSystem()I
    .registers 2

    .line 828
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->isVirtualLockSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 829
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->getVirtualLock()Lcom/android/server/knox/dar/VirtualLockImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/knox/dar/VirtualLockImpl;->reserveUserIdForSystem()I

    move-result v0

    return v0

    .line 831
    :cond_f
    const/16 v0, -0x2710

    return v0
.end method

.method public resetPassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .registers 5
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "s1"    # Ljava/lang/String;
    .param p3, "s2"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 969
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 970
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->resetPassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0

    .line 972
    :cond_f
    const/16 v0, -0xa

    return v0
.end method

.method public resetPasswordWithToken(Ljava/lang/String;[BI)Z
    .registers 5
    .param p1, "password"    # Ljava/lang/String;
    .param p2, "token"    # [B
    .param p3, "userId"    # I

    .line 897
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->isVirtualLockSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 898
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->getVirtualLock()Lcom/android/server/knox/dar/VirtualLockImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/knox/dar/VirtualLockImpl;->resetPasswordWithToken(Ljava/lang/String;[BI)Z

    move-result v0

    return v0

    .line 900
    :cond_f
    const/4 v0, 0x0

    return v0
.end method

.method public saveSecuredEscrowData(I)V
    .registers 18
    .param p1, "userId"    # I

    .line 546
    move-object/from16 v0, p0

    move/from16 v1, p1

    if-eqz v1, :cond_7

    .line 547
    return-void

    .line 549
    :cond_7
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Save secured escrow data for user "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "DarManagerService"

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 550
    new-instance v2, Ljava/io/File;

    invoke-static/range {p1 .. p1}, Landroid/os/Environment;->getDataSystemDeDirectory(I)Ljava/io/File;

    move-result-object v4

    const-string/jumbo v5, "spblob"

    invoke-direct {v2, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 551
    .local v2, "spblobDir":Ljava/io/File;
    new-instance v4, Ljava/io/File;

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/Object;

    const-wide/16 v7, 0x0

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    const/4 v10, 0x0

    aput-object v9, v6, v10

    const-string v9, "e0"

    const/4 v11, 0x1

    aput-object v9, v6, v11

    const-string v9, "%016x.%s"

    invoke-static {v9, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v2, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 552
    .local v4, "e0":Ljava/io/File;
    new-instance v6, Ljava/io/File;

    new-array v12, v5, [Ljava/lang/Object;

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v12, v10

    const-string/jumbo v7, "p1"

    aput-object v7, v12, v11

    invoke-static {v9, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v2, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 554
    .local v6, "p1":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_ff

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_6a

    move v15, v5

    goto/16 :goto_100

    .line 559
    :cond_6a
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/android/server/knox/dar/DarManagerService;->fileRead(Ljava/lang/String;)[B

    move-result-object v7

    .line 560
    .local v7, "e0Bytes":[B
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/android/server/knox/dar/DarManagerService;->fileRead(Ljava/lang/String;)[B

    move-result-object v8

    .line 561
    .local v8, "p1Bytes":[B
    new-array v9, v5, [Ljava/lang/Object;

    aput-object v7, v9, v10

    aput-object v8, v9, v11

    invoke-static {v9}, Lcom/android/server/knox/dar/SecureUtil;->isAnyoneEmptyHere([Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_87

    .line 562
    return-void

    .line 564
    :cond_87
    const-string v9, "SdpSecureDataKey"

    invoke-direct {v0, v9, v1}, Lcom/android/server/knox/dar/DarManagerService;->getSpecificKeyViaProtector(Ljava/lang/String;I)[B

    move-result-object v9

    .line 565
    .local v9, "secureDataKey":[B
    invoke-static {v9}, Lcom/android/server/knox/dar/SecureUtil;->isEmpty(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_a2

    .line 566
    new-instance v5, Ljava/lang/Exception;

    const-string v10, "Unexpected failure while get secure data key"

    invoke-direct {v5, v10}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 567
    return-void

    .line 569
    :cond_a2
    iget-object v12, v0, Lcom/android/server/knox/dar/DarManagerService;->mKeyProtector:Lcom/android/server/knox/dar/KeyProtector;

    invoke-virtual {v12, v9, v7}, Lcom/android/server/knox/dar/KeyProtector;->encryptFast([B[B)[B

    move-result-object v12

    .line 570
    .local v12, "e0Blob":[B
    iget-object v13, v0, Lcom/android/server/knox/dar/DarManagerService;->mKeyProtector:Lcom/android/server/knox/dar/KeyProtector;

    invoke-virtual {v13, v9, v8}, Lcom/android/server/knox/dar/KeyProtector;->encryptFast([B[B)[B

    move-result-object v13

    .line 571
    .local v13, "p1Blob":[B
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, ".bku"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14, v12}, Lcom/android/server/knox/dar/DarManagerService;->fileWrite(Ljava/lang/String;[B)Z

    move-result v14

    .line 572
    .local v14, "eoRes":Z
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v13}, Lcom/android/server/knox/dar/DarManagerService;->fileWrite(Ljava/lang/String;[B)Z

    move-result v5

    .line 573
    .local v5, "p1Res":Z
    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Object;

    .line 575
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v11, v10

    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    const/4 v15, 0x1

    aput-object v10, v11, v15

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    const/4 v15, 0x2

    aput-object v10, v11, v15

    .line 573
    const-string v10, "Escrow data for SYSTEM user %d got secured [ Res : %b/%b ]"

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v3, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 576
    return-void

    .line 554
    .end local v5    # "p1Res":Z
    .end local v7    # "e0Bytes":[B
    .end local v8    # "p1Bytes":[B
    .end local v9    # "secureDataKey":[B
    .end local v12    # "e0Blob":[B
    .end local v13    # "p1Blob":[B
    .end local v14    # "eoRes":Z
    :cond_ff
    move v15, v5

    .line 555
    :goto_100
    new-array v5, v15, [Ljava/lang/Object;

    .line 556
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v10

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    const/4 v8, 0x1

    aput-object v7, v5, v8

    .line 555
    const-string v7, "Escrow data doesn\'t exist [ %b/%b ]"

    invoke-static {v7, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 557
    return-void
.end method

.method public saveTokenIntoTrusted(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "s1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1094
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1095
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->saveTokenIntoTrusted(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0

    .line 1097
    :cond_f
    const/16 v0, -0xa

    return v0
.end method

.method public setDualDarInfo(II)Z
    .registers 4
    .param p1, "userId"    # I
    .param p2, "flag"    # I

    .line 1229
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isDualDarSupported()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1230
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mDualDarManagerImpl:Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;->setDualDarInfo(II)Z

    move-result v0

    return v0

    .line 1232
    :cond_d
    const/4 v0, 0x0

    return v0
.end method

.method public setInnerAuthUserId(II)V
    .registers 4
    .param p1, "innerAuthUserId"    # I
    .param p2, "userId"    # I

    .line 1245
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isDualDarSupported()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1246
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getDualDarManager()Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;->setInnerAuthUserId(II)V

    .line 1248
    :cond_d
    return-void
.end method

.method public setMainUserId(II)V
    .registers 4
    .param p1, "mainUserId"    # I
    .param p2, "innerAuthUserId"    # I

    .line 1260
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isDualDarSupported()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1261
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getDualDarManager()Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;->setMainUserId(II)V

    .line 1263
    :cond_d
    return-void
.end method

.method public setPassword(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "s1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 961
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 962
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->setPassword(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0

    .line 964
    :cond_f
    const/16 v0, -0xa

    return v0
.end method

.method public setResetPasswordToken([BI)Z
    .registers 5
    .param p1, "token"    # [B
    .param p2, "userId"    # I

    .line 865
    const/4 v0, 0x0

    .line 866
    .local v0, "result":Z
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->isVirtualLockSupported()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 867
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->getVirtualLock()Lcom/android/server/knox/dar/VirtualLockImpl;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lcom/android/server/knox/dar/VirtualLockImpl;->setResetPasswordToken([BI)Z

    move-result v0

    .line 868
    if-eqz v0, :cond_1e

    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isDualDarSupported()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 869
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getDualDarManager()Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/android/server/knox/dar/ddar/DualDarManagerImpl;->onSetResetPasswordToken(I)V

    .line 872
    :cond_1e
    return v0
.end method

.method public setResetTokenForLegacyContainer(ILjava/lang/String;)V
    .registers 6
    .param p1, "userId"    # I
    .param p2, "resetToken"    # Ljava/lang/String;

    .line 630
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->checkSystemPermission()Z

    .line 632
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mDarHandler:Lcom/android/server/knox/dar/DarManagerService$DarHandler;

    const/16 v1, 0x76

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/android/server/knox/dar/DarManagerService$DarHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    .line 633
    .local v0, "msg":Landroid/os/Message;
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 634
    iget-object v1, p0, Lcom/android/server/knox/dar/DarManagerService;->mDarHandler:Lcom/android/server/knox/dar/DarManagerService$DarHandler;

    invoke-virtual {v1, v0}, Lcom/android/server/knox/dar/DarManagerService$DarHandler;->sendMessage(Landroid/os/Message;)Z

    .line 635
    return-void
.end method

.method public setSensitive(ILjava/lang/String;)Z
    .registers 4
    .param p1, "i"    # I
    .param p2, "s"    # Ljava/lang/String;

    .line 1070
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1071
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->setSensitive(ILjava/lang/String;)Z

    move-result v0

    return v0

    .line 1073
    :cond_f
    const/4 v0, 0x0

    return v0
.end method

.method public systemReady()V
    .registers 4

    .line 155
    const-string v0, "DarManagerService"

    const-string/jumbo v1, "systemReady for DarManagerService"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    invoke-static {}, Lcom/android/server/knox/dar/KeyProtector;->getInstance()Lcom/android/server/knox/dar/KeyProtector;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/knox/dar/DarManagerService;->mKeyProtector:Lcom/android/server/knox/dar/KeyProtector;

    .line 161
    iget-object v1, p0, Lcom/android/server/knox/dar/DarManagerService;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "user"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/UserManager;

    iput-object v1, p0, Lcom/android/server/knox/dar/DarManagerService;->mUserManager:Landroid/os/UserManager;

    .line 164
    new-instance v1, Landroid/os/HandlerThread;

    const/16 v2, 0xa

    invoke-direct {v1, v0, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object v1, p0, Lcom/android/server/knox/dar/DarManagerService;->mHandlerThread:Landroid/os/HandlerThread;

    .line 166
    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 167
    new-instance v0, Lcom/android/server/knox/dar/DarManagerService$DarHandler;

    iget-object v1, p0, Lcom/android/server/knox/dar/DarManagerService;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/server/knox/dar/DarManagerService$DarHandler;-><init>(Lcom/android/server/knox/dar/DarManagerService;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mDarHandler:Lcom/android/server/knox/dar/DarManagerService$DarHandler;

    .line 169
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/server/knox/dar/DarManagerService;->prepareSecuredDataKey(I)V

    .line 171
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/server/knox/dar/DarManagerService;->setSystemReady(Z)V

    .line 172
    return-void
.end method

.method public unlock(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "s1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 945
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 946
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->unlock(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0

    .line 948
    :cond_f
    const/16 v0, -0xa

    return v0
.end method

.method public unlockSecureFolderWithToken(I)V
    .registers 5
    .param p1, "secureFolderId"    # I

    .line 782
    invoke-direct {p0}, Lcom/android/server/knox/dar/DarManagerService;->checkSystemPermission()Z

    .line 784
    iget-object v0, p0, Lcom/android/server/knox/dar/DarManagerService;->mDarHandler:Lcom/android/server/knox/dar/DarManagerService$DarHandler;

    const/16 v1, 0x96

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/android/server/knox/dar/DarManagerService$DarHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    .line 785
    .local v0, "msg":Landroid/os/Message;
    iget-object v1, p0, Lcom/android/server/knox/dar/DarManagerService;->mDarHandler:Lcom/android/server/knox/dar/DarManagerService$DarHandler;

    invoke-virtual {v1, v0}, Lcom/android/server/knox/dar/DarManagerService$DarHandler;->sendMessage(Landroid/os/Message;)Z

    .line 786
    return-void
.end method

.method public unlockViaTrusted(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "s1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1111
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1112
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->unlockViaTrusted(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0

    .line 1114
    :cond_f
    const/16 v0, -0xa

    return v0
.end method

.method public unregisterClient(ILcom/samsung/android/knox/dar/sdp/ISdpListener;)V
    .registers 4
    .param p1, "i"    # I
    .param p2, "iSdpListener"    # Lcom/samsung/android/knox/dar/sdp/ISdpListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1140
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1141
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->unregisterClient(ILcom/samsung/android/knox/dar/sdp/ISdpListener;)V

    .line 1143
    :cond_d
    return-void
.end method

.method public unregisterListener(Ljava/lang/String;Lcom/samsung/android/knox/dar/sdp/ISdpListener;)I
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "iSdpListener"    # Lcom/samsung/android/knox/dar/sdp/ISdpListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 993
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->isSdpSupported()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 994
    invoke-virtual {p0}, Lcom/android/server/knox/dar/DarManagerService;->getSdpManager()Lcom/android/server/knox/dar/sdp/SdpManagerImpl;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/server/knox/dar/sdp/SdpManagerImpl;->unregisterListener(Ljava/lang/String;Lcom/samsung/android/knox/dar/sdp/ISdpListener;)I

    move-result v0

    return v0

    .line 996
    :cond_f
    const/16 v0, -0xa

    return v0
.end method
