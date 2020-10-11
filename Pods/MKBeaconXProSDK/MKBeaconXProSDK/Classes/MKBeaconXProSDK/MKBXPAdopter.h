//
//  MKBXPAdopter.h
//  tempasdfjasd
//
//  Created by aa on 2020/9/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MKBXPAdopter : NSObject

+ (BOOL)isPassword:(NSString *)password;
+ (BOOL)checkDeviceName:(NSString *)deviceName;
+ (BOOL)isNameSpace:(NSString *)nameSpace;
+ (BOOL)isInstanceID:(NSString *)instanceID;
+ (BOOL)checkUrlContent:(NSString *)urlContent;

+ (NSString *)getUrlscheme:(char)hexChar;
+ (NSString *)getEncodedString:(char)hexChar;
+ (NSData*)AES128EncryptWithSourceData:(NSData *)sourceData keyData:(NSData *)keyData;
+ (NSData *)fetchKeyToUnlockWithPassword:(NSString *)password randKey:(NSData *)randKey;
+ (NSString *)fetchUrlStringWithHeader:(NSString *)urlHeader urlContent:(NSString *)urlContent;
+ (NSString *)fetchTxPowerWithContent:(NSString *)content;
+ (NSNumber *)fetchRSSIWithContent:(NSData *)contentData;
+ (NSString *)deviceTime:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
