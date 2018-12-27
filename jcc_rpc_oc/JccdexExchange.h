//
//  JccdexExchange.h
//  jcc_rpc_oc
//
//  Created by 沐生 on 2018/12/26.
//  Copyright © 2018 JCCDex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JccdexExchange : NSObject

+ (instancetype)shareInstance;

- (void)initExchangeNodes:(NSArray *)nodes;
    
- (void)requestBalance:(NSString *)address success:(void (^)(NSDictionary *response))success failure:(void(^)(NSError *error))failure;

@end
