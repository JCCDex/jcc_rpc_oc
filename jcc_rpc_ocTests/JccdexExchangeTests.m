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
    [_jccdexExchange requestBalance:_testAddress onResponse:^(NSDictionary *response) {
        NSLog(@"%@", response);
        successBlockExecuted = YES;
        [expectation fulfill];
    } onFail: nil];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
    XCTAssertTrue(successBlockExecuted);
}

- (void)testRequestSequence {
    XCTestExpectation *expectation = [self expectationWithDescription:@"request sequence successfully"];
    [_jccdexExchange requestSequence:@"jwnqKpXJYJPeAnUdVUv3LfbxiJh5ZVXh79" onResponse:^(NSInteger sequence) {
        [expectation fulfill];
    } onFail:^(NSError *error) {
        
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testCancelOrder {
    XCTestExpectation *expectation = [self expectationWithDescription:@"cancel order successfully"];
    [_jccdexExchange cancelOrder:@"aaa" onResponse:^(NSDictionary *response) {
        [expectation fulfill];
    } onFail:^(NSError *error) {
        
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testTransferToken {
    XCTestExpectation *expectation = [self expectationWithDescription:@"transfer token successfully"];
    [_jccdexExchange transferToken:@"aaa" onResponse:^(NSDictionary *response) {
        [expectation fulfill];
    } onFail: nil];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testRequestOrders {
    XCTestExpectation *expectation = [self expectationWithDescription:@"request orders successfully"];
    [_jccdexExchange requestOrders:@"jLUkoiBvewNDvrJMR7q96s67WgoGjmttPr" page:0 onResponse:^(NSDictionary *response) {
        [expectation fulfill];
    } onFail:^(NSError *error) {
        
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testRequestHistoricTransactions {
    XCTestExpectation *expectation = [self expectationWithDescription:@"request history successfully"];
    [_jccdexExchange requestHistoricTransactions:@"jLUkoiBvewNDvrJMR7q96s67WgoGjmttPr" ledger:11611188 seq:0 onResponse:^(NSDictionary *response) {
        [expectation fulfill];
    } onFail:^(NSError *error) {
        
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

@end
