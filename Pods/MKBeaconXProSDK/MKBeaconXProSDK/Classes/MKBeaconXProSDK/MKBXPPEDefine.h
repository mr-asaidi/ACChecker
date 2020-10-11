

static NSString *const MKBXPReceiveThreeAxisAccelerometerDataNotification = @"MKBXPReceiveThreeAxisAccelerometerDataNotification";
static NSString *const MKBXPReceiveHTDataNotification = @"MKBXPReceiveHTDataNotification";
static NSString *const MKBXPReceiveRecordHTDataNotification = @"MKBXPReceiveRecordHTDataNotification";

typedef NS_ENUM(NSInteger, MKBXPConnectStatus) {
    MKBXPConnectStatusUnknow,
    MKBXPConnectStatusConnecting,
    MKBXPConnectStatusConnected,
    MKBXPConnectStatusConnectedFailed,
    MKBXPConnectStatusDisconnect,
};

typedef NS_ENUM(NSInteger, MKBXPCentralManagerState) {
    MKBXPCentralManagerStateUnable,
    MKBXPCentralManagerStateEnable,
};

typedef NS_ENUM(NSInteger, MKBXPLockState) {
    MKBXPLockStateUnknow,
    MKBXPLockStateLock,
    MKBXPLockStateOpen,
    MKBXPLockStateUnlockAutoMaticRelockDisabled,
};

/**
 Target SLOT numbers(enum)，slot0~slot4
 */
typedef NS_ENUM(NSInteger, bxpActiveSlotNo) {
    bxpActiveSlot1,//SLOT 0
    bxpActiveSlot2,//SLOT 1
    bxpActiveSlot3,//SLOT 2
    bxpActiveSlot4,//SLOT 3
    bxpActiveSlot5,//SLOT 4
    bxpActiveSlot6,//SLOT 5
};
typedef NS_ENUM(NSInteger, slotRadioTxPower) {
    slotRadioTxPower4dBm,       //RadioTxPower:4dBm
    slotRadioTxPower3dBm,       //3dBm
    slotRadioTxPower0dBm,       //0dBm
    slotRadioTxPowerNeg4dBm,    //-4dBm
    slotRadioTxPowerNeg8dBm,    //-8dBm
    slotRadioTxPowerNeg12dBm,   //-12dBm
    slotRadioTxPowerNeg16dBm,   //-16dBm
    slotRadioTxPowerNeg20dBm,   //-20dBm
    slotRadioTxPowerNeg40dBm,   //-40dBm
};
typedef NS_ENUM(NSInteger, urlHeaderType) {
    urlHeaderType1,             //http://www.
    urlHeaderType2,             //https://www.
    urlHeaderType3,             //http://
    urlHeaderType4,             //https://
};

typedef NS_ENUM(NSInteger, threeAxisDataRate) {
    threeAxisDataRate1hz,           //1hz
    threeAxisDataRate10hz,          //10hz
    threeAxisDataRate25hz,          //25hz
    threeAxisDataRate50hz,          //50hz
    threeAxisDataRate100hz          //100hz
};

typedef NS_ENUM(NSInteger, threeAxisDataAG) {
    threeAxisDataAG0,               //±2g
    threeAxisDataAG1,               //±4g
    threeAxisDataAG2,               //±8g
    threeAxisDataAG3                //±16g
};

typedef NS_ENUM(NSInteger, HTStorageConditions) {
    HTStorageConditionsT,               // Store data when temperature changes
    HTStorageConditionsH,               // Store data when humidity changes
    HTStorageConditionsTH,              // Store data when temperature or humidity changes
    HTStorageConditionsTime,            // Store data when time changes
};


@protocol MKBXPDeviceTimeProtocol <NSObject>

@property (nonatomic, assign)NSInteger year;

@property (nonatomic, assign)NSInteger month;

@property (nonatomic, assign)NSInteger day;

@property (nonatomic, assign)NSInteger hour;

@property (nonatomic, assign)NSInteger minutes;

@property (nonatomic, assign)NSInteger seconds;

@end

@protocol MKBXPHTStorageConditionsProtocol <NSObject>

@property (nonatomic, assign)HTStorageConditions condition;

/**
 HTStorageConditions != HTStorageConditionsTime,0~1000，Represent 0 ° C ~ 100 ° C
 */
@property (nonatomic, assign)NSInteger temperature;

/**
 HTStorageConditions != HTStorageConditionsTime,0~1000, Represent 0%~100%
 */
@property (nonatomic, assign)NSInteger humidity;

/**

 HTStorageConditions == HTStorageConditionsTime, In case, the range value is 1~255
 */
@property (nonatomic, assign)NSInteger time;

@end

@class MKBXPBaseBeacon;

@protocol MKBXPScanDelegate <NSObject>

- (void)bxp_didReceiveBeacon:(NSArray <MKBXPBaseBeacon *>*)beaconList;

@optional
- (void)bxp_centralManagerStartScan;
- (void)bxp_centralManagerStopScan;

@end

@protocol MKBXPCentralManagerDelegate <NSObject>

- (void)bxp_centralStateChanged:(MKBXPCentralManagerState)managerState;

- (void)bxp_peripheralConnectStateChanged:(MKBXPConnectStatus)connectState;

- (void)bxp_LockStateChanged:(MKBXPLockState)lockState;

@end
