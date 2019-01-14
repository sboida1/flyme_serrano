.class public Lcom/android/internal/telephony/SerranoRIL;
.super Lcom/android/internal/telephony/RIL;
.source "SerranoRIL.java"


# static fields
.field private static final RIL_REQUEST_DIAL_EMERGENCY:I = 0x2720

.field private static final RIL_UNSOL_AM:I = 0x2b02

.field private static final RIL_UNSOL_DEVICE_READY_NOTI:I = 0x2b00

.field private static final RIL_UNSOL_ON_SS_SAMSUNG:I = 0x410

.field private static final RIL_UNSOL_RESPONSE_HANDOVER:I = 0x2b0d

.field private static final RIL_UNSOL_RESPONSE_IMS_NETWORK_STATE_CHANGED:I = 0x40c

.field private static final RIL_UNSOL_STK_CC_ALPHA_NOTIFY_SAMSUNG:I = 0x411

.field private static final RIL_UNSOL_UICC_SUBSCRIPTION_STATUS_CHANGED_SAMSUNG:I = 0x2b17

.field private static final RIL_UNSOL_WB_AMR_STATE:I = 0x2b09

.field public static final SEND_SMS_TIMEOUT_IN_MS:J = 0x7530L


# instance fields
.field protected isGSM:Z

.field private mIsSendingSMS:Z

.field private mSMSLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "preferredNetworkType"    # I
    .param p3, "cdmaSubscription"    # I

    .prologue
    .line 65
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/internal/telephony/SerranoRIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILjava/lang/Integer;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "preferredNetworkType"    # I
    .param p3, "cdmaSubscription"    # I
    .param p4, "instanceId"    # Ljava/lang/Integer;

    .prologue
    const/4 v1, 0x0

    .line 70
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 59
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/SerranoRIL;->mSMSLock:Ljava/lang/Object;

    .line 60
    iput-boolean v1, p0, Lcom/android/internal/telephony/SerranoRIL;->mIsSendingSMS:Z

    .line 62
    iput-boolean v1, p0, Lcom/android/internal/telephony/SerranoRIL;->isGSM:Z

    .line 69
    return-void
.end method

.method private dialEmergencyCall(Ljava/lang/String;ILandroid/os/Message;)V
    .locals 4
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "clirMode"    # I
    .param p3, "result"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x0

    .line 518
    const/16 v1, 0x2720

    invoke-static {v1, p3}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 519
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 520
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 521
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 522
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 523
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 524
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 526
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/SerranoRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 528
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SerranoRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 515
    return-void
.end method

