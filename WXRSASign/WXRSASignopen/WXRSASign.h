//
//  HBRSAHandler.h
//  iOSRSAHandlerDemo
//
//  Created by 吴兴 on 2016/12/17.
//  Copyright © 2016年 ChanPay. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    KeyTypePublic = 0,
    KeyTypePrivate
}KeyType;

@interface WXRSASign : NSObject

- (BOOL)importKeyWithType:(KeyType)type andPath:(NSString*)path;
- (BOOL)importKeyWithType:(KeyType)type andkeyString:(NSString *)keyString;

    //验证签名 Sha1 + RSA
- (BOOL)verifyString:(NSString *)string withSign:(NSString *)signString;
    //验证签名 md5 + RSA
- (BOOL)verifyMD5String:(NSString *)string withSign:(NSString *)signString;

- (NSString *)signString:(NSString *)string;

- (NSString *)signMD5String:(NSString *)string;


- (NSString *) encryptWithPublicKey:(NSString*)content;
- (NSString *) decryptWithPrivatecKey:(NSString*)content;

@end
