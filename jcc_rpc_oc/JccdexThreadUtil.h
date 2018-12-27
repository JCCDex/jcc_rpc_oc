//
//  JccdexThreadUtil.h
//  jcc_rpc_oc
//
//  Created by 沐生 on 2018/12/26.
//  Copyright © 2018 JCCDex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JccdexThreadUtil : NSObject

+ (void)runOnMainThread:(dispatch_block_t)block;

@end