.method private fixNitz(Landroid/os/Parcel;)V
    .locals 7
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 417
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    .line 418
    .local v0, "dataPosition":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 419
    .local v1, "nitz":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    .line 421
    .local v4, "nitzReceiveTime":J
    const-string/jumbo v3, ","

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 422
    .local v2, "nitzParts":[Ljava/lang/String;
    array-length v3, v2

    const/4 v6, 0x4

    if-lt v3, v6, :cond_0

    .line 424
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v6, 0x0

    aget-object v6, v2, v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v6, ","

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v6, 0x1

    aget-object v6, v2, v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v6, ","

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v6, 0x2

    aget-object v6, v2, v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 425
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 426
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 427
    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    .line 429
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataSize(I)V

    .line 416
    :cond_0
    return-void
.end method

.method private smsLock()V
    .locals 14

    .prologue
    const-wide/16 v12, 0x0

    .line 174
    iget-object v6, p0, Lcom/android/internal/telephony/SerranoRIL;->mSMSLock:Ljava/lang/Object;

    monitor-enter v6

    .line 175
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    const-wide/16 v10, 0x7530

    add-long v2, v8, v10

    .line 176
    .local v2, "timeoutTime":J
    const-wide/16 v4, 0x7530

    .line 177
    .local v4, "waitTimeLeft":J
    :goto_0
    iget-boolean v1, p0, Lcom/android/internal/telephony/SerranoRIL;->mIsSendingSMS:Z

    if-eqz v1, :cond_0

    cmp-long v1, v4, v12

    if-lez v1, :cond_0

    .line 178
    const-string/jumbo v1, "RILJ"

    const-string/jumbo v7, "sendSMS() waiting for response of previous SEND_SMS"

    invoke-static {v1, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 180
    :try_start_1
    iget-object v1, p0, Lcom/android/internal/telephony/SerranoRIL;->mSMSLock:Ljava/lang/Object;

    invoke-virtual {v1, v4, v5}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 184
    :goto_1
    :try_start_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    sub-long v4, v2, v8

    goto :goto_0

    .line 186
    :cond_0
    cmp-long v1, v4, v12

    if-gtz v1, :cond_1

    .line 187
    const-string/jumbo v1, "RILJ"

    const-string/jumbo v7, "sendSms() timed out waiting for response of previous CDMA_SEND_SMS"

    invoke-static {v1, v7}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/internal/telephony/SerranoRIL;->mIsSendingSMS:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v6

    .line 170
    return-void

    .line 174
    .end local v2    # "timeoutTime":J
    .end local v4    # "waitTimeLeft":J
    :catchall_0
    move-exception v1

    monitor-exit v6

    throw v1

    .line 181
    .restart local v2    # "timeoutTime":J
    .restart local v4    # "waitTimeLeft":J
    :catch_0
    move-exception v0

    .local v0, "ex":Ljava/lang/InterruptedException;
    goto :goto_1
.end method


# virtual methods
.method public dial(Ljava/lang/String;ILcom/android/internal/telephony/UUSInfo;Landroid/os/Message;)V
    .locals 5
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "clirMode"    # I
    .param p3, "uusInfo"    # Lcom/android/internal/telephony/UUSInfo;
    .param p4, "result"    # Landroid/os/Message;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 76
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->isEmergencyNumber(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 77
    invoke-direct {p0, p1, p2, p4}, Lcom/android/internal/telephony/SerranoRIL;->dialEmergencyCall(Ljava/lang/String;ILandroid/os/Message;)V

    .line 78
    return-void

    .line 81
    :cond_0
    const/16 v1, 0xa

    invoke-static {v1, p4}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 83
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 84
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 85
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 86
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 87
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 89
    if-nez p3, :cond_1

    .line 90
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 98
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/SerranoRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 100
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SerranoRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 75
    return-void

    .line 92
    :cond_1
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 93
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getType()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 94
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getDcs()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 95
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeByteArray([B)V

    goto :goto_0
.end method

.method public getHardwareConfig(Landroid/os/Message;)V
    .locals 3
    .param p1, "result"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x0

    .line 563
    const-string/jumbo v1, "getHardwareConfig: not supported"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 564
    if-eqz p1, :cond_0

    .line 565
    new-instance v0, Lcom/android/internal/telephony/CommandException;

    .line 566
    sget-object v1, Lcom/android/internal/telephony/CommandException$Error;->REQUEST_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    .line 565
    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CommandException;-><init>(Lcom/android/internal/telephony/CommandException$Error;)V

    .line 567
    .local v0, "ex":Lcom/android/internal/telephony/CommandException;
    invoke-static {p1, v2, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 568
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 562
    .end local v0    # "ex":Lcom/android/internal/telephony/CommandException;
    :cond_0
    return-void
.end method

.method public getModemActivityInfo(Landroid/os/Message;)V
    .locals 3
    .param p1, "response"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x0

    .line 605
    const-string/jumbo v1, "getModemActivityInfo: not supported"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 606
    if-eqz p1, :cond_0

    .line 607
    new-instance v0, Lcom/android/internal/telephony/CommandException;

    .line 608
    sget-object v1, Lcom/android/internal/telephony/CommandException$Error;->REQUEST_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    .line 607
    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CommandException;-><init>(Lcom/android/internal/telephony/CommandException$Error;)V

    .line 609
    .local v0, "ex":Lcom/android/internal/telephony/CommandException;
    invoke-static {p1, v2, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 610
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 604
    .end local v0    # "ex":Lcom/android/internal/telephony/CommandException;
    :cond_0
    return-void
.end method

.method public getRadioCapability(Landroid/os/Message;)V
    .locals 3
    .param p1, "response"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x0

    .line 533
    const-string/jumbo v1, "getRadioCapability: returning static radio capability"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 534
    if-eqz p1, :cond_0

    .line 535
    invoke-virtual {p0}, Lcom/android/internal/telephony/SerranoRIL;->makeStaticRadioCapability()Lcom/android/internal/telephony/RadioCapability;

    move-result-object v0

    .line 536
    .local v0, "ret":Ljava/lang/Object;
    invoke-static {p1, v0, v2}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 537
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 532
    .end local v0    # "ret":Ljava/lang/Object;
    :cond_0
    return-void
.end method

.method protected notifyRegistrantsCdmaInfoRec(Lcom/android/internal/telephony/cdma/CdmaInformationRecords;)V
    .locals 6
    .param p1, "infoRec"    # Lcom/android/internal/telephony/cdma/CdmaInformationRecords;

    .prologue
    const/16 v5, 0x403

    .line 494
    const/16 v0, 0x403

    .line 496
    .local v0, "response":I
    iget-object v2, p1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords;->record:Ljava/lang/Object;

    instance-of v2, v2, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;

    if-eqz v2, :cond_0

    .line 497
    iget-object v1, p1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords;->record:Ljava/lang/Object;

    check-cast v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;

    .line 498
    .local v1, "sir":Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;
    if-eqz v1, :cond_0

    .line 499
    iget-boolean v2, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->isPresent:Z

    .line 498
    if-eqz v2, :cond_0

    .line 500
    iget v2, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->signalType:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 501
    iget v2, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->alertPitch:I

    if-nez v2, :cond_0

    .line 502
    iget v2, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->signal:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 504
    const-string/jumbo v2, "RILJ"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Dropping \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v5}, Lcom/android/internal/telephony/SerranoRIL;->responseToString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 505
    invoke-static {v5, v1}, Lcom/android/internal/telephony/SerranoRIL;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 504
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 506
    const-string/jumbo v4, "\" to prevent \"ring of death\" bug."

    .line 504
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 507
    return-void

    .line 511
    .end local v1    # "sir":Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;
    :cond_0
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->notifyRegistrantsCdmaInfoRec(Lcom/android/internal/telephony/cdma/CdmaInformationRecords;)V

    .line 493
    return-void
.end method

.method protected processSolicited(Landroid/os/Parcel;I)Lcom/android/internal/telephony/RILRequest;
    .locals 13
    .param p1, "p"    # Landroid/os/Parcel;
    .param p2, "type"    # I

    .prologue
    const/4 v12, 0x0

    .line 307
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    .line 309
    .local v0, "dataPosition":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    .line 310
    .local v6, "serial":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 314
    .local v2, "error":I
    iget-object v9, p0, Lcom/android/internal/telephony/SerranoRIL;->mRequestList:Landroid/util/SparseArray;

    invoke-virtual {v9, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/internal/telephony/RILRequest;

    .line 315
    .local v5, "rr":Lcom/android/internal/telephony/RILRequest;
    if-eqz v5, :cond_0

    if-eqz v2, :cond_1

    .line 316
    :cond_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 317
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/RIL;->processSolicited(Landroid/os/Parcel;I)Lcom/android/internal/telephony/RILRequest;

    move-result-object v9

    return-object v9

    .line 315
    :cond_1
    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v9

    if-lez v9, :cond_0

    .line 320
    :try_start_0
    iget v9, v5, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    packed-switch v9, :pswitch_data_0

    .line 396
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 397
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/RIL;->processSolicited(Landroid/os/Parcel;I)Lcom/android/internal/telephony/RILRequest;

    move-result-object v9

    return-object v9

    .line 322
    :pswitch_0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SerranoRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    .line 324
    .local v4, "operators":[Ljava/lang/String;
    const-string/jumbo v9, "Operator response"

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 326
    if-eqz v4, :cond_2

    array-length v9, v4

    if-gez v9, :cond_6

    .line 327
    :cond_2
    const-string/jumbo v9, "Operators is empty or null"

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 335
    :cond_3
    iget-boolean v9, p0, Lcom/android/internal/telephony/SerranoRIL;->isGSM:Z

    if-nez v9, :cond_4

    .line 336
    const-string/jumbo v9, "Forcing operator name using build property ro.cdma.home.operator.alpha"

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 337
    const-string/jumbo v9, "ro.cdma.home.operator.alpha"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    aput-object v9, v4, v10

    .line 340
    :cond_4
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "< "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v5, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v10}, Lcom/android/internal/telephony/SerranoRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 341
    const-string/jumbo v10, " "

    .line 340
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 341
    iget v10, v5, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v10, v4}, Lcom/android/internal/telephony/SerranoRIL;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 340
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 343
    iget-object v9, v5, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v9, :cond_5

    .line 344
    iget-object v9, v5, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    const/4 v10, 0x0

    invoke-static {v9, v4, v10}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 345
    iget-object v9, v5, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v9}, Landroid/os/Message;->sendToTarget()V

    .line 347
    :cond_5
    iget-object v9, p0, Lcom/android/internal/telephony/SerranoRIL;->mRequestList:Landroid/util/SparseArray;

    invoke-virtual {v9, v6}, Landroid/util/SparseArray;->remove(I)V

    .line 412
    .end local v4    # "operators":[Ljava/lang/String;
    :goto_0
    return-object v5

    .line 329
    .restart local v4    # "operators":[Ljava/lang/String;
    :cond_6
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Length of operators:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    array-length v10, v4

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 330
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v9, v4

    if-ge v3, v9, :cond_3

    .line 331
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Operator["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "]:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v4, v3

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 330
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 350
    .end local v3    # "i":I
    .end local v4    # "operators":[Ljava/lang/String;
    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SerranoRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    .line 352
    .local v8, "voiceRegStates":[Ljava/lang/String;
    const-string/jumbo v9, "VoiceRegistrationState response"

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 354
    if-eqz v8, :cond_7

    array-length v9, v8

    if-gez v9, :cond_b

    .line 355
    :cond_7
    const-string/jumbo v9, "VoiceRegStates is empty or null"

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 363
    :cond_8
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "< "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v5, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v10}, Lcom/android/internal/telephony/SerranoRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 364
    const-string/jumbo v10, " "

    .line 363
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 364
    iget v10, v5, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v10, v8}, Lcom/android/internal/telephony/SerranoRIL;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 363
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 366
    iget-object v9, v5, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v9, :cond_9

    .line 367
    iget-object v9, v5, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    const/4 v10, 0x0

    invoke-static {v9, v8, v10}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 368
    iget-object v9, v5, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v9}, Landroid/os/Message;->sendToTarget()V

    .line 370
    :cond_9
    iget-object v9, p0, Lcom/android/internal/telephony/SerranoRIL;->mRequestList:Landroid/util/SparseArray;

    invoke-virtual {v9, v6}, Landroid/util/SparseArray;->remove(I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 398
    .end local v8    # "voiceRegStates":[Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 401
    .local v7, "tr":Ljava/lang/Throwable;
    const-string/jumbo v9, "RILJ"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "< "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 402
    iget v11, v5, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v11}, Lcom/android/internal/telephony/SerranoRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v11

    .line 401
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 403
    const-string/jumbo v11, " exception, possible invalid RIL response"

    .line 401
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 405
    iget-object v9, v5, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v9, :cond_a

    .line 406
    iget-object v9, v5, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-static {v9, v12, v7}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 407
    iget-object v9, v5, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v9}, Landroid/os/Message;->sendToTarget()V

    .line 409
    :cond_a
    return-object v5

    .line 357
    .end local v7    # "tr":Ljava/lang/Throwable;
    .restart local v8    # "voiceRegStates":[Ljava/lang/String;
    :cond_b
    :try_start_1
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Length of voiceRegStates:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    array-length v10, v8

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 358
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_2
    array-length v9, v8

    if-ge v3, v9, :cond_8

    .line 359
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "VoiceRegStates["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "]:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v8, v3

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 358
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 373
    .end local v3    # "i":I
    .end local v8    # "voiceRegStates":[Ljava/lang/String;
    :pswitch_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SerranoRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    .line 375
    .local v1, "dataRegStates":[Ljava/lang/String;
    const-string/jumbo v9, "DataRegistrationState response"

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 377
    if-eqz v1, :cond_c

    array-length v9, v1

    if-gez v9, :cond_f

    .line 378
    :cond_c
    const-string/jumbo v9, "DataRegStates is empty or null"

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 386
    :cond_d
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "< "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v5, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v10}, Lcom/android/internal/telephony/SerranoRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 387
    const-string/jumbo v10, " "

    .line 386
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 387
    iget v10, v5, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v10, v1}, Lcom/android/internal/telephony/SerranoRIL;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 386
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 389
    iget-object v9, v5, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v9, :cond_e

    .line 390
    iget-object v9, v5, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    const/4 v10, 0x0

    invoke-static {v9, v1, v10}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 391
    iget-object v9, v5, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v9}, Landroid/os/Message;->sendToTarget()V

    .line 393
    :cond_e
    iget-object v9, p0, Lcom/android/internal/telephony/SerranoRIL;->mRequestList:Landroid/util/SparseArray;

    invoke-virtual {v9, v6}, Landroid/util/SparseArray;->remove(I)V

    goto/16 :goto_0

    .line 380
    :cond_f
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Length of dataRegStates:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    array-length v10, v1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 381
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_3
    array-length v9, v1

    if-ge v3, v9, :cond_d

    .line 382
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "DataRegStates["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "]:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v1, v3

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 381
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 320
    :pswitch_data_0
    .packed-switch 0x14
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method protected processUnsolicited(Landroid/os/Parcel;I)V
    .locals 7
    .param p1, "p"    # Landroid/os/Parcel;
    .param p2, "type"    # I

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 437
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    .line 438
    .local v0, "dataPosition":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 440
    .local v1, "response":I
    sparse-switch v1, :sswitch_data_0

    .line 484
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 487
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/RIL;->processUnsolicited(Landroid/os/Parcel;I)V

    .line 488
    return-void

    .line 442
    :sswitch_0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SerranoRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .line 443
    .local v2, "ret":Ljava/lang/Object;
    invoke-virtual {p0, v6, v5}, Lcom/android/internal/telephony/SerranoRIL;->setRadioPower(ZLandroid/os/Message;)V

    .line 444
    iget v3, p0, Lcom/android/internal/telephony/SerranoRIL;->mPreferredNetworkType:I

    invoke-virtual {p0, v3, v5}, Lcom/android/internal/telephony/SerranoRIL;->setPreferredNetworkType(ILandroid/os/Message;)V

    .line 445
    iget v3, p0, Lcom/android/internal/telephony/SerranoRIL;->mCdmaSubscription:I

    invoke-virtual {p0, v3, v5}, Lcom/android/internal/telephony/SerranoRIL;->setCdmaSubscriptionSource(ILandroid/os/Message;)V

    .line 446
    iget v3, p0, Lcom/android/internal/telephony/SerranoRIL;->mRilVersion:I

    const/16 v4, 0x8

    if-lt v3, v4, :cond_0

    .line 447
    const v3, 0x7fffffff

    invoke-virtual {p0, v3, v5}, Lcom/android/internal/telephony/SerranoRIL;->setCellInfoListRate(ILandroid/os/Message;)V

    .line 448
    :cond_0
    check-cast v2, [I

    .end local v2    # "ret":Ljava/lang/Object;
    aget v3, v2, v6

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/SerranoRIL;->notifyRegistrantsRilConnectionChanged(I)V

    .line 435
    :goto_0
    return-void

    .line 451
    :sswitch_1
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/SerranoRIL;->fixNitz(Landroid/os/Parcel;)V

    .line 452
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 453
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/RIL;->processUnsolicited(Landroid/os/Parcel;I)V

    goto :goto_0

    .line 456
    :sswitch_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SerranoRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2    # "ret":Ljava/lang/Object;
    goto :goto_0

    .line 459
    .end local v2    # "ret":Ljava/lang/Object;
    :sswitch_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SerranoRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2    # "ret":Ljava/lang/Object;
    goto :goto_0

    .line 462
    .end local v2    # "ret":Ljava/lang/Object;
    :sswitch_4
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SerranoRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2    # "ret":Ljava/lang/Object;
    goto :goto_0

    .line 465
    .end local v2    # "ret":Ljava/lang/Object;
    :sswitch_5
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SerranoRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2    # "ret":Ljava/lang/Object;
    goto :goto_0

    .line 468
    .end local v2    # "ret":Ljava/lang/Object;
    :sswitch_6
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SerranoRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2    # "ret":Ljava/lang/Object;
    goto :goto_0

    .line 471
    .end local v2    # "ret":Ljava/lang/Object;
    :sswitch_7
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 472
    const/16 v3, 0x413

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 475
    :sswitch_8
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 476
    const/16 v3, 0x414

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 479
    :sswitch_9
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 480
    const/16 v3, 0x40e

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 440
    nop

    :sswitch_data_0
    .sparse-switch
        0x3f0 -> :sswitch_1
        0x40a -> :sswitch_0
        0x40c -> :sswitch_2
        0x410 -> :sswitch_7
        0x411 -> :sswitch_8
        0x2b00 -> :sswitch_3
        0x2b02 -> :sswitch_4
        0x2b09 -> :sswitch_5
        0x2b0d -> :sswitch_6
        0x2b17 -> :sswitch_9
    .end sparse-switch
.end method

.method protected responseCallList(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 15
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 200
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    .line 201
    .local v7, "num":I
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 208
    .local v8, "response":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/DriverCall;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v7, :cond_8

    .line 209
    new-instance v3, Lcom/android/internal/telephony/DriverCall;

    invoke-direct {v3}, Lcom/android/internal/telephony/DriverCall;-><init>()V

    .line 211
    .local v3, "dc":Lcom/android/internal/telephony/DriverCall;
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    invoke-static {v11}, Lcom/android/internal/telephony/DriverCall;->stateFromCLCC(I)Lcom/android/internal/telephony/DriverCall$State;

    move-result-object v11

    iput-object v11, v3, Lcom/android/internal/telephony/DriverCall;->state:Lcom/android/internal/telephony/DriverCall$State;

    .line 212
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    and-int/lit16 v11, v11, 0xff

    iput v11, v3, Lcom/android/internal/telephony/DriverCall;->index:I

    .line 213
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    iput v11, v3, Lcom/android/internal/telephony/DriverCall;->TOA:I

    .line 214
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    if-eqz v11, :cond_1

    const/4 v11, 0x1

    :goto_1
    iput-boolean v11, v3, Lcom/android/internal/telephony/DriverCall;->isMpty:Z

    .line 215
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    if-eqz v11, :cond_2

    const/4 v11, 0x1

    :goto_2
    iput-boolean v11, v3, Lcom/android/internal/telephony/DriverCall;->isMT:Z

    .line 216
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    iput v11, v3, Lcom/android/internal/telephony/DriverCall;->als:I

    .line 217
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    if-eqz v11, :cond_3

    const/4 v11, 0x1

    :goto_3
    iput-boolean v11, v3, Lcom/android/internal/telephony/DriverCall;->isVoice:Z

    .line 218
    iget-boolean v11, p0, Lcom/android/internal/telephony/SerranoRIL;->isGSM:Z

    if-eqz v11, :cond_0

    .line 219
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    if-eqz v11, :cond_4

    const/4 v5, 0x1

    .line 220
    .local v5, "isVideo":Z
    :goto_4
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 221
    .local v1, "call_type":I
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 222
    .local v0, "call_domain":I
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 224
    .end local v0    # "call_domain":I
    .end local v1    # "call_type":I
    .end local v5    # "isVideo":Z
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    if-eqz v11, :cond_5

    const/4 v11, 0x1

    :goto_5
    iput-boolean v11, v3, Lcom/android/internal/telephony/DriverCall;->isVoicePrivacy:Z

    .line 225
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, v3, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    .line 226
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    .line 227
    .local v6, "np":I
    invoke-static {v6}, Lcom/android/internal/telephony/DriverCall;->presentationFromCLIP(I)I

    move-result v11

    iput v11, v3, Lcom/android/internal/telephony/DriverCall;->numberPresentation:I

    .line 228
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, v3, Lcom/android/internal/telephony/DriverCall;->name:Ljava/lang/String;

    .line 229
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    iput v11, v3, Lcom/android/internal/telephony/DriverCall;->namePresentation:I

    .line 230
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v10

    .line 231
    .local v10, "uusInfoPresent":I
    const/4 v11, 0x1

    if-ne v10, v11, :cond_6

    .line 232
    new-instance v11, Lcom/android/internal/telephony/UUSInfo;

    invoke-direct {v11}, Lcom/android/internal/telephony/UUSInfo;-><init>()V

    iput-object v11, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    .line 233
    iget-object v11, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v12

    invoke-virtual {v11, v12}, Lcom/android/internal/telephony/UUSInfo;->setType(I)V

    .line 234
    iget-object v11, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v12

    invoke-virtual {v11, v12}, Lcom/android/internal/telephony/UUSInfo;->setDcs(I)V

    .line 235
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v9

    .line 236
    .local v9, "userData":[B
    iget-object v11, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v11, v9}, Lcom/android/internal/telephony/UUSInfo;->setUserData([B)V

    .line 237
    const-string/jumbo v11, "Incoming UUS : type=%d, dcs=%d, length=%d"

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    .line 238
    iget-object v13, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v13}, Lcom/android/internal/telephony/UUSInfo;->getType()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/4 v14, 0x0

    aput-object v13, v12, v14

    iget-object v13, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v13}, Lcom/android/internal/telephony/UUSInfo;->getDcs()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/4 v14, 0x1

    aput-object v13, v12, v14

    .line 239
    iget-object v13, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v13}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v13

    array-length v13, v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/4 v14, 0x2

    aput-object v13, v12, v14

    .line 237
    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/SerranoRIL;->riljLogv(Ljava/lang/String;)V

    .line 240
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Incoming UUS : data (string)="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 241
    new-instance v12, Ljava/lang/String;

    iget-object v13, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v13}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/String;-><init>([B)V

    .line 240
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/SerranoRIL;->riljLogv(Ljava/lang/String;)V

    .line 242
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Incoming UUS : data (hex): "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 243
    iget-object v12, v3, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v12}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v12

    invoke-static {v12}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v12

    .line 242
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/SerranoRIL;->riljLogv(Ljava/lang/String;)V

    .line 249
    .end local v9    # "userData":[B
    :goto_6
    iget-object v11, v3, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    iget v12, v3, Lcom/android/internal/telephony/DriverCall;->TOA:I

    invoke-static {v11, v12}, Landroid/telephony/PhoneNumberUtils;->stringFromStringAndTOA(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v3, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    .line 251
    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 253
    iget-boolean v11, v3, Lcom/android/internal/telephony/DriverCall;->isVoicePrivacy:Z

    if-eqz v11, :cond_7

    .line 254
    iget-object v11, p0, Lcom/android/internal/telephony/SerranoRIL;->mVoicePrivacyOnRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v11}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 255
    const-string/jumbo v11, "InCall VoicePrivacy is enabled"

    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 208
    :goto_7
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 214
    .end local v6    # "np":I
    .end local v10    # "uusInfoPresent":I
    :cond_1
    const/4 v11, 0x0

    goto/16 :goto_1

    .line 215
    :cond_2
    const/4 v11, 0x0

    goto/16 :goto_2

    .line 217
    :cond_3
    const/4 v11, 0x0

    goto/16 :goto_3

    .line 219
    :cond_4
    const/4 v5, 0x0

    .restart local v5    # "isVideo":Z
    goto/16 :goto_4

    .line 224
    .end local v5    # "isVideo":Z
    :cond_5
    const/4 v11, 0x0

    goto/16 :goto_5

    .line 245
    .restart local v6    # "np":I
    .restart local v10    # "uusInfoPresent":I
    :cond_6
    const-string/jumbo v11, "Incoming UUS : NOT present!"

    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/SerranoRIL;->riljLogv(Ljava/lang/String;)V

    goto :goto_6

    .line 257
    :cond_7
    iget-object v11, p0, Lcom/android/internal/telephony/SerranoRIL;->mVoicePrivacyOffRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v11}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 258
    const-string/jumbo v11, "InCall VoicePrivacy is disabled"

    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    goto :goto_7

    .line 262
    .end local v3    # "dc":Lcom/android/internal/telephony/DriverCall;
    .end local v6    # "np":I
    .end local v10    # "uusInfoPresent":I
    :cond_8
    invoke-static {v8}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 264
    if-nez v7, :cond_9

    iget-object v11, p0, Lcom/android/internal/telephony/SerranoRIL;->mTestingEmergencyCall:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v11

    if-eqz v11, :cond_9

    .line 265
    iget-object v11, p0, Lcom/android/internal/telephony/SerranoRIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    if-eqz v11, :cond_9

    .line 266
    const-string/jumbo v11, "responseCallList: call ended, testing emergency call, notify ECM Registrants"

    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 268
    iget-object v11, p0, Lcom/android/internal/telephony/SerranoRIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    invoke-virtual {v11}, Landroid/os/Registrant;->notifyRegistrant()V

    .line 272
    :cond_9
    return-object v8
