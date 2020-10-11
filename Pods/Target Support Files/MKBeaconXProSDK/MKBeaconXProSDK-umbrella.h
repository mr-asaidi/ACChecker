#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MKBXPSDKHeader.h"
#import "MKBLEBaseCentralManager.h"
#import "MKBLEBaseDataProtocol.h"
#import "MKBLEBaseSDK.h"
#import "MKBLEBaseSDKAdopter.h"
#import "MKBLEBaseSDKDefines.h"
#import "CBPeripheral+MKAdd.h"
#import "MKBXPAdopter.h"
#import "MKBXPBaseBeacon.h"
#import "MKBXPCentralManager.h"
#import "MKBXPDataParser.h"
#import "MKBXPInterface+MKConfig.h"
#import "MKBXPInterface.h"
#import "MKBXPOperationIDDefines.h"
#import "MKBXPPEDefine.h"
#import "MKBXPPeripheral.h"
#import "MKBXPService.h"
#import "MKBXPTaskOperation.h"

FOUNDATION_EXPORT double MKBeaconXProSDKVersionNumber;
FOUNDATION_EXPORT const unsigned char MKBeaconXProSDKVersionString[];

