# jcc_rpc_oc

An objective-c restful api for interacting with the jingchang server.

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

## Installation with CocoaPods

To integrate jcc_rpc_oc into your Xcode project using CocoaPods, specify it in your Podfile, then run `pod install`.

```ruby
pod 'jcc_rpc_oc'
```

## Import

```objective-c
#import <jcc_rpc_oc/JccdexExchange.h>
#import <jcc_rpc_oc/JccdexMacro.h>
```

## API of JCCDex Exchange

### initExchangeNodes

```objective-c
// init exchange nodes firstly
_jccdexExchange = [JccdexExchange shareInstance];
NSArray *nodes;
[_jccdexExchange initExchangeNodes:nodes];
```

### requestBalance

```objective-c
NSString *address = @"";
[[JccdexExchange shareInstance] requestBalance:address onResponse:^(NSDictionary *response) {
    NSString *code = [response objectForKey:@"code"];
    if ([code isEqualToString:REQUEST_JC_SUCCESS_CODE]) {
    } else {
    }
} onFail:^(NSError *error) {
}];
```

### createOrder

```objective-c
NSString *signature = @"";
[[JccdexExchange shareInstance] createOrder:signature onResponse:^(NSDictionary *response) {
    NSString *code = [response objectForKey:@"code"];
    if ([code isEqualToString:REQUEST_JC_SUCCESS_CODE]) {
    } else {
    }
} onFail:^(NSError *error) {
}];
```

### requestSequence

```objective-c
NSString *address = @"";
[[JccdexExchange shareInstance] requestSequence:address onResponse:^(NSInteger sequence) {
    if (sequence == JC_INVALID_SEQUENCE) {
        // invalid sequence
    } else {
        // valid sequence
    }
} onFail:^(NSError *error) {
}];
```

### cancelOrder

```objective-c
NSString *signature = @"";
[[JccdexExchange shareInstance] cancelOrder:signature onResponse:^(NSDictionary *response) {
    NSString *code = [response objectForKey:@"code"];
    if ([code isEqualToString:REQUEST_JC_SUCCESS_CODE]) {
    } else {
    }
} onFail:^(NSError *error) {
}];
```

### transferToken

```objective-c
NSString *signature = @"";
[[JccdexExchange shareInstance] transferToken:signature onResponse:^(NSDictionary *response) {
    NSString *code = [response objectForKey:@"code"];
    if ([code isEqualToString:REQUEST_JC_SUCCESS_CODE]) {
    } else {
    }
} onFail:^(NSError *error) {
}];
```

### requestOrders

```objective-c
NSString *address = @"";
NSInteger page = 0;
[[JccdexExchange shareInstance] requestOrders:address page:page onResponse:^(NSDictionary *response) {
    NSString *code = [response objectForKey:@"code"];
    if ([code isEqualToString:REQUEST_JC_SUCCESS_CODE]) {
    } else {
    }
} onFail:^(NSError *error) {
}];
```

### requestHistoricTransactions

```objective-c
// request without ledger or seq
NSString *address = @"";
[[JccdexExchange shareInstance] requestHistoricTransactions:address onResponse:^(NSDictionary *response) {
    NSString *code = [response objectForKey:@"code"];
    if ([code isEqualToString:REQUEST_JC_SUCCESS_CODE]) {
    } else {
    }
} onFail:^(NSError *error) {
}];
```

```objective-c
// request with ledger and seq
NSString *address = @"";
NSInteger ledger = 0;
NSInteger seq = 0;
[[JccdexExchange shareInstance] requestHistoricTransactions:address ledger:ledger seq:seq onResponse:^(NSDictionary *response) {
    NSString *code = [response objectForKey:@"code"];
    if ([code isEqualToString:REQUEST_JC_SUCCESS_CODE]) {
    } else {
    }
} onFail:^(NSError *error) {
}];
```