.end method

.method protected responseFailCause(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 6
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v5, 0x0

    .line 546
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 547
    .local v2, "numInts":I
    new-array v3, v2, [I

    .line 548
    .local v3, "response":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 549
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    aput v4, v3, v1

    .line 548
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 551
    :cond_0
    new-instance v0, Lcom/android/internal/telephony/LastCallFailCause;

    invoke-direct {v0}, Lcom/android/internal/telephony/LastCallFailCause;-><init>()V

    .line 552
    .local v0, "failCause":Lcom/android/internal/telephony/LastCallFailCause;
    aget v4, v3, v5

    iput v4, v0, Lcom/android/internal/telephony/LastCallFailCause;->causeCode:I

    .line 553
    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v4

    if-lez v4, :cond_1

    .line 554
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/LastCallFailCause;->vendorCause:Ljava/lang/String;

    .line 556
    :cond_1
    return-object v0
.end method

.method protected responseIccCardStatus(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 5
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 108
    new-instance v1, Lcom/android/internal/telephony/uicc/IccCardStatus;

    invoke-direct {v1}, Lcom/android/internal/telephony/uicc/IccCardStatus;-><init>()V

    .line 109
    .local v1, "cardStatus":Lcom/android/internal/telephony/uicc/IccCardStatus;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v1, v4}, Lcom/android/internal/telephony/uicc/IccCardStatus;->setCardState(I)V

    .line 110
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v1, v4}, Lcom/android/internal/telephony/uicc/IccCardStatus;->setUniversalPinState(I)V

    .line 111
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    iput v4, v1, Lcom/android/internal/telephony/uicc/IccCardStatus;->mGsmUmtsSubscriptionAppIndex:I

    .line 112
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    iput v4, v1, Lcom/android/internal/telephony/uicc/IccCardStatus;->mCdmaSubscriptionAppIndex:I

    .line 113
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    iput v4, v1, Lcom/android/internal/telephony/uicc/IccCardStatus;->mImsSubscriptionAppIndex:I

    .line 115
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 118
    .local v3, "numApplications":I
    const/16 v4, 0x8

    if-le v3, v4, :cond_0

    .line 119
    const/16 v3, 0x8

    .line 121
    :cond_0
    new-array v4, v3, [Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    iput-object v4, v1, Lcom/android/internal/telephony/uicc/IccCardStatus;->mApplications:[Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    .line 123
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_1

    .line 124
    new-instance v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    invoke-direct {v0}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;-><init>()V

    .line 125
    .local v0, "appStatus":Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->AppTypeFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_type:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    .line 126
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->AppStateFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_state:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    .line 127
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->PersoSubstateFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->perso_substate:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .line 128
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->aid:Ljava/lang/String;

    .line 129
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_label:Ljava/lang/String;

    .line 130
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    iput v4, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1_replaced:I

    .line 131
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->PinStateFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .line 132
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->PinStateFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin2:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .line 133
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 134
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 135
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 136
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 137
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 139
    iget-object v4, v1, Lcom/android/internal/telephony/uicc/IccCardStatus;->mApplications:[Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    aput-object v0, v4, v2

    .line 123
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 141
    .end local v0    # "appStatus":Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
    :cond_1
    return-object v1
.end method

.method protected responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 162
    iget-object v1, p0, Lcom/android/internal/telephony/SerranoRIL;->mSMSLock:Ljava/lang/Object;

    monitor-enter v1

    .line 163
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/android/internal/telephony/SerranoRIL;->mIsSendingSMS:Z

    .line 164
    iget-object v0, p0, Lcom/android/internal/telephony/SerranoRIL;->mSMSLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 167
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 162
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method protected responseSignalStrength(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 18
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 277
    const/16 v16, 0xc

    .line 281
    .local v16, "numInts":I
    move/from16 v0, v16

    new-array v0, v0, [I

    move-object/from16 v17, v0

    .line 282
    .local v17, "response":[I
    const/4 v15, 0x0

    .line 277
    .local v15, "i":I
    :goto_0
    const/16 v1, 0xc

    .line 282
    if-ge v15, v1, :cond_0

    .line 283
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    aput v1, v17, v15

    .line 282
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 287
    :cond_0
    const/4 v1, 0x0

    aget v2, v17, v1

    and-int/lit16 v2, v2, 0xff

    aput v2, v17, v1

    .line 290
    const/4 v1, 0x2

    aget v2, v17, v1

    rem-int/lit16 v2, v2, 0x100

    aput v2, v17, v1

    .line 291
    const/4 v1, 0x4

    aget v2, v17, v1

    rem-int/lit16 v2, v2, 0x100

    aput v2, v17, v1

    .line 292
    const/4 v1, 0x7

    aget v2, v17, v1

    and-int/lit16 v2, v2, 0xff

    aput v2, v17, v1

    .line 294
    new-instance v1, Landroid/telephony/SignalStrength;

    const/4 v2, 0x0

    aget v2, v17, v2

    const/4 v3, 0x1

    aget v3, v17, v3

    const/4 v4, 0x2

    aget v4, v17, v4

    const/4 v5, 0x3

    aget v5, v17, v5

    const/4 v6, 0x4

    aget v6, v17, v6

    const/4 v7, 0x5

    aget v7, v17, v7

    const/4 v8, 0x6

    aget v8, v17, v8

    const/4 v9, 0x7

    aget v9, v17, v9

    const/16 v10, 0x8

    aget v10, v17, v10

    const/16 v11, 0x9

    aget v11, v17, v11

    const/16 v12, 0xa

    aget v12, v17, v12

    const/16 v13, 0xb

    aget v13, v17, v13

    const/4 v14, 0x1

    invoke-direct/range {v1 .. v14}, Landroid/telephony/SignalStrength;-><init>(IIIIIIIIIIIIZ)V

    return-object v1
.end method

.method public sendCdmaSms([BLandroid/os/Message;)V
    .locals 0
    .param p1, "pdu"    # [B
    .param p2, "result"    # Landroid/os/Message;

    .prologue
    .line 147
    invoke-direct {p0}, Lcom/android/internal/telephony/SerranoRIL;->smsLock()V

    .line 148
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/RIL;->sendCdmaSms([BLandroid/os/Message;)V

    .line 146
    return-void
.end method

.method public sendSMS(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 0
    .param p1, "smscPDU"    # Ljava/lang/String;
    .param p2, "pdu"    # Ljava/lang/String;
    .param p3, "result"    # Landroid/os/Message;

    .prologue
    .line 154
    invoke-direct {p0}, Lcom/android/internal/telephony/SerranoRIL;->smsLock()V

    .line 155
    invoke-super {p0, p1, p2, p3}, Lcom/android/internal/telephony/RIL;->sendSMS(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 153
    return-void
.end method

.method public setDataAllowed(ZLandroid/os/Message;)V
    .locals 5
    .param p1, "allowed"    # Z
    .param p2, "result"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x1

    .line 574
    const-string/jumbo v3, "persist.radio.multisim.config"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "dsds"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 575
    const/16 v0, 0x7b

    .line 577
    .local v0, "req":I
    if-eqz p1, :cond_1

    .line 578
    const/16 v0, 0x74

    .line 579
    invoke-static {v0, p2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v1

    .line 586
    .local v1, "rr":Lcom/android/internal/telephony/RILRequest;
    :goto_0
    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SerranoRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 573
    .end local v0    # "req":I
    .end local v1    # "rr":Lcom/android/internal/telephony/RILRequest;
    :cond_0
    return-void

    .line 581
    .restart local v0    # "req":I
    :cond_1
    invoke-static {v0, p2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v1

    .line 582
    .restart local v1    # "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v3, v1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v3, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 583
    iget-object v3, v1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    if-eqz p1, :cond_2

    :goto_1
    invoke-virtual {v3, v2}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public setPhoneType(I)V
    .locals 1
    .param p1, "phoneType"    # I

    .prologue
    .line 299
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->setPhoneType(I)V

    .line 300
    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/android/internal/telephony/SerranoRIL;->isGSM:Z

    .line 298
    return-void

    .line 300
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setUiccSubscription(IZLandroid/os/Message;)V
    .locals 3
    .param p1, "appIndex"    # I
    .param p2, "activate"    # Z
    .param p3, "result"    # Landroid/os/Message;

    .prologue
    .line 617
    const/16 v1, 0x73

    invoke-static {v1, p3}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 619
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/SerranoRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 620
    const-string/jumbo v2, " appIndex: "

    .line 619
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 620
    const-string/jumbo v2, " activate: "

    .line 619
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 622
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    iget-object v2, p0, Lcom/android/internal/telephony/SerranoRIL;->mInstanceId:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 623
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 624
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    iget-object v2, p0, Lcom/android/internal/telephony/SerranoRIL;->mInstanceId:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 625
    iget-object v2, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    if-eqz p2, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v2, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 627
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/SerranoRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 615
    return-void

    .line 625
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public startLceService(IZLandroid/os/Message;)V
    .locals 3
    .param p1, "reportIntervalMs"    # I
    .param p2, "pullMode"    # Z
    .param p3, "response"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x0

    .line 592
    const-string/jumbo v1, "startLceService: not supported"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/SerranoRIL;->riljLog(Ljava/lang/String;)V

    .line 593
    if-eqz p3, :cond_0

    .line 594
    new-instance v0, Lcom/android/internal/telephony/CommandException;

    .line 595
    sget-object v1, Lcom/android/internal/telephony/CommandException$Error;->REQUEST_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    .line 594
    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CommandException;-><init>(Lcom/android/internal/telephony/CommandException$Error;)V

    .line 596
    .local v0, "ex":Lcom/android/internal/telephony/CommandException;
    invoke-static {p3, v2, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 597
    invoke-virtual {p3}, Landroid/os/Message;->sendToTarget()V

    .line 591
    .end local v0    # "ex":Lcom/android/internal/telephony/CommandException;
    :cond_0
    return-void
.end method
