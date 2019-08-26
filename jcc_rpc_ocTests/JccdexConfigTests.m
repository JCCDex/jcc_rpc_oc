//
//  JccdexConfigTests.m
//  jcc_rpc_ocTests
//
//  Created by xumingyang on 2019/8/23.
//  Copyright © 2019 JCCDex. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JccdexConfig.h"

@interface JccdexConfigTests : XCTestCase
@property (strong, nonatomic) JccdexConfig *jccdexConfig;
@end

@implementation JccdexConfigTests

- (void)setUp {
    _jccdexConfig = [JccdexConfig shareInstance];
    [_jccdexConfig initConfigNodes:@[@"https://ewdjbbl8jgf.jccdex.cn"]];
}

- (void)tearDown {
}

- (void) testRequestConfig{
    XCTestExpectation *expectation = [self expectationWithDescription:@"request config successfully"];
    [_jccdexConfig requestConfig:^(NSDictionary *response) {
        [expectation fulfill];
    } onFail: nil];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

@end
