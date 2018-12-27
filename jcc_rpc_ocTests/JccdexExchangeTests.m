//
//  JccdexExchangeTests.m
//  jcc_rpc_ocTests
//
//  Created by 沐生 on 2018/12/27.
//  Copyright © 2018 JCCDex. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JccdexExchange.h"

@interface JccdexExchangeTests : XCTestCase
@property (strong, nonatomic) JccdexExchange *jccdexExchange;
@property (strong, nonatomic) NSString *testAddress;

@end

@implementation JccdexExchangeTests

- (void)setUp {
    _jccdexExchange = [JccdexExchange shareInstance];
    [_jccdexExchange initExchangeNodes:@[@"https://ewdjbbl8jgf.jccdex.cn"]];
    _testAddress = @"jJDPjcoQisjvLcqWCYY23xe6mbKV6P7E19";
}

- (void)tearDown {
}

- (void)testRequestBalance {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"request balance successfully"];
    __block BOOL successBlockExecuted = NO;
    [_jccdexExchange requestBalance:_testAddress success:^(NSDictionary *response) {
        NSLog(@"%@", response);
        successBlockExecuted = YES;
        [expectation fulfill];
    } failure:^(NSError *error) {
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
    XCTAssertTrue(successBlockExecuted);
}

//- (void)testCreateOrder {
//    XCTestExpectation *expectation = [self expectationWithDescription:@"create order successfully"];
//    __block BOOL successBlockExecuted = NO;
//    [_jccdexExchange createOrder:@"aaa" success:^(NSDictionary *response) {
//        NSLog(@"%@", response);
//        successBlockExecuted = YES;
//        [expectation fulfill];
//    } failure:nil];
//    [self waitForExpectationsWithTimeout:10.0 handler:nil];
//    XCTAssertTrue(successBlockExecuted);
//}

@end
