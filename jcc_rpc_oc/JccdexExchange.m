//
//  JccdexExchange.m
//  jcc_rpc_oc
//
//  Created by 沐生 on 2018/12/26.
//  Copyright © 2018 JCCDex. All rights reserved.
//

#include <stdlib.h>
#import "JccdexExchange.h"
#import "JccdexThreadUtil.h"
#import "JccdexMacro.h"

@interface JccdexExchange() {
    NSURLSession *_sharedSession;
}
@property (strong, nonatomic) NSArray *jccdexExchangeNodes;
@end

@implementation JccdexExchange

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static JccdexExchange *inst;
    dispatch_once(&onceToken, ^{
        inst = [[JccdexExchange alloc] init];
    });
    return inst;
};

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _sharedSession = [NSURLSession sharedSession];
    }
    return self;
}

- (void) initExchangeNodes:(NSArray *)nodes {
    _jccdexExchangeNodes = nodes;
}

- (NSString *) getNode {
    if (_jccdexExchangeNodes == nil) {
        return @"";
    }
    NSInteger value = arc4random_uniform((int) [_jccdexExchangeNodes count]);
    return _jccdexExchangeNodes[value];
}

- (void)requestBalance:(NSString *)address success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure {
    NSString *node = [self getNode];
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",node, [NSString stringWithFormat:JC_REQUEST_BALANCE_ROUTE,address]];
    NSURL *url = [NSURL URLWithString: requestUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *dataTask = [_sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            if (success) {
                [JccdexThreadUtil runOnMainThread:^{
                    success(dict);
                }];
            }
        } else {
            if (failure) {
                [JccdexThreadUtil runOnMainThread:^{
                    failure(error);
                }];
            }
        }
    }];
    [dataTask resume];
}

- (void)createOrder:(NSString *)signature success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure {
    NSString *node = [self getNode];
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@", node, JC_CREATE_ORDER_ROUTE];
    NSURL *url = [NSURL URLWithString: requestUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [[NSString stringWithFormat:@"sign=%@", signature] dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask = [_sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            if (success) {
                [JccdexThreadUtil runOnMainThread:^{
                    success(dict);
                }];
            }
        } else {
            if (failure) {
                [JccdexThreadUtil runOnMainThread:^{
                    failure(error);
                }];
            }
        }
    }];
    [dataTask resume];
}

@end
