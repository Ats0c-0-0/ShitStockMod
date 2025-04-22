.class public Lcom/android/server/pm/PackageManagerServiceUtils;
.super Ljava/lang/Object;
.source "PackageManagerServiceUtils.java"


# static fields
.field private static final FSVERITY_DISABLED:I = 0x0

.field private static final FSVERITY_ENABLED:I = 0x2

.field private static final FSVERITY_LEGACY:I = 0x1

.field private static final MAX_CRITICAL_INFO_DUMP_SIZE:J = 0x2dc6c0L

.field public static final REMOVE_IF_NULL_PKG:Ljava/util/function/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Predicate<",
            "Lcom/android/server/pm/PackageSetting;",
            ">;"
        }
    .end annotation
.end field

.field private static final SEVEN_DAYS_IN_MILLISECONDS:J = 0x240c8400L

.field private static final THIRTY_TWO_DAYS_IN_MILLISECONDS:J = 0xa4cb8000L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 118
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda9;->INSTANCE:Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda9;

    sput-object v0, Lcom/android/server/pm/PackageManagerServiceUtils;->REMOVE_IF_NULL_PKG:Ljava/util/function/Predicate;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static applyPackageFilter(Ljava/util/function/Predicate;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/List;Lcom/android/server/pm/PackageManagerService;)V
    .registers 9
    .param p4, "packageManagerService"    # Lcom/android/server/pm/PackageManagerService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/server/pm/PackageSetting;",
            ">;",
            "Ljava/util/Collection<",
            "Lcom/android/server/pm/PackageSetting;",
            ">;",
            "Ljava/util/Collection<",
            "Lcom/android/server/pm/PackageSetting;",
            ">;",
            "Ljava/util/List<",
            "Lcom/android/server/pm/PackageSetting;",
            ">;",
            "Lcom/android/server/pm/PackageManagerService;",
            ")V"
        }
    .end annotation

    .line 163
    .local p0, "filter":Ljava/util/function/Predicate;, "Ljava/util/function/Predicate<Lcom/android/server/pm/PackageSetting;>;"
    .local p1, "result":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/server/pm/PackageSetting;>;"
    .local p2, "packages":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/server/pm/PackageSetting;>;"
    .local p3, "sortTemp":Ljava/util/List;, "Ljava/util/List<Lcom/android/server/pm/PackageSetting;>;"
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/pm/PackageSetting;

    .line 164
    .local v1, "pkgSetting":Lcom/android/server/pm/PackageSetting;
    invoke-interface {p0, v1}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    .line 165
    invoke-interface {p3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    .end local v1    # "pkgSetting":Lcom/android/server/pm/PackageSetting;
    :cond_19
    goto :goto_4

    .line 169
    :cond_1a
    invoke-static {p3, p4}, Lcom/android/server/pm/PackageManagerServiceUtils;->sortPackagesByUsageDate(Ljava/util/List;Lcom/android/server/pm/PackageManagerService;)V

    .line 170
    invoke-interface {p2, p3}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    .line 172
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_24
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_48

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/pm/PackageSetting;

    .line 173
    .restart local v1    # "pkgSetting":Lcom/android/server/pm/PackageSetting;
    invoke-interface {p1, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 175
    nop

    .line 176
    invoke-virtual {p4, v1}, Lcom/android/server/pm/PackageManagerService;->findSharedNonSystemLibraries(Lcom/android/server/pm/PackageSetting;)Ljava/util/List;

    move-result-object v2

    .line 177
    .local v2, "deps":Ljava/util/List;, "Ljava/util/List<Lcom/android/server/pm/PackageSetting;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_47

    .line 178
    invoke-interface {v2, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 179
    invoke-interface {p1, v2}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 180
    invoke-interface {p2, v2}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    .line 182
    .end local v1    # "pkgSetting":Lcom/android/server/pm/PackageSetting;
    .end local v2    # "deps":Ljava/util/List;, "Ljava/util/List<Lcom/android/server/pm/PackageSetting;>;"
    :cond_47
    goto :goto_24

    .line 184
    :cond_48
    invoke-interface {p3}, Ljava/util/List;->clear()V

    .line 185
    return-void
.end method

.method public static buildVerificationRootHashString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p0, "baseFilename"    # Ljava/lang/String;
    .param p1, "splitFilenameArray"    # [Ljava/lang/String;

    .line 1033
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1034
    .local v0, "sb":Ljava/lang/StringBuilder;
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 1035
    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 1036
    .local v1, "baseFilePath":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1037
    invoke-static {p0}, Lcom/android/server/pm/PackageManagerServiceUtils;->getRootHash(Ljava/lang/String;)[B

    move-result-object v3

    .line 1038
    .local v3, "baseRootHash":[B
    const-string v4, "0"

    if-nez v3, :cond_25

    .line 1039
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2c

    .line 1041
    :cond_25
    invoke-static {v3}, Lcom/android/internal/util/HexDump;->toHexString([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1043
    :goto_2c
    if-eqz p1, :cond_69

    array-length v5, p1

    if-nez v5, :cond_32

    goto :goto_69

    .line 1047
    :cond_32
    array-length v5, p1

    add-int/lit8 v5, v5, -0x1

    .local v5, "i":I
    :goto_35
    if-ltz v5, :cond_64

    .line 1048
    aget-object v6, p1, v5

    .line 1049
    .local v6, "splitFilename":Ljava/lang/String;
    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    .line 1050
    invoke-virtual {v6, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 1051
    .local v7, "splitFilePath":Ljava/lang/String;
    invoke-static {v6}, Lcom/android/server/pm/PackageManagerServiceUtils;->getRootHash(Ljava/lang/String;)[B

    move-result-object v8

    .line 1052
    .local v8, "splitRootHash":[B
    const-string v9, ";"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1053
    if-nez v8, :cond_5a

    .line 1054
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_61

    .line 1056
    :cond_5a
    invoke-static {v8}, Lcom/android/internal/util/HexDump;->toHexString([B)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1047
    .end local v6    # "splitFilename":Ljava/lang/String;
    .end local v7    # "splitFilePath":Ljava/lang/String;
    .end local v8    # "splitRootHash":[B
    :goto_61
    add-int/lit8 v5, v5, -0x1

    goto :goto_35

    .line 1059
    .end local v5    # "i":I
    :cond_64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1044
    :cond_69
    :goto_69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static calculateInstalledSize(Ljava/lang/String;Ljava/lang/String;)J
    .registers 9
    .param p0, "packagePath"    # Ljava/lang/String;
    .param p1, "abiOverride"    # Ljava/lang/String;

    .line 898
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 900
    .local v0, "packageFile":Ljava/io/File;
    :try_start_5
    invoke-static {}, Landroid/content/pm/parsing/result/ParseTypeImpl;->forDefaultParsing()Landroid/content/pm/parsing/result/ParseTypeImpl;

    move-result-object v1

    .line 901
    .local v1, "input":Landroid/content/pm/parsing/result/ParseTypeImpl;
    nop

    .line 902
    invoke-virtual {v1}, Landroid/content/pm/parsing/result/ParseTypeImpl;->reset()Landroid/content/pm/parsing/result/ParseInput;

    move-result-object v2

    const/4 v3, 0x0

    .line 901
    invoke-static {v2, v0, v3}, Landroid/content/pm/parsing/ApkLiteParseUtils;->parsePackageLite(Landroid/content/pm/parsing/result/ParseInput;Ljava/io/File;I)Landroid/content/pm/parsing/result/ParseResult;

    move-result-object v2

    .line 903
    .local v2, "result":Landroid/content/pm/parsing/result/ParseResult;, "Landroid/content/pm/parsing/result/ParseResult<Landroid/content/pm/parsing/PackageLite;>;"
    invoke-interface {v2}, Landroid/content/pm/parsing/result/ParseResult;->isError()Z

    move-result v3

    if-nez v3, :cond_24

    .line 907
    invoke-interface {v2}, Landroid/content/pm/parsing/result/ParseResult;->getResult()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/parsing/PackageLite;

    invoke-static {v3, p1}, Lcom/android/internal/content/PackageHelper;->calculateInstalledSize(Landroid/content/pm/parsing/PackageLite;Ljava/lang/String;)J

    move-result-wide v3

    return-wide v3

    .line 904
    :cond_24
    new-instance v3, Lcom/android/server/pm/PackageManagerException;

    invoke-interface {v2}, Landroid/content/pm/parsing/result/ParseResult;->getErrorCode()I

    move-result v4

    .line 905
    invoke-interface {v2}, Landroid/content/pm/parsing/result/ParseResult;->getErrorMessage()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2}, Landroid/content/pm/parsing/result/ParseResult;->getException()Ljava/lang/Exception;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lcom/android/server/pm/PackageManagerException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "packageFile":Ljava/io/File;
    .end local p0    # "packagePath":Ljava/lang/String;
    .end local p1    # "abiOverride":Ljava/lang/String;
    throw v3
    :try_end_36
    .catch Lcom/android/server/pm/PackageManagerException; {:try_start_5 .. :try_end_36} :catch_36
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_36} :catch_36

    .line 908
    .end local v1    # "input":Landroid/content/pm/parsing/result/ParseTypeImpl;
    .end local v2    # "result":Landroid/content/pm/parsing/result/ParseResult;, "Landroid/content/pm/parsing/result/ParseResult<Landroid/content/pm/parsing/PackageLite;>;"
    .restart local v0    # "packageFile":Ljava/io/File;
    .restart local p0    # "packagePath":Ljava/lang/String;
    .restart local p1    # "abiOverride":Ljava/lang/String;
    :catch_36
    move-exception v1

    .line 909
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to calculate installed size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "PackageManager"

    invoke-static {v3, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 910
    const-wide/16 v2, -0x1

    return-wide v2
.end method

.method public static checkISA(Ljava/lang/String;)Z
    .registers 7
    .param p0, "isa"    # Ljava/lang/String;

    .line 341
    sget-object v0, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_5
    if-ge v3, v1, :cond_18

    aget-object v4, v0, v3

    .line 342
    .local v4, "abi":Ljava/lang/String;
    invoke-static {v4}, Ldalvik/system/VMRuntime;->getInstructionSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 343
    const/4 v0, 0x1

    return v0

    .line 341
    .end local v4    # "abi":Ljava/lang/String;
    :cond_15
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 346
    :cond_18
    return v2
.end method

.method public static comparePackageSignatures(Lcom/android/server/pm/PackageSetting;[Landroid/content/pm/Signature;)Z
    .registers 4
    .param p0, "pkgSetting"    # Lcom/android/server/pm/PackageSetting;
    .param p1, "signatures"    # [Landroid/content/pm/Signature;

    .line 520
    iget-object v0, p0, Lcom/android/server/pm/PackageSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v0, v0, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    sget-object v1, Landroid/content/pm/PackageParser$SigningDetails;->UNKNOWN:Landroid/content/pm/PackageParser$SigningDetails;

    if-eq v0, v1, :cond_17

    iget-object v0, p0, Lcom/android/server/pm/PackageSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v0, v0, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    iget-object v0, v0, Landroid/content/pm/PackageParser$SigningDetails;->signatures:[Landroid/content/pm/Signature;

    .line 522
    invoke-static {v0, p1}, Lcom/android/server/pm/PackageManagerServiceUtils;->compareSignatures([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)I

    move-result v0

    if-nez v0, :cond_15

    goto :goto_17

    :cond_15
    const/4 v0, 0x0

    goto :goto_18

    :cond_17
    :goto_17
    const/4 v0, 0x1

    .line 520
    :goto_18
    return v0
.end method

.method public static compareSignatures([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)I
    .registers 9
    
	const/4 v0, 0x0
	
    return v0
.end method

.method public static compressedFileExists(Ljava/lang/String;)Z
    .registers 3
    .param p0, "codePath"    # Ljava/lang/String;

    .line 843
    invoke-static {p0}, Lcom/android/server/pm/PackageManagerServiceUtils;->getCompressedFiles(Ljava/lang/String;)[Ljava/io/File;

    move-result-object v0

    .line 844
    .local v0, "compressedFiles":[Ljava/io/File;
    if-eqz v0, :cond_b

    array-length v1, v0

    if-lez v1, :cond_b

    const/4 v1, 0x1

    goto :goto_c

    :cond_b
    const/4 v1, 0x0

    :goto_c
    return v1
.end method

.method private static copyFile(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)V
    .registers 7
    .param p0, "sourcePath"    # Ljava/lang/String;
    .param p1, "targetDir"    # Ljava/io/File;
    .param p2, "targetName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/system/ErrnoException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 991
    invoke-static {p2}, Landroid/os/FileUtils;->isValidExtFilename(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_57

    .line 994
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Copying "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PackageManager"

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 996
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 997
    .local v0, "targetFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    sget v2, Landroid/system/OsConstants;->O_RDWR:I

    sget v3, Landroid/system/OsConstants;->O_CREAT:I

    or-int/2addr v2, v3

    const/16 v3, 0x1a4

    invoke-static {v1, v2, v3}, Landroid/system/Os;->open(Ljava/lang/String;II)Ljava/io/FileDescriptor;

    move-result-object v1

    .line 999
    .local v1, "targetFd":Ljava/io/FileDescriptor;
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v3}, Landroid/system/Os;->chmod(Ljava/lang/String;I)V

    .line 1000
    const/4 v2, 0x0

    .line 1002
    .local v2, "source":Ljava/io/FileInputStream;
    :try_start_40
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    move-object v2, v3

    .line 1003
    invoke-virtual {v2}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v3

    invoke-static {v3, v1}, Landroid/os/FileUtils;->copy(Ljava/io/FileDescriptor;Ljava/io/FileDescriptor;)J
    :try_end_4d
    .catchall {:try_start_40 .. :try_end_4d} :catchall_52

    .line 1005
    invoke-static {v2}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1006
    nop

    .line 1007
    return-void

    .line 1005
    :catchall_52
    move-exception v3

    invoke-static {v2}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 1006
    throw v3

    .line 992
    .end local v0    # "targetFile":Ljava/io/File;
    .end local v1    # "targetFd":Ljava/io/FileDescriptor;
    .end local v2    # "source":Ljava/io/FileInputStream;
    :cond_57
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid filename: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static copyPackage(Ljava/lang/String;Ljava/io/File;)I
    .registers 11
    .param p0, "packagePath"    # Ljava/lang/String;
    .param p1, "targetDir"    # Ljava/io/File;

    .line 961
    const-string v0, "PackageManager"

    if-nez p0, :cond_6

    .line 962
    const/4 v0, -0x3

    return v0

    .line 966
    :cond_6
    :try_start_6
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 967
    .local v1, "packageFile":Ljava/io/File;
    invoke-static {}, Landroid/content/pm/parsing/result/ParseTypeImpl;->forDefaultParsing()Landroid/content/pm/parsing/result/ParseTypeImpl;

    move-result-object v2

    .line 968
    .local v2, "input":Landroid/content/pm/parsing/result/ParseTypeImpl;
    nop

    .line 969
    invoke-virtual {v2}, Landroid/content/pm/parsing/result/ParseTypeImpl;->reset()Landroid/content/pm/parsing/result/ParseInput;

    move-result-object v3

    const/4 v4, 0x0

    .line 968
    invoke-static {v3, v1, v4}, Landroid/content/pm/parsing/ApkLiteParseUtils;->parsePackageLite(Landroid/content/pm/parsing/result/ParseInput;Ljava/io/File;I)Landroid/content/pm/parsing/result/ParseResult;

    move-result-object v3

    .line 970
    .local v3, "result":Landroid/content/pm/parsing/result/ParseResult;, "Landroid/content/pm/parsing/result/ParseResult<Landroid/content/pm/parsing/PackageLite;>;"
    invoke-interface {v3}, Landroid/content/pm/parsing/result/ParseResult;->isError()Z

    move-result v4

    if-eqz v4, :cond_38

    .line 971
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to parse package at "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 972
    invoke-interface {v3}, Landroid/content/pm/parsing/result/ParseResult;->getErrorCode()I

    move-result v0

    return v0

    .line 974
    :cond_38
    invoke-interface {v3}, Landroid/content/pm/parsing/result/ParseResult;->getResult()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/parsing/PackageLite;

    .line 975
    .local v4, "pkg":Landroid/content/pm/parsing/PackageLite;
    invoke-virtual {v4}, Landroid/content/pm/parsing/PackageLite;->getBaseApkPath()Ljava/lang/String;

    move-result-object v5

    const-string v6, "base.apk"

    invoke-static {v5, p1, v6}, Lcom/android/server/pm/PackageManagerServiceUtils;->copyFile(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)V

    .line 976
    invoke-virtual {v4}, Landroid/content/pm/parsing/PackageLite;->getSplitNames()[Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/internal/util/ArrayUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_82

    .line 977
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_52
    invoke-virtual {v4}, Landroid/content/pm/parsing/PackageLite;->getSplitNames()[Ljava/lang/String;

    move-result-object v6

    array-length v6, v6

    if-ge v5, v6, :cond_82

    .line 978
    invoke-virtual {v4}, Landroid/content/pm/parsing/PackageLite;->getSplitApkPaths()[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v5

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "split_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 979
    invoke-virtual {v4}, Landroid/content/pm/parsing/PackageLite;->getSplitNames()[Ljava/lang/String;

    move-result-object v8

    aget-object v8, v8, v5

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ".apk"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 978
    invoke-static {v6, p1, v7}, Lcom/android/server/pm/PackageManagerServiceUtils;->copyFile(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)V
    :try_end_7f
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_7f} :catch_84
    .catch Landroid/system/ErrnoException; {:try_start_6 .. :try_end_7f} :catch_84

    .line 977
    add-int/lit8 v5, v5, 0x1

    goto :goto_52

    .line 982
    .end local v5    # "i":I
    :cond_82
    const/4 v0, 0x1

    return v0

    .line 983
    .end local v1    # "packageFile":Ljava/io/File;
    .end local v2    # "input":Landroid/content/pm/parsing/result/ParseTypeImpl;
    .end local v3    # "result":Landroid/content/pm/parsing/result/ParseResult;, "Landroid/content/pm/parsing/result/ParseResult<Landroid/content/pm/parsing/PackageLite;>;"
    .end local v4    # "pkg":Landroid/content/pm/parsing/PackageLite;
    :catch_84
    move-exception v1

    .line 984
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to copy package at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 985
    const/4 v0, -0x4

    return v0
.end method

.method public static decompressFile(Ljava/io/File;Ljava/io/File;)I
    .registers 7
    .param p0, "srcFile"    # Ljava/io/File;
    .param p1, "dstFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/system/ErrnoException;
        }
    .end annotation

    .line 779
    sget-boolean v0, Lcom/android/server/pm/PackageManagerService;->DEBUG_COMPRESSION:Z

    const-string v1, ", dst: "

    if-eqz v0, :cond_2a

    .line 780
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Decompress file; src: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 781
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 782
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 780
    const-string v2, "PackageManager"

    invoke-static {v2, v0}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 785
    :cond_2a
    :try_start_2a
    new-instance v0, Ljava/util/zip/GZIPInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v2}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_34} :catch_62

    .line 786
    .local v0, "fileIn":Ljava/io/InputStream;
    :try_start_34
    new-instance v2, Ljava/io/FileOutputStream;

    const/4 v3, 0x0

    invoke-direct {v2, p1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_3a
    .catchall {:try_start_34 .. :try_end_3a} :catchall_58

    .line 788
    .local v2, "fileOut":Ljava/io/OutputStream;
    :try_start_3a
    invoke-static {v0, v2}, Landroid/os/FileUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    .line 789
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x1a4

    invoke-static {v3, v4}, Landroid/system/Os;->chmod(Ljava/lang/String;I)V
    :try_end_46
    .catchall {:try_start_3a .. :try_end_46} :catchall_4e

    .line 790
    const/4 v3, 0x1

    .line 791
    :try_start_47
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_4a
    .catchall {:try_start_47 .. :try_end_4a} :catchall_58

    :try_start_4a
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_4d} :catch_62

    .line 790
    return v3

    .line 784
    :catchall_4e
    move-exception v3

    :try_start_4f
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_52
    .catchall {:try_start_4f .. :try_end_52} :catchall_53

    goto :goto_57

    :catchall_53
    move-exception v4

    :try_start_54
    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "fileIn":Ljava/io/InputStream;
    .end local p0    # "srcFile":Ljava/io/File;
    .end local p1    # "dstFile":Ljava/io/File;
    :goto_57
    throw v3
    :try_end_58
    .catchall {:try_start_54 .. :try_end_58} :catchall_58

    .end local v2    # "fileOut":Ljava/io/OutputStream;
    .restart local v0    # "fileIn":Ljava/io/InputStream;
    .restart local p0    # "srcFile":Ljava/io/File;
    .restart local p1    # "dstFile":Ljava/io/File;
    :catchall_58
    move-exception v2

    :try_start_59
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_5c
    .catchall {:try_start_59 .. :try_end_5c} :catchall_5d

    goto :goto_61

    :catchall_5d
    move-exception v3

    :try_start_5e
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "srcFile":Ljava/io/File;
    .end local p1    # "dstFile":Ljava/io/File;
    :goto_61
    throw v2
    :try_end_62
    .catch Ljava/io/IOException; {:try_start_5e .. :try_end_62} :catch_62

    .line 791
    .end local v0    # "fileIn":Ljava/io/InputStream;
    .restart local p0    # "srcFile":Ljava/io/File;
    .restart local p1    # "dstFile":Ljava/io/File;
    :catch_62
    move-exception v0

    .line 792
    .local v0, "e":Ljava/io/IOException;
    const/4 v2, 0x6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to decompress file; src: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 793
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 794
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 792
    invoke-static {v2, v1}, Lcom/android/server/pm/PackageManagerServiceUtils;->logCriticalInfo(ILjava/lang/String;)V

    .line 796
    .end local v0    # "e":Ljava/io/IOException;
    const/16 v0, -0x6e

    return v0
.end method

.method public static deriveAbiOverride(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "abiOverride"    # Ljava/lang/String;

    .line 458
    const-string v0, "-"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 459
    const/4 v0, 0x0

    return-object v0

    .line 461
    :cond_a
    return-object p0
.end method

.method public static dumpCriticalInfo(Landroid/util/proto/ProtoOutputStream;)V
    .registers 8
    .param p0, "proto"    # Landroid/util/proto/ProtoOutputStream;

    .line 373
    invoke-static {}, Lcom/android/server/pm/PackageManagerServiceUtils;->getSettingsProblemFile()Ljava/io/File;

    move-result-object v0

    .line 374
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/32 v3, 0x2dc6c0

    sub-long/2addr v1, v3

    .line 375
    .local v1, "skipSize":J
    :try_start_c
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/FileReader;

    invoke-direct {v4, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_16} :catch_4a

    .line 376
    .local v3, "in":Ljava/io/BufferedReader;
    const-wide/16 v4, 0x0

    cmp-long v4, v1, v4

    if-lez v4, :cond_22

    .line 377
    :try_start_1c
    invoke-virtual {v3, v1, v2}, Ljava/io/BufferedReader;->skip(J)J

    goto :goto_22

    .line 375
    :catchall_20
    move-exception v4

    goto :goto_41

    .line 379
    :cond_22
    :goto_22
    const/4 v4, 0x0

    .line 380
    .local v4, "line":Ljava/lang/String;
    :goto_23
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    move-object v4, v5

    if-eqz v5, :cond_3d

    .line 381
    const-string/jumbo v5, "ignored: updated version"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_34

    goto :goto_23

    .line 382
    :cond_34
    const-wide v5, 0x20900000007L

    invoke-virtual {p0, v5, v6, v4}, Landroid/util/proto/ProtoOutputStream;->write(JLjava/lang/String;)V
    :try_end_3c
    .catchall {:try_start_1c .. :try_end_3c} :catchall_20

    goto :goto_23

    .line 384
    .end local v4    # "line":Ljava/lang/String;
    :cond_3d
    :try_start_3d
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_40
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_40} :catch_4a

    .line 385
    .end local v3    # "in":Ljava/io/BufferedReader;
    goto :goto_4b

    .line 375
    .restart local v3    # "in":Ljava/io/BufferedReader;
    :goto_41
    :try_start_41
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_44
    .catchall {:try_start_41 .. :try_end_44} :catchall_45

    goto :goto_49

    :catchall_45
    move-exception v5

    :try_start_46
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "skipSize":J
    .end local p0    # "proto":Landroid/util/proto/ProtoOutputStream;
    :goto_49
    throw v4
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_4a} :catch_4a

    .line 384
    .end local v3    # "in":Ljava/io/BufferedReader;
    .restart local v0    # "file":Ljava/io/File;
    .restart local v1    # "skipSize":J
    .restart local p0    # "proto":Landroid/util/proto/ProtoOutputStream;
    :catch_4a
    move-exception v3

    .line 386
    :goto_4b
    return-void
.end method

.method public static dumpCriticalInfo(Ljava/io/PrintWriter;Ljava/lang/String;)V
    .registers 8
    .param p0, "pw"    # Ljava/io/PrintWriter;
    .param p1, "msg"    # Ljava/lang/String;

    .line 389
    invoke-static {}, Lcom/android/server/pm/PackageManagerServiceUtils;->getSettingsProblemFile()Ljava/io/File;

    move-result-object v0

    .line 390
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/32 v3, 0x2dc6c0

    sub-long/2addr v1, v3

    .line 391
    .local v1, "skipSize":J
    :try_start_c
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/FileReader;

    invoke-direct {v4, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_16} :catch_4a

    .line 392
    .local v3, "in":Ljava/io/BufferedReader;
    const-wide/16 v4, 0x0

    cmp-long v4, v1, v4

    if-lez v4, :cond_22

    .line 393
    :try_start_1c
    invoke-virtual {v3, v1, v2}, Ljava/io/BufferedReader;->skip(J)J

    goto :goto_22

    .line 391
    :catchall_20
    move-exception v4

    goto :goto_41

    .line 395
    :cond_22
    :goto_22
    const/4 v4, 0x0

    .line 396
    .local v4, "line":Ljava/lang/String;
    :goto_23
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    move-object v4, v5

    if-eqz v5, :cond_3d

    .line 397
    const-string/jumbo v5, "ignored: updated version"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_34

    goto :goto_23

    .line 398
    :cond_34
    if-eqz p1, :cond_39

    .line 399
    invoke-virtual {p0, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 401
    :cond_39
    invoke-virtual {p0, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_3c
    .catchall {:try_start_1c .. :try_end_3c} :catchall_20

    goto :goto_23

    .line 403
    .end local v4    # "line":Ljava/lang/String;
    :cond_3d
    :try_start_3d
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_40
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_40} :catch_4a

    .line 404
    .end local v3    # "in":Ljava/io/BufferedReader;
    goto :goto_4b

    .line 391
    .restart local v3    # "in":Ljava/io/BufferedReader;
    :goto_41
    :try_start_41
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_44
    .catchall {:try_start_41 .. :try_end_44} :catchall_45

    goto :goto_49

    :catchall_45
    move-exception v5

    :try_start_46
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "skipSize":J
    .end local p0    # "pw":Ljava/io/PrintWriter;
    .end local p1    # "msg":Ljava/lang/String;
    :goto_49
    throw v4
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_4a} :catch_4a

    .line 403
    .end local v3    # "in":Ljava/io/BufferedReader;
    .restart local v0    # "file":Ljava/io/File;
    .restart local v1    # "skipSize":J
    .restart local p0    # "pw":Ljava/io/PrintWriter;
    .restart local p1    # "msg":Ljava/lang/String;
    :catch_4a
    move-exception v3

    .line 405
    :goto_4b
    return-void
.end method

.method public static enforceShellRestriction(Lcom/android/server/pm/UserManagerInternal;Ljava/lang/String;II)V
    .registers 7
    .param p0, "userManager"    # Lcom/android/server/pm/UserManagerInternal;
    .param p1, "restriction"    # Ljava/lang/String;
    .param p2, "callingUid"    # I
    .param p3, "userHandle"    # I

    .line 429
    const/16 v0, 0x7d0

    if-ne p2, v0, :cond_49

    .line 430
    if-ltz p3, :cond_24

    .line 431
    invoke-virtual {p0, p1, p3}, Lcom/android/server/pm/UserManagerInternal;->hasUserRestriction(Ljava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_d

    goto :goto_24

    .line 433
    :cond_d
    new-instance v0, Ljava/lang/SecurityException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Shell does not have permission to access user "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 435
    :cond_24
    :goto_24
    if-gez p3, :cond_49

    .line 436
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unable to check shell permission for user "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\n\t"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x3

    .line 437
    invoke-static {v1}, Landroid/os/Debug;->getCallers(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 436
    const-string v1, "PackageManager"

    invoke-static {v1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 440
    :cond_49
    return-void
.end method

.method public static enforceSystemOrPhoneCaller(Ljava/lang/String;I)V
    .registers 5
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "callingUid"    # I

    .line 447
    const/16 v0, 0x3e9

    if-eq p1, v0, :cond_28

    const/16 v0, 0x3e8

    if-ne p1, v0, :cond_9

    goto :goto_28

    .line 448
    :cond_9
    new-instance v0, Ljava/lang/SecurityException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot call "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " from UID "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 451
    :cond_28
    :goto_28
    return-void
.end method

.method public static getCompressedFiles(Ljava/lang/String;)[Ljava/io/File;
    .registers 10
    .param p0, "codePath"    # Ljava/lang/String;

    .line 800
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 801
    .local v0, "stubCodePath":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 816
    .local v1, "stubName":Ljava/lang/String;
    const-string v2, "-Stub"

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    .line 817
    .local v3, "idx":I
    const/4 v4, 0x0

    if-ltz v3, :cond_78

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v3

    if-eq v5, v2, :cond_1e

    goto :goto_78

    .line 821
    :cond_1e
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    .line 822
    .local v2, "stubParentDir":Ljava/io/File;
    const-string v5, "PackageManager"

    if-nez v2, :cond_3b

    .line 823
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to determine stub parent dir for codePath: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 824
    return-object v4

    .line 827
    :cond_3b
    new-instance v4, Ljava/io/File;

    const/4 v6, 0x0

    invoke-virtual {v1, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v2, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 828
    .local v4, "compressedPath":Ljava/io/File;
    new-instance v6, Lcom/android/server/pm/PackageManagerServiceUtils$1;

    invoke-direct {v6}, Lcom/android/server/pm/PackageManagerServiceUtils$1;-><init>()V

    invoke-virtual {v4, v6}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v6

    .line 835
    .local v6, "files":[Ljava/io/File;
    sget-boolean v7, Lcom/android/server/pm/PackageManagerService;->DEBUG_COMPRESSION:Z

    if-eqz v7, :cond_77

    if-eqz v6, :cond_77

    array-length v7, v6

    if-lez v7, :cond_77

    .line 836
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getCompressedFiles["

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "]: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 839
    :cond_77
    return-object v6

    .line 818
    .end local v2    # "stubParentDir":Ljava/io/File;
    .end local v4    # "compressedPath":Ljava/io/File;
    .end local v6    # "files":[Ljava/io/File;
    :cond_78
    :goto_78
    return-object v4
.end method

.method public static getLastModifiedTime(Lcom/android/server/pm/parsing/pkg/AndroidPackage;)J
    .registers 9
    .param p0, "pkg"    # Lcom/android/server/pm/parsing/pkg/AndroidPackage;

    .line 350
    new-instance v0, Ljava/io/File;

    invoke-interface {p0}, Lcom/android/server/pm/parsing/pkg/AndroidPackage;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 351
    .local v0, "srcFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_14

    .line 352
    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v1

    return-wide v1

    .line 354
    :cond_14
    new-instance v1, Ljava/io/File;

    invoke-interface {p0}, Lcom/android/server/pm/parsing/pkg/AndroidPackage;->getBaseApkPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 355
    .local v1, "baseFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    .line 356
    .local v2, "maxModifiedTime":J
    invoke-interface {p0}, Lcom/android/server/pm/parsing/pkg/AndroidPackage;->getSplitCodePaths()[Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_46

    .line 357
    invoke-interface {p0}, Lcom/android/server/pm/parsing/pkg/AndroidPackage;->getSplitCodePaths()[Ljava/lang/String;

    move-result-object v4

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    .local v4, "i":I
    :goto_2e
    if-ltz v4, :cond_46

    .line 358
    new-instance v5, Ljava/io/File;

    invoke-interface {p0}, Lcom/android/server/pm/parsing/pkg/AndroidPackage;->getSplitCodePaths()[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v4

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 359
    .local v5, "splitFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 357
    .end local v5    # "splitFile":Ljava/io/File;
    add-int/lit8 v4, v4, -0x1

    goto :goto_2e

    .line 362
    .end local v4    # "i":I
    :cond_46
    return-wide v2
.end method

.method public static getMinimalPackageInfo(Landroid/content/Context;Landroid/content/pm/parsing/PackageLite;Ljava/lang/String;ILjava/lang/String;)Landroid/content/pm/PackageInfoLite;
    .registers 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "pkg"    # Landroid/content/pm/parsing/PackageLite;
    .param p2, "packagePath"    # Ljava/lang/String;
    .param p3, "flags"    # I
    .param p4, "abiOverride"    # Ljava/lang/String;

    .line 852
    new-instance v0, Landroid/content/pm/PackageInfoLite;

    invoke-direct {v0}, Landroid/content/pm/PackageInfoLite;-><init>()V

    .line 853
    .local v0, "ret":Landroid/content/pm/PackageInfoLite;
    const/4 v1, -0x2

    if-eqz p2, :cond_71

    if-nez p1, :cond_b

    goto :goto_71

    .line 859
    :cond_b
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 862
    .local v2, "packageFile":Ljava/io/File;
    :try_start_10
    invoke-static {p1, p4}, Lcom/android/internal/content/PackageHelper;->calculateInstalledSize(Landroid/content/pm/parsing/PackageLite;Ljava/lang/String;)J

    move-result-wide v6
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_14} :catch_63

    .line 871
    .local v6, "sizeBytes":J
    nop

    .line 873
    nop

    .line 874
    invoke-virtual {p1}, Landroid/content/pm/parsing/PackageLite;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Landroid/content/pm/parsing/PackageLite;->getInstallLocation()I

    move-result v5

    .line 873
    move-object v3, p0

    move v8, p3

    invoke-static/range {v3 .. v8}, Lcom/android/internal/content/PackageHelper;->resolveInstallLocation(Landroid/content/Context;Ljava/lang/String;IJI)I

    move-result v1

    .line 876
    .local v1, "recommendedInstallLocation":I
    invoke-virtual {p1}, Landroid/content/pm/parsing/PackageLite;->getPackageName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Landroid/content/pm/PackageInfoLite;->packageName:Ljava/lang/String;

    .line 877
    invoke-virtual {p1}, Landroid/content/pm/parsing/PackageLite;->getSplitNames()[Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Landroid/content/pm/PackageInfoLite;->splitNames:[Ljava/lang/String;

    .line 878
    invoke-virtual {p1}, Landroid/content/pm/parsing/PackageLite;->getVersionCode()I

    move-result v3

    iput v3, v0, Landroid/content/pm/PackageInfoLite;->versionCode:I

    .line 879
    invoke-virtual {p1}, Landroid/content/pm/parsing/PackageLite;->getVersionCodeMajor()I

    move-result v3

    iput v3, v0, Landroid/content/pm/PackageInfoLite;->versionCodeMajor:I

    .line 880
    invoke-virtual {p1}, Landroid/content/pm/parsing/PackageLite;->getBaseRevisionCode()I

    move-result v3

    iput v3, v0, Landroid/content/pm/PackageInfoLite;->baseRevisionCode:I

    .line 881
    invoke-virtual {p1}, Landroid/content/pm/parsing/PackageLite;->getSplitRevisionCodes()[I

    move-result-object v3

    iput-object v3, v0, Landroid/content/pm/PackageInfoLite;->splitRevisionCodes:[I

    .line 882
    invoke-virtual {p1}, Landroid/content/pm/parsing/PackageLite;->getInstallLocation()I

    move-result v3

    iput v3, v0, Landroid/content/pm/PackageInfoLite;->installLocation:I

    .line 883
    invoke-virtual {p1}, Landroid/content/pm/parsing/PackageLite;->getVerifiers()[Landroid/content/pm/VerifierInfo;

    move-result-object v3

    iput-object v3, v0, Landroid/content/pm/PackageInfoLite;->verifiers:[Landroid/content/pm/VerifierInfo;

    .line 884
    iput v1, v0, Landroid/content/pm/PackageInfoLite;->recommendedInstallLocation:I

    .line 885
    invoke-virtual {p1}, Landroid/content/pm/parsing/PackageLite;->isMultiArch()Z

    move-result v3

    iput-boolean v3, v0, Landroid/content/pm/PackageInfoLite;->multiArch:Z

    .line 886
    invoke-virtual {p1}, Landroid/content/pm/parsing/PackageLite;->isDebuggable()Z

    move-result v3

    iput-boolean v3, v0, Landroid/content/pm/PackageInfoLite;->debuggable:Z

    .line 888
    return-object v0

    .line 863
    .end local v1    # "recommendedInstallLocation":I
    .end local v6    # "sizeBytes":J
    :catch_63
    move-exception v3

    .line 864
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_6e

    .line 865
    const/4 v1, -0x6

    iput v1, v0, Landroid/content/pm/PackageInfoLite;->recommendedInstallLocation:I

    goto :goto_70

    .line 867
    :cond_6e
    iput v1, v0, Landroid/content/pm/PackageInfoLite;->recommendedInstallLocation:I

    .line 870
    :goto_70
    return-object v0

    .line 854
    .end local v2    # "packageFile":Ljava/io/File;
    .end local v3    # "e":Ljava/io/IOException;
    :cond_71
    :goto_71
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid package file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "PackageManager"

    invoke-static {v3, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 855
    iput v1, v0, Landroid/content/pm/PackageInfoLite;->recommendedInstallLocation:I

    .line 856
    return-object v0
.end method

.method private static getPackageNamesForIntent(Landroid/content/Intent;I)Landroid/util/ArraySet;
    .registers 7
    .param p0, "intent"    # Landroid/content/Intent;
    .param p1, "userId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "I)",
            "Landroid/util/ArraySet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 122
    const/4 v0, 0x0

    .line 124
    .local v0, "ris":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    :try_start_1
    invoke-static {}, Landroid/app/AppGlobals;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-interface {v1, p0, v2, v3, p1}, Landroid/content/pm/IPackageManager;->queryIntentReceivers(Landroid/content/Intent;Ljava/lang/String;II)Landroid/content/pm/ParceledListSlice;

    move-result-object v1

    .line 125
    invoke-virtual {v1}, Landroid/content/pm/ParceledListSlice;->getList()Ljava/util/List;

    move-result-object v1
    :try_end_f
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_f} :catch_11

    move-object v0, v1

    .line 127
    goto :goto_12

    .line 126
    :catch_11
    move-exception v1

    .line 128
    :goto_12
    new-instance v1, Landroid/util/ArraySet;

    invoke-direct {v1}, Landroid/util/ArraySet;-><init>()V

    .line 129
    .local v1, "pkgNames":Landroid/util/ArraySet;, "Landroid/util/ArraySet<Ljava/lang/String;>;"
    if-eqz v0, :cond_31

    .line 130
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_31

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ResolveInfo;

    .line 131
    .local v3, "ri":Landroid/content/pm/ResolveInfo;
    iget-object v4, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v4}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    .line 132
    .end local v3    # "ri":Landroid/content/pm/ResolveInfo;
    goto :goto_1d

    .line 134
    :cond_31
    return-object v1
.end method

.method public static getPackagesForDexopt(Ljava/util/Collection;Lcom/android/server/pm/PackageManagerService;)Ljava/util/List;
    .registers 3
    .param p1, "packageManagerService"    # Lcom/android/server/pm/PackageManagerService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/android/server/pm/PackageSetting;",
            ">;",
            "Lcom/android/server/pm/PackageManagerService;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/server/pm/PackageSetting;",
            ">;"
        }
    .end annotation

    .line 192
    .local p0, "packages":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/server/pm/PackageSetting;>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/android/server/pm/PackageManagerServiceUtils;->getPackagesForDexopt(Ljava/util/Collection;Lcom/android/server/pm/PackageManagerService;Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getPackagesForDexopt(Ljava/util/Collection;Lcom/android/server/pm/PackageManagerService;Z)Ljava/util/List;
    .registers 16
    .param p1, "packageManagerService"    # Lcom/android/server/pm/PackageManagerService;
    .param p2, "debug"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/android/server/pm/PackageSetting;",
            ">;",
            "Lcom/android/server/pm/PackageManagerService;",
            "Z)",
            "Ljava/util/List<",
            "Lcom/android/server/pm/PackageSetting;",
            ">;"
        }
    .end annotation

    .line 199
    .local p0, "pkgSettings":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/server/pm/PackageSetting;>;"
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 200
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/server/pm/PackageSetting;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 203
    .local v1, "remainingPkgSettings":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/pm/PackageSetting;>;"
    sget-object v2, Lcom/android/server/pm/PackageManagerServiceUtils;->REMOVE_IF_NULL_PKG:Ljava/util/function/Predicate;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 205
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 209
    .local v2, "sortTemp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/pm/PackageSetting;>;"
    sget-object v3, Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda5;->INSTANCE:Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda5;

    invoke-static {v3, v0, v1, v2, p1}, Lcom/android/server/pm/PackageManagerServiceUtils;->applyPackageFilter(Ljava/util/function/Predicate;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/List;Lcom/android/server/pm/PackageManagerService;)V

    .line 214
    sget-object v3, Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda6;->INSTANCE:Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda6;

    invoke-static {v3, v0, v1, v2, p1}, Lcom/android/server/pm/PackageManagerServiceUtils;->applyPackageFilter(Ljava/util/function/Predicate;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/List;Lcom/android/server/pm/PackageManagerService;)V

    .line 218
    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.PRE_BOOT_COMPLETED"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 219
    .local v3, "intent":Landroid/content/Intent;
    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/android/server/pm/PackageManagerServiceUtils;->getPackageNamesForIntent(Landroid/content/Intent;I)Landroid/util/ArraySet;

    move-result-object v4

    .line 220
    .local v4, "pkgNames":Landroid/util/ArraySet;, "Landroid/util/ArraySet<Ljava/lang/String;>;"
    new-instance v5, Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda3;

    invoke-direct {v5, v4}, Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda3;-><init>(Landroid/util/ArraySet;)V

    invoke-static {v5, v0, v1, v2, p1}, Lcom/android/server/pm/PackageManagerServiceUtils;->applyPackageFilter(Ljava/util/function/Predicate;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/List;Lcom/android/server/pm/PackageManagerService;)V

    .line 224
    invoke-virtual {p1}, Lcom/android/server/pm/PackageManagerService;->getDexManager()Lcom/android/server/pm/dex/DexManager;

    move-result-object v5

    .line 225
    .local v5, "dexManager":Lcom/android/server/pm/dex/DexManager;
    new-instance v6, Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda4;

    invoke-direct {v6, v5}, Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda4;-><init>(Lcom/android/server/pm/dex/DexManager;)V

    invoke-static {v6, v0, v1, v2, p1}, Lcom/android/server/pm/PackageManagerServiceUtils;->applyPackageFilter(Ljava/util/function/Predicate;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/List;Lcom/android/server/pm/PackageManagerService;)V

    .line 233
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    const-string v7, "PackageManager"

    if-nez v6, :cond_9e

    invoke-virtual {p1}, Lcom/android/server/pm/PackageManagerService;->isHistoricalPackageUsageAvailable()Z

    move-result v6

    if-eqz v6, :cond_9e

    .line 234
    if-eqz p2, :cond_57

    .line 235
    const-string v6, "Looking at historical package use"

    invoke-static {v7, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    :cond_57
    sget-object v6, Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda0;->INSTANCE:Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda0;

    invoke-static {v1, v6}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/server/pm/PackageSetting;

    .line 242
    .local v6, "lastUsed":Lcom/android/server/pm/PackageSetting;
    if-eqz p2, :cond_7c

    .line 243
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Taking package "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, v6, Lcom/android/server/pm/PackageSetting;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " as reference in time use"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    :cond_7c
    invoke-virtual {v6}, Lcom/android/server/pm/PackageSetting;->getPkgState()Lcom/android/server/pm/pkg/PackageStateUnserialized;

    move-result-object v8

    .line 247
    invoke-virtual {v8}, Lcom/android/server/pm/pkg/PackageStateUnserialized;->getLatestForegroundPackageUseTimeInMills()J

    move-result-wide v8

    .line 249
    .local v8, "estimatedPreviousSystemUseTime":J
    const-wide/16 v10, 0x0

    cmp-long v10, v8, v10

    if-eqz v10, :cond_98

    .line 252
    const-wide v10, 0xa4cb8000L

    sub-long v10, v8, v10

    .line 256
    .local v10, "cutoffTime":J
    new-instance v12, Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda2;

    invoke-direct {v12, v10, v11}, Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda2;-><init>(J)V

    move-object v10, v12

    .line 258
    .local v10, "remainingPredicate":Ljava/util/function/Predicate;, "Ljava/util/function/Predicate<Lcom/android/server/pm/PackageSetting;>;"
    goto :goto_9a

    .line 260
    .end local v10    # "remainingPredicate":Ljava/util/function/Predicate;, "Ljava/util/function/Predicate<Lcom/android/server/pm/PackageSetting;>;"
    :cond_98
    sget-object v10, Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda7;->INSTANCE:Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda7;

    .line 262
    .restart local v10    # "remainingPredicate":Ljava/util/function/Predicate;, "Ljava/util/function/Predicate<Lcom/android/server/pm/PackageSetting;>;"
    :goto_9a
    invoke-static {v1, p1}, Lcom/android/server/pm/PackageManagerServiceUtils;->sortPackagesByUsageDate(Ljava/util/List;Lcom/android/server/pm/PackageManagerService;)V

    .line 263
    .end local v6    # "lastUsed":Lcom/android/server/pm/PackageSetting;
    .end local v8    # "estimatedPreviousSystemUseTime":J
    goto :goto_a0

    .line 265
    .end local v10    # "remainingPredicate":Ljava/util/function/Predicate;, "Ljava/util/function/Predicate<Lcom/android/server/pm/PackageSetting;>;"
    :cond_9e
    sget-object v10, Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda8;->INSTANCE:Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda8;

    .line 267
    .restart local v10    # "remainingPredicate":Ljava/util/function/Predicate;, "Ljava/util/function/Predicate<Lcom/android/server/pm/PackageSetting;>;"
    :goto_a0
    invoke-static {v10, v0, v1, v2, p1}, Lcom/android/server/pm/PackageManagerServiceUtils;->applyPackageFilter(Ljava/util/function/Predicate;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/List;Lcom/android/server/pm/PackageManagerService;)V

    .line 270
    if-eqz p2, :cond_d5

    .line 271
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Packages to be dexopted: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/android/server/pm/PackageManagerServiceUtils;->packagesToString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Packages skipped from dexopt: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/android/server/pm/PackageManagerServiceUtils;->packagesToString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    :cond_d5
    return-object v0
.end method

.method private static getRootHash(Ljava/lang/String;)[B
    .registers 6
    .param p0, "filename"    # Ljava/lang/String;

    .line 1071
    nop

    .line 1072
    :try_start_1
    invoke-static {p0}, Landroid/os/incremental/IncrementalManager;->unsafeGetFileSignature(Ljava/lang/String;)[B

    move-result-object v0

    .line 1073
    .local v0, "baseFileSignature":[B
    if-eqz v0, :cond_31

    .line 1076
    nop

    .line 1077
    invoke-static {v0}, Landroid/os/incremental/V4Signature;->readFrom([B)Landroid/os/incremental/V4Signature;

    move-result-object v1

    .line 1078
    .local v1, "signature":Landroid/os/incremental/V4Signature;
    iget-object v2, v1, Landroid/os/incremental/V4Signature;->hashingInfo:[B

    if-eqz v2, :cond_29

    .line 1081
    iget-object v2, v1, Landroid/os/incremental/V4Signature;->hashingInfo:[B

    .line 1082
    invoke-static {v2}, Landroid/os/incremental/V4Signature$HashingInfo;->fromByteArray([B)Landroid/os/incremental/V4Signature$HashingInfo;

    move-result-object v2

    .line 1083
    .local v2, "hashInfo":Landroid/os/incremental/V4Signature$HashingInfo;
    iget-object v3, v2, Landroid/os/incremental/V4Signature$HashingInfo;->rawRootHash:[B

    invoke-static {v3}, Lcom/android/internal/util/ArrayUtils;->isEmpty([B)Z

    move-result v3

    if-nez v3, :cond_21

    .line 1086
    iget-object v3, v2, Landroid/os/incremental/V4Signature$HashingInfo;->rawRootHash:[B

    return-object v3

    .line 1084
    :cond_21
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Root has not present"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "filename":Ljava/lang/String;
    throw v3

    .line 1079
    .end local v2    # "hashInfo":Landroid/os/incremental/V4Signature$HashingInfo;
    .restart local p0    # "filename":Ljava/lang/String;
    :cond_29
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Hashing info not present"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "filename":Ljava/lang/String;
    throw v2

    .line 1074
    .end local v1    # "signature":Landroid/os/incremental/V4Signature;
    .restart local p0    # "filename":Ljava/lang/String;
    :cond_31
    new-instance v1, Ljava/io/IOException;

    const-string v2, "File signature not present"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "filename":Ljava/lang/String;
    throw v1
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_39} :catch_39

    .line 1087
    .end local v0    # "baseFileSignature":[B
    .restart local p0    # "filename":Ljava/lang/String;
    :catch_39
    move-exception v0

    .line 1088
    .local v0, "ignore":Ljava/io/IOException;
    const-string v1, "PackageManager"

    const-string v2, "ERROR: could not load root hash from incremental install"

    invoke-static {v1, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1090
    .end local v0    # "ignore":Ljava/io/IOException;
    const/4 v0, 0x0

    return-object v0
.end method

.method private static getSettingsProblemFile()Ljava/io/File;
    .registers 4

    .line 366
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v0

    .line 367
    .local v0, "dataDir":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string/jumbo v2, "system"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 368
    .local v1, "systemDir":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string/jumbo v3, "uiderrors.txt"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 369
    .local v2, "fname":Ljava/io/File;
    return-object v2
.end method

.method static isApkVerificationForced(Lcom/android/server/pm/PackageSetting;)Z
    .registers 2
    .param p0, "ps"    # Lcom/android/server/pm/PackageSetting;

    .line 635
    const/4 v0, 0x0

    return v0
.end method

.method static isApkVerityEnabled()Z
    .registers 3

    .line 623
    sget v0, Landroid/os/Build$VERSION;->DEVICE_INITIAL_SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x1e

    if-ge v0, v2, :cond_11

    .line 624
    const-string/jumbo v0, "ro.apk_verity.mode"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_12

    :cond_11
    const/4 v1, 0x1

    .line 623
    :cond_12
    return v1
.end method

.method public static isDowngradePermitted(IZ)Z
    .registers 7
    .param p0, "installFlags"    # I
    .param p1, "isAppDebuggable"    # Z

    .line 939
    and-int/lit16 v0, p0, 0x80

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_8

    move v0, v1

    goto :goto_9

    :cond_8
    move v0, v2

    .line 941
    .local v0, "downgradeRequested":Z
    :goto_9
    if-nez v0, :cond_c

    .line 942
    return v2

    .line 944
    :cond_c
    sget-boolean v3, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-nez v3, :cond_15

    if-eqz p1, :cond_13

    goto :goto_15

    :cond_13
    move v3, v2

    goto :goto_16

    :cond_15
    :goto_15
    move v3, v1

    .line 945
    .local v3, "isDebuggable":Z
    :goto_16
    if-eqz v3, :cond_19

    .line 946
    return v1

    .line 948
    :cond_19
    const/high16 v4, 0x100000

    and-int/2addr v4, p0

    if-eqz v4, :cond_1f

    goto :goto_20

    :cond_1f
    move v1, v2

    :goto_20
    return v1
.end method

.method static isLegacyApkVerityEnabled()Z
    .registers 3

    .line 629
    const-string/jumbo v0, "ro.apk_verity.mode"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_c

    move v1, v2

    :cond_c
    return v1
.end method

.method public static isUnusedSinceTimeInMillis(JJJLcom/android/server/pm/dex/PackageDexUsage$PackageUseInfo;JJ)Z
    .registers 16
    .param p0, "firstInstallTime"    # J
    .param p2, "currentTimeInMillis"    # J
    .param p4, "thresholdTimeinMillis"    # J
    .param p6, "packageUseInfo"    # Lcom/android/server/pm/dex/PackageDexUsage$PackageUseInfo;
    .param p7, "latestPackageUseTimeInMillis"    # J
    .param p9, "latestForegroundPackageUseTimeInMillis"    # J

    .line 290
    sub-long v0, p2, p0

    cmp-long v0, v0, p4

    const/4 v1, 0x0

    if-gez v0, :cond_8

    .line 291
    return v1

    .line 295
    :cond_8
    sub-long v2, p2, p9

    cmp-long v0, v2, p4

    const/4 v2, 0x1

    if-gez v0, :cond_11

    move v0, v2

    goto :goto_12

    :cond_11
    move v0, v1

    .line 299
    .local v0, "isActiveInForeground":Z
    :goto_12
    if-eqz v0, :cond_15

    .line 300
    return v1

    .line 305
    :cond_15
    sub-long v3, p2, p7

    cmp-long v3, v3, p4

    if-gez v3, :cond_23

    .line 308
    invoke-virtual {p6}, Lcom/android/server/pm/dex/PackageDexUsage$PackageUseInfo;->isAnyCodePathUsedByOtherApps()Z

    move-result v3

    if-eqz v3, :cond_23

    move v3, v2

    goto :goto_24

    :cond_23
    move v3, v1

    .line 310
    .local v3, "isActiveInBackgroundAndUsedByOtherPackages":Z
    :goto_24
    if-nez v3, :cond_27

    move v1, v2

    :cond_27
    return v1
.end method

.method static synthetic lambda$getPackagesForDexopt$2(Lcom/android/server/pm/PackageSetting;)Z
    .registers 2
    .param p0, "pkgSetting"    # Lcom/android/server/pm/PackageSetting;

    .line 209
    invoke-virtual {p0}, Lcom/android/server/pm/PackageSetting;->isSystem()Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$getPackagesForDexopt$3(Lcom/android/server/pm/PackageSetting;)Z
    .registers 2
    .param p0, "pkgSetting"    # Lcom/android/server/pm/PackageSetting;

    .line 214
    iget-object v0, p0, Lcom/android/server/pm/PackageSetting;->pkg:Lcom/android/server/pm/parsing/pkg/AndroidPackage;

    invoke-interface {v0}, Lcom/android/server/pm/parsing/pkg/AndroidPackage;->isCoreApp()Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$getPackagesForDexopt$4(Landroid/util/ArraySet;Lcom/android/server/pm/PackageSetting;)Z
    .registers 3
    .param p0, "pkgNames"    # Landroid/util/ArraySet;
    .param p1, "pkgSetting"    # Lcom/android/server/pm/PackageSetting;

    .line 220
    iget-object v0, p1, Lcom/android/server/pm/PackageSetting;->name:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$getPackagesForDexopt$5(Lcom/android/server/pm/dex/DexManager;Lcom/android/server/pm/PackageSetting;)Z
    .registers 3
    .param p0, "dexManager"    # Lcom/android/server/pm/dex/DexManager;
    .param p1, "pkgSetting"    # Lcom/android/server/pm/PackageSetting;

    .line 226
    iget-object v0, p1, Lcom/android/server/pm/PackageSetting;->name:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/android/server/pm/dex/DexManager;->getPackageUseInfoOrDefault(Ljava/lang/String;)Lcom/android/server/pm/dex/PackageDexUsage$PackageUseInfo;

    move-result-object v0

    .line 227
    invoke-virtual {v0}, Lcom/android/server/pm/dex/PackageDexUsage$PackageUseInfo;->isAnyCodePathUsedByOtherApps()Z

    move-result v0

    .line 226
    return v0
.end method

.method static synthetic lambda$getPackagesForDexopt$6(Lcom/android/server/pm/PackageSetting;Lcom/android/server/pm/PackageSetting;)I
    .registers 6
    .param p0, "pkgSetting1"    # Lcom/android/server/pm/PackageSetting;
    .param p1, "pkgSetting2"    # Lcom/android/server/pm/PackageSetting;

    .line 239
    nop

    .line 240
    invoke-virtual {p0}, Lcom/android/server/pm/PackageSetting;->getPkgState()Lcom/android/server/pm/pkg/PackageStateUnserialized;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/pm/pkg/PackageStateUnserialized;->getLatestForegroundPackageUseTimeInMills()J

    move-result-wide v0

    .line 241
    invoke-virtual {p1}, Lcom/android/server/pm/PackageSetting;->getPkgState()Lcom/android/server/pm/pkg/PackageStateUnserialized;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/pm/pkg/PackageStateUnserialized;->getLatestForegroundPackageUseTimeInMills()J

    move-result-wide v2

    .line 239
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Long;->compare(JJ)I

    move-result v0

    return v0
.end method

.method static synthetic lambda$getPackagesForDexopt$7(JLcom/android/server/pm/PackageSetting;)Z
    .registers 5
    .param p0, "cutoffTime"    # J
    .param p2, "pkgSetting"    # Lcom/android/server/pm/PackageSetting;

    .line 256
    invoke-virtual {p2}, Lcom/android/server/pm/PackageSetting;->getPkgState()Lcom/android/server/pm/pkg/PackageStateUnserialized;

    move-result-object v0

    .line 257
    invoke-virtual {v0}, Lcom/android/server/pm/pkg/PackageStateUnserialized;->getLatestForegroundPackageUseTimeInMills()J

    move-result-wide v0

    cmp-long v0, v0, p0

    if-ltz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    .line 256
    :goto_f
    return v0
.end method

.method static synthetic lambda$getPackagesForDexopt$8(Lcom/android/server/pm/PackageSetting;)Z
    .registers 2
    .param p0, "pkgSetting"    # Lcom/android/server/pm/PackageSetting;

    .line 260
    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$getPackagesForDexopt$9(Lcom/android/server/pm/PackageSetting;)Z
    .registers 2
    .param p0, "pkgSetting"    # Lcom/android/server/pm/PackageSetting;

    .line 265
    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$sortPackagesByUsageDate$1(Lcom/android/server/pm/PackageSetting;Lcom/android/server/pm/PackageSetting;)I
    .registers 6
    .param p0, "pkgSetting1"    # Lcom/android/server/pm/PackageSetting;
    .param p1, "pkgSetting2"    # Lcom/android/server/pm/PackageSetting;

    .line 147
    nop

    .line 148
    invoke-virtual {p1}, Lcom/android/server/pm/PackageSetting;->getPkgState()Lcom/android/server/pm/pkg/PackageStateUnserialized;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/pm/pkg/PackageStateUnserialized;->getLatestForegroundPackageUseTimeInMills()J

    move-result-wide v0

    .line 149
    invoke-virtual {p0}, Lcom/android/server/pm/PackageSetting;->getPkgState()Lcom/android/server/pm/pkg/PackageStateUnserialized;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/server/pm/pkg/PackageStateUnserialized;->getLatestForegroundPackageUseTimeInMills()J

    move-result-wide v2

    .line 147
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Long;->compare(JJ)I

    move-result v0

    return v0
.end method

.method static synthetic lambda$static$0(Lcom/android/server/pm/PackageSetting;)Z
    .registers 2
    .param p0, "pkgSetting"    # Lcom/android/server/pm/PackageSetting;

    .line 119
    iget-object v0, p0, Lcom/android/server/pm/PackageSetting;->pkg:Lcom/android/server/pm/parsing/pkg/AndroidPackage;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public static logCriticalInfo(ILjava/lang/String;)V
    .registers 10
    .param p0, "priority"    # I
    .param p1, "msg"    # Ljava/lang/String;

    .line 408
    const-string v0, "PackageManager"

    invoke-static {p0, v0, p1}, Landroid/util/Slog;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 409
    invoke-static {p1}, Lcom/android/server/EventLogTags;->writePmCriticalInfo(Ljava/lang/String;)V

    .line 411
    :try_start_8
    invoke-static {}, Lcom/android/server/pm/PackageManagerServiceUtils;->getSettingsProblemFile()Ljava/io/File;

    move-result-object v0

    .line 412
    .local v0, "fname":Ljava/io/File;
    new-instance v1, Ljava/io/FileOutputStream;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 413
    .local v1, "out":Ljava/io/FileOutputStream;
    new-instance v2, Lcom/android/internal/util/FastPrintWriter;

    invoke-direct {v2, v1}, Lcom/android/internal/util/FastPrintWriter;-><init>(Ljava/io/OutputStream;)V

    .line 414
    .local v2, "pw":Ljava/io/PrintWriter;
    new-instance v3, Ljava/text/SimpleDateFormat;

    invoke-direct {v3}, Ljava/text/SimpleDateFormat;-><init>()V

    .line 415
    .local v3, "formatter":Ljava/text/SimpleDateFormat;
    new-instance v4, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-direct {v4, v5, v6}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    .line 416
    .local v4, "dateString":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 417
    invoke-virtual {v2}, Ljava/io/PrintWriter;->close()V

    .line 418
    nop

    .line 419
    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x1fc

    .line 418
    const/4 v7, -0x1

    invoke-static {v5, v6, v7, v7}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I
    :try_end_4e
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_4e} :catch_50

    .line 423
    nop

    .end local v0    # "fname":Ljava/io/File;
    .end local v1    # "out":Ljava/io/FileOutputStream;
    .end local v2    # "pw":Ljava/io/PrintWriter;
    .end local v3    # "formatter":Ljava/text/SimpleDateFormat;
    .end local v4    # "dateString":Ljava/lang/String;
    goto :goto_51

    .line 422
    :catch_50
    move-exception v0

    .line 424
    :goto_51
    return-void
.end method

.method public static makeDirRecursive(Ljava/io/File;I)V
    .registers 7
    .param p0, "targetDir"    # Ljava/io/File;
    .param p1, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/system/ErrnoException;
        }
    .end annotation

    .line 1013
    invoke-virtual {p0}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v0

    .line 1014
    .local v0, "targetDirPath":Ljava/nio/file/Path;
    invoke-interface {v0}, Ljava/nio/file/Path;->getNameCount()I

    move-result v1

    .line 1016
    .local v1, "directoriesCount":I
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_9
    if-gt v2, v1, :cond_2c

    .line 1017
    const/4 v3, 0x0

    invoke-interface {v0, v3, v2}, Ljava/nio/file/Path;->subpath(II)Ljava/nio/file/Path;

    move-result-object v3

    invoke-interface {v3}, Ljava/nio/file/Path;->toFile()Ljava/io/File;

    move-result-object v3

    .line 1018
    .local v3, "currentDir":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 1019
    goto :goto_29

    .line 1021
    :cond_1b
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p1}, Landroid/system/Os;->mkdir(Ljava/lang/String;I)V

    .line 1022
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p1}, Landroid/system/Os;->chmod(Ljava/lang/String;I)V

    .line 1016
    :goto_29
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 1024
    .end local v2    # "i":I
    .end local v3    # "currentDir":Ljava/io/File;
    :cond_2c
    return-void
.end method

.method private static matchSignatureInSystem(Lcom/android/server/pm/PackageSetting;Lcom/android/server/pm/PackageSetting;)Z
    .registers 6
    .param p0, "pkgSetting"    # Lcom/android/server/pm/PackageSetting;
    .param p1, "disabledPkgSetting"    # Lcom/android/server/pm/PackageSetting;

    .line 595
    iget-object v0, p0, Lcom/android/server/pm/PackageSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v0, v0, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    iget-object v1, p1, Lcom/android/server/pm/PackageSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v1, v1, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageParser$SigningDetails;->checkCapability(Landroid/content/pm/PackageParser$SigningDetails;I)Z

    move-result v0

    if-nez v0, :cond_39

    iget-object v0, p1, Lcom/android/server/pm/PackageSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v0, v0, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    iget-object v1, p0, Lcom/android/server/pm/PackageSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v1, v1, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    const/16 v3, 0x8

    .line 598
    invoke-virtual {v0, v1, v3}, Landroid/content/pm/PackageParser$SigningDetails;->checkCapability(Landroid/content/pm/PackageParser$SigningDetails;I)Z

    move-result v0

    if-eqz v0, :cond_20

    goto :goto_39

    .line 603
    :cond_20
    const/4 v0, 0x6

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Updated system app mismatches cert on /system: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/server/pm/PackageSetting;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/server/pm/PackageManagerServiceUtils;->logCriticalInfo(ILjava/lang/String;)V

    .line 605
    const/4 v0, 0x0

    return v0

    .line 601
    :cond_39
    :goto_39
    return v2
.end method

.method private static matchSignaturesCompat(Ljava/lang/String;Lcom/android/server/pm/PackageSignatures;Landroid/content/pm/PackageParser$SigningDetails;)Z
    .registers 14

    const/4 v0, 0x0

    return v0
.end method

.method public static matchSignaturesRecover(Ljava/lang/String;Landroid/content/pm/SigningDetails;Landroid/content/pm/SigningDetails;I)Z
  .registers 14
  .param p3 # I
      .annotation build Landroid/content/pm/PackageParser$SigningDetails$CertCapabilities;
      .end annotation
  .end param

  const/4 v0, 0x0

  return v0
.end method

.method public static packagesToString(Ljava/util/List;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/server/pm/PackageSetting;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 326
    .local p0, "pkgSettings":Ljava/util/List;, "Ljava/util/List<Lcom/android/server/pm/PackageSetting;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 327
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_6
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_25

    .line 328
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_17

    .line 329
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    :cond_17
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/pm/PackageSetting;

    iget-object v2, v2, Lcom/android/server/pm/PackageSetting;->name:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 327
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 333
    .end local v1    # "index":I
    :cond_25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static realpath(Ljava/io/File;)Ljava/lang/String;
    .registers 3
    .param p0, "path"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 319
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/system/Os;->realpath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_8
    .catch Landroid/system/ErrnoException; {:try_start_0 .. :try_end_8} :catch_9

    return-object v0

    .line 320
    :catch_9
    move-exception v0

    .line 321
    .local v0, "ee":Landroid/system/ErrnoException;
    invoke-virtual {v0}, Landroid/system/ErrnoException;->rethrowAsIOException()Ljava/io/IOException;

    move-result-object v1

    throw v1
.end method

.method public static sortPackagesByUsageDate(Ljava/util/List;Lcom/android/server/pm/PackageManagerService;)V
    .registers 3
    .param p1, "packageManagerService"    # Lcom/android/server/pm/PackageManagerService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/server/pm/PackageSetting;",
            ">;",
            "Lcom/android/server/pm/PackageManagerService;",
            ")V"
        }
    .end annotation

    .line 142
    .local p0, "pkgSettings":Ljava/util/List;, "Ljava/util/List<Lcom/android/server/pm/PackageSetting;>;"
    invoke-virtual {p1}, Lcom/android/server/pm/PackageManagerService;->isHistoricalPackageUsageAvailable()Z

    move-result v0

    if-nez v0, :cond_7

    .line 143
    return-void

    .line 146
    :cond_7
    sget-object v0, Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda1;->INSTANCE:Lcom/android/server/pm/PackageManagerServiceUtils$$ExternalSyntheticLambda1;

    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 151
    return-void
.end method

.method public static verifySignatures(Lcom/android/server/pm/PackageSetting;Lcom/android/server/pm/PackageSetting;Landroid/content/pm/PackageParser$SigningDetails;ZZZ)Z
    .registers 16
    .param p0, "pkgSetting"    # Lcom/android/server/pm/PackageSetting;
    .param p1, "disabledPkgSetting"    # Lcom/android/server/pm/PackageSetting;
    .param p2, "parsedSignatures"    # Landroid/content/pm/PackageParser$SigningDetails;
    .param p3, "compareCompat"    # Z
    .param p4, "compareRecover"    # Z
    .param p5, "isRollback"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/server/pm/PackageManagerException;
        }
    .end annotation

    .line 647
    iget-object v0, p0, Lcom/android/server/pm/PackageSetting;->name:Ljava/lang/String;

    .line 648
    .local v0, "packageName":Ljava/lang/String;
    const/4 v1, 0x0

    .line 649
    .local v1, "compatMatch":Z
    iget-object v2, p0, Lcom/android/server/pm/PackageSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v2, v2, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    iget-object v2, v2, Landroid/content/pm/PackageParser$SigningDetails;->signatures:[Landroid/content/pm/Signature;

    const-string v3, "Package "

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v2, :cond_87

    .line 651
    iget-object v2, p0, Lcom/android/server/pm/PackageSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v2, v2, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    invoke-virtual {p2, v2, v5}, Landroid/content/pm/PackageParser$SigningDetails;->checkCapability(Landroid/content/pm/PackageParser$SigningDetails;I)Z

    move-result v2

    const/16 v6, 0x8

    if-nez v2, :cond_28

    iget-object v2, p0, Lcom/android/server/pm/PackageSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v2, v2, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    .line 654
    invoke-virtual {v2, p2, v6}, Landroid/content/pm/PackageParser$SigningDetails;->checkCapability(Landroid/content/pm/PackageParser$SigningDetails;I)Z

    move-result v2

    if-eqz v2, :cond_26

    goto :goto_28

    :cond_26
    move v2, v4

    goto :goto_29

    :cond_28
    :goto_28
    move v2, v5

    .line 657
    .local v2, "match":Z
    :goto_29
    if-nez v2, :cond_34

    if-eqz p3, :cond_34

    .line 658
    iget-object v7, p0, Lcom/android/server/pm/PackageSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    invoke-static {v0, v7, p2}, Lcom/android/server/pm/PackageManagerServiceUtils;->matchSignaturesCompat(Ljava/lang/String;Lcom/android/server/pm/PackageSignatures;Landroid/content/pm/PackageParser$SigningDetails;)Z

    move-result v2

    .line 660
    move v1, v2

    .line 662
    :cond_34
    if-nez v2, :cond_51

    if-eqz p4, :cond_51

    .line 663
    iget-object v7, p0, Lcom/android/server/pm/PackageSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v7, v7, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    invoke-static {v0, v7, p2, v5}, Lcom/android/server/pm/PackageManagerServiceUtils;->matchSignaturesRecover(Ljava/lang/String;Landroid/content/pm/PackageParser$SigningDetails;Landroid/content/pm/PackageParser$SigningDetails;I)Z

    move-result v7

    if-nez v7, :cond_4f

    iget-object v7, p0, Lcom/android/server/pm/PackageSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v7, v7, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    .line 668
    invoke-static {v0, p2, v7, v6}, Lcom/android/server/pm/PackageManagerServiceUtils;->matchSignaturesRecover(Ljava/lang/String;Landroid/content/pm/PackageParser$SigningDetails;Landroid/content/pm/PackageParser$SigningDetails;I)Z

    move-result v6

    if-eqz v6, :cond_4d

    goto :goto_4f

    :cond_4d
    move v6, v4

    goto :goto_50

    :cond_4f
    :goto_4f
    move v6, v5

    :goto_50
    move v2, v6

    .line 675
    :cond_51
    if-nez v2, :cond_5d

    invoke-static {p1}, Lcom/android/server/pm/PackageManagerServiceUtils;->isApkVerificationForced(Lcom/android/server/pm/PackageSetting;)Z

    move-result v6

    if-eqz v6, :cond_5d

    .line 676
    invoke-static {p0, p1}, Lcom/android/server/pm/PackageManagerServiceUtils;->matchSignatureInSystem(Lcom/android/server/pm/PackageSetting;Lcom/android/server/pm/PackageSetting;)Z

    move-result v2

    .line 679
    :cond_5d
    if-nez v2, :cond_69

    if-eqz p5, :cond_69

    .line 683
    iget-object v6, p0, Lcom/android/server/pm/PackageSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v6, v6, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    invoke-virtual {v6, p2}, Landroid/content/pm/PackageParser$SigningDetails;->hasAncestorOrSelf(Landroid/content/pm/PackageParser$SigningDetails;)Z

    move-result v2

    .line 686
    :cond_69
    if-eqz v2, :cond_6c

    goto :goto_87

    .line 687
    :cond_6c
    new-instance v4, Lcom/android/server/pm/PackageManagerException;

    const/4 v5, -0x7

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " signatures do not match previously installed version; ignoring!"

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v5, v3}, Lcom/android/server/pm/PackageManagerException;-><init>(ILjava/lang/String;)V

    throw v4

    .line 693
    .end local v2    # "match":Z
    :cond_87
    :goto_87
    invoke-virtual {p0}, Lcom/android/server/pm/PackageSetting;->getSharedUser()Lcom/android/server/pm/SharedUserSetting;

    move-result-object v2

    if-eqz v2, :cond_1bd

    .line 694
    invoke-virtual {p0}, Lcom/android/server/pm/PackageSetting;->getSharedUser()Lcom/android/server/pm/SharedUserSetting;

    move-result-object v2

    iget-object v2, v2, Lcom/android/server/pm/SharedUserSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v2, v2, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    sget-object v6, Landroid/content/pm/PackageParser$SigningDetails;->UNKNOWN:Landroid/content/pm/PackageParser$SigningDetails;

    if-eq v2, v6, :cond_1bd

    .line 702
    nop

    .line 704
    invoke-virtual {p0}, Lcom/android/server/pm/PackageSetting;->getSharedUser()Lcom/android/server/pm/SharedUserSetting;

    move-result-object v2

    iget-object v2, v2, Lcom/android/server/pm/SharedUserSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v2, v2, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    .line 703
    const/4 v6, 0x2

    invoke-virtual {p2, v2, v6}, Landroid/content/pm/PackageParser$SigningDetails;->checkCapability(Landroid/content/pm/PackageParser$SigningDetails;I)Z

    move-result v2

    if-nez v2, :cond_ba

    .line 706
    invoke-virtual {p0}, Lcom/android/server/pm/PackageSetting;->getSharedUser()Lcom/android/server/pm/SharedUserSetting;

    move-result-object v2

    iget-object v2, v2, Lcom/android/server/pm/SharedUserSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v2, v2, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    invoke-virtual {v2, p2, v6}, Landroid/content/pm/PackageParser$SigningDetails;->checkCapability(Landroid/content/pm/PackageParser$SigningDetails;I)Z

    move-result v2

    if-eqz v2, :cond_b8

    goto :goto_ba

    :cond_b8
    move v2, v4

    goto :goto_bb

    :cond_ba
    :goto_ba
    move v2, v5

    .line 712
    .restart local v2    # "match":Z
    :goto_bb
    if-nez v2, :cond_de

    invoke-virtual {p0}, Lcom/android/server/pm/PackageSetting;->getSharedUser()Lcom/android/server/pm/SharedUserSetting;

    move-result-object v7

    iget-object v7, v7, Lcom/android/server/pm/SharedUserSetting;->packages:Landroid/util/ArraySet;

    invoke-virtual {v7}, Landroid/util/ArraySet;->size()I

    move-result v7

    if-ne v7, v5, :cond_de

    .line 713
    invoke-virtual {p0}, Lcom/android/server/pm/PackageSetting;->getSharedUser()Lcom/android/server/pm/SharedUserSetting;

    move-result-object v7

    iget-object v7, v7, Lcom/android/server/pm/SharedUserSetting;->packages:Landroid/util/ArraySet;

    invoke-virtual {v7, v4}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/pm/PackageSetting;

    iget-object v7, v7, Lcom/android/server/pm/PackageSetting;->name:Ljava/lang/String;

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_de

    .line 714
    const/4 v2, 0x1

    .line 716
    :cond_de
    if-nez v2, :cond_ed

    if-eqz p3, :cond_ed

    .line 717
    nop

    .line 718
    invoke-virtual {p0}, Lcom/android/server/pm/PackageSetting;->getSharedUser()Lcom/android/server/pm/SharedUserSetting;

    move-result-object v7

    iget-object v7, v7, Lcom/android/server/pm/SharedUserSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    .line 717
    invoke-static {v0, v7, p2}, Lcom/android/server/pm/PackageManagerServiceUtils;->matchSignaturesCompat(Ljava/lang/String;Lcom/android/server/pm/PackageSignatures;Landroid/content/pm/PackageParser$SigningDetails;)Z

    move-result v2

    .line 720
    :cond_ed
    if-nez v2, :cond_111

    if-eqz p4, :cond_111

    .line 721
    nop

    .line 723
    invoke-virtual {p0}, Lcom/android/server/pm/PackageSetting;->getSharedUser()Lcom/android/server/pm/SharedUserSetting;

    move-result-object v7

    iget-object v7, v7, Lcom/android/server/pm/SharedUserSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v7, v7, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    .line 722
    invoke-static {v0, v7, p2, v6}, Lcom/android/server/pm/PackageManagerServiceUtils;->matchSignaturesRecover(Ljava/lang/String;Landroid/content/pm/PackageParser$SigningDetails;Landroid/content/pm/PackageParser$SigningDetails;I)Z

    move-result v7

    if-nez v7, :cond_10e

    .line 728
    invoke-virtual {p0}, Lcom/android/server/pm/PackageSetting;->getSharedUser()Lcom/android/server/pm/SharedUserSetting;

    move-result-object v7

    iget-object v7, v7, Lcom/android/server/pm/SharedUserSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v7, v7, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    .line 726
    invoke-static {v0, p2, v7, v6}, Lcom/android/server/pm/PackageManagerServiceUtils;->matchSignaturesRecover(Ljava/lang/String;Landroid/content/pm/PackageParser$SigningDetails;Landroid/content/pm/PackageParser$SigningDetails;I)Z

    move-result v7

    if-eqz v7, :cond_10f

    :cond_10e
    move v4, v5

    :cond_10f
    move v2, v4

    .line 730
    or-int/2addr v1, v2

    .line 732
    :cond_111
    const/4 v4, -0x8

    if-eqz v2, :cond_195

    .line 742
    invoke-virtual {p2}, Landroid/content/pm/PackageParser$SigningDetails;->hasPastSigningCertificates()Z

    move-result v5

    if-eqz v5, :cond_16b

    .line 743
    invoke-virtual {p0}, Lcom/android/server/pm/PackageSetting;->getSharedUser()Lcom/android/server/pm/SharedUserSetting;

    move-result-object v5

    iget-object v5, v5, Lcom/android/server/pm/SharedUserSetting;->packages:Landroid/util/ArraySet;

    invoke-virtual {v5}, Landroid/util/ArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_124
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_16b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/pm/PackageSetting;

    .line 747
    .local v7, "shUidPkgSetting":Lcom/android/server/pm/PackageSetting;
    iget-object v8, v7, Lcom/android/server/pm/PackageSetting;->name:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_139

    .line 748
    goto :goto_124

    .line 750
    :cond_139
    nop

    .line 751
    invoke-virtual {v7}, Lcom/android/server/pm/PackageSetting;->getSigningDetails()Landroid/content/pm/PackageParser$SigningDetails;

    move-result-object v8

    .line 754
    .local v8, "shUidSigningDetails":Landroid/content/pm/PackageParser$SigningDetails;
    invoke-virtual {p2, v8}, Landroid/content/pm/PackageParser$SigningDetails;->hasAncestor(Landroid/content/pm/PackageParser$SigningDetails;)Z

    move-result v9

    if-eqz v9, :cond_16a

    .line 755
    invoke-virtual {p2, v8, v6}, Landroid/content/pm/PackageParser$SigningDetails;->checkCapability(Landroid/content/pm/PackageParser$SigningDetails;I)Z

    move-result v9

    if-eqz v9, :cond_14b

    goto :goto_16a

    .line 757
    :cond_14b
    new-instance v5, Lcom/android/server/pm/PackageManagerException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " revoked the sharedUserId capability from the signing key used to sign "

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v7, Lcom/android/server/pm/PackageSetting;->name:Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v4, v3}, Lcom/android/server/pm/PackageManagerException;-><init>(ILjava/lang/String;)V

    throw v5

    .line 764
    .end local v7    # "shUidPkgSetting":Lcom/android/server/pm/PackageSetting;
    .end local v8    # "shUidSigningDetails":Landroid/content/pm/PackageParser$SigningDetails;
    :cond_16a
    :goto_16a
    goto :goto_124

    .line 768
    :cond_16b
    nop

    .line 769
    invoke-virtual {p0}, Lcom/android/server/pm/PackageSetting;->getSharedUser()Lcom/android/server/pm/SharedUserSetting;

    move-result-object v5

    iget-object v5, v5, Lcom/android/server/pm/SharedUserSetting;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v5, v5, Lcom/android/server/pm/PackageSignatures;->mSigningDetails:Landroid/content/pm/PackageParser$SigningDetails;

    .line 768
    invoke-virtual {p2, v5}, Landroid/content/pm/PackageParser$SigningDetails;->hasCommonAncestor(Landroid/content/pm/PackageParser$SigningDetails;)Z

    move-result v5

    if-eqz v5, :cond_17b

    goto :goto_1bd

    .line 770
    :cond_17b
    new-instance v5, Lcom/android/server/pm/PackageManagerException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " has a signing lineage that diverges from the lineage of the sharedUserId"

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v4, v3}, Lcom/android/server/pm/PackageManagerException;-><init>(ILjava/lang/String;)V

    throw v5

    .line 733
    :cond_195
    new-instance v5, Lcom/android/server/pm/PackageManagerException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " has no signatures that match those in shared user "

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 736
    invoke-virtual {p0}, Lcom/android/server/pm/PackageSetting;->getSharedUser()Lcom/android/server/pm/SharedUserSetting;

    move-result-object v3

    iget-object v3, v3, Lcom/android/server/pm/SharedUserSetting;->name:Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "; ignoring!"

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v4, v3}, Lcom/android/server/pm/PackageManagerException;-><init>(ILjava/lang/String;)V

    throw v5

    .line 775
    .end local v2    # "match":Z
    :cond_1bd
    :goto_1bd
    return v1
.end method
