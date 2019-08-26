//
//  JccdexInfoTests.m
//  jcc_rpc_ocTests
//
//  Created by xumingyang on 2019/8/21.
//  Copyright © 2019 JCCDex. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JccdexInfo.h"

@interface JccdexInfoTests : XCTestCase
@property (strong, nonatomic) JccdexInfo *jccdexInfo;

@end

@implementation JccdexInfoTests

- (void)setUp {
    _jccdexInfo = [JccdexInfo shareInstance];
    [_jccdexInfo initInfoNodes:@[@"https://ewdjbbl8jgf.jccdex.cn"]];
}

- (void)tearDown {
}

- (void)testRequestTicker {
    XCTestExpectation *expectation = [self expectationWithDescription:@"request ticker successfully"];
    [_jccdexInfo requestTicker:@"swt" counter:@"cnt" onResponse:^(NSDictionary *response) {
        [expectation fulfill];
    } onFail: nil];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testRequestAllTickers {
    XCTestExpectation *expectation = [self expectationWithDescription:@"request allTicker successfully"];
    [_jccdexInfo requestAllTickersOnResponse:^(NSDictionary *response) {
        [expectation fulfill];
    } onFail: nil];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testRequestDepth {
    XCTestExpectation *expectation = [self expectationWithDescription:@"request depth successfully"];
    [_jccdexInfo requestDepth:@"swt" counter:@"cnt" type:@"nomal" onResponse:^(NSDictionary *response) {
        [expectation fulfill];
    } onFail: nil];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void) testRequestKline {
    XCTestExpectation *expectation = [self expectationWithDescription:@"request kline successfully"];
    [_jccdexInfo requestKline:@"swt" counter:@"cnt" type:@"hour" onResponse:^(NSDictionary *response) {
        [expectation fulfill];
    } onFail: nil];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void) testRequestHistoryNoTime {
    XCTestExpectation *expectation = [self expectationWithDescription:@"request history successfully"];
    [_jccdexInfo requestHistory:@"swt" counter:@"cnt" type:@"newest" onResponse:^(NSDictionary *response) {
        [expectation fulfill];
    } onFail: nil];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void) testRequestHistory {
    XCTestExpectation *expectation = [self expectationWithDescription:@"request history successfully"];
    NSString *time = [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
    [_jccdexInfo requestHistory:@"swt" counter:@"cnt" type:@"newest" time:time onResponse:^(NSDictionary *response) {
        [expectation fulfill];
    } onFail: nil];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void) testRequestTickerFromCMC {
    XCTestExpectation *expectation = [self expectationWithDescription:@"request tickerFromCMC successfully"];
    [_jccdexInfo requestTickerFromCMC:@"eth" currency:@"cny" onResponse:^(NSDictionary *response) {
        [expectation fulfill];
    } onFail: nil];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

@end
