//
//  GYBase64.h
//  DripCarBuy
//
//  Created by shuidi_iMac on 2018/12/12.
//  Copyright © 2018 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

void *MMBase64Decode(
                     const char *inputBuffer,
                     size_t length,
                     size_t *outputLength);

char *MMBase64Encode(
                     const void *inputBuffer,
                     size_t length,
                     bool separateLines,
                     size_t *outputLength);

@interface GYBase64 : NSObject

+ (NSData *)decodeFromData:(NSData*) data;
+ (NSData *)decodeFromString:(NSString *)aString;

+ (NSString *)encodeWithString:(NSString*) aString;
+ (NSString *)encodeWithData:(NSData*) data;
// added by Hiroshi Hashiguchi
+ (NSString *)encodeWithSeparateLines:(NSData*) data lines:(BOOL)separateLines;

@end

NS_ASSUME_NONNULL_END
