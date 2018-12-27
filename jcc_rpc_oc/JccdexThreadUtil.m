//
//  JccdexThreadUtil.m
//  jcc_rpc_oc
//
//  Created by 沐生 on 2018/12/26.
//  Copyright © 2018 JCCDex. All rights reserved.
//

#import "JccdexThreadUtil.h"

@implementation JccdexThreadUtil

+ (void)runOnMainThread:(dispatch_block_t)block {
    if (block) {
        if ([[NSThread currentThread] isMainThread]) {
            block();
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                block();
            });
        }
    }
}
    
@end
