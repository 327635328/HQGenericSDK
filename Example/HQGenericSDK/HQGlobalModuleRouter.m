//
//  HQGlobalModuleRouter.m
//  HQGenericSDK_Example
//
//  Created by admin on 2021/3/31.
//  Copyright © 2021 TomInWorker. All rights reserved.
//

#import "HQGlobalModuleRouter.h"
#import "HQRouter.h"
#import "HQPushViewController.h"

@implementation HQGlobalModuleRouter



+(void)load
{
    
    [HQRouter registerURLRoute:@"hq://1/1" toHandler:^(NSDictionary * _Nonnull params) {
        
        [HQRouter pushViewControllerWithParams:params[@"info"]];
        
    }];
    
    [HQRouter registerURLRoute:@"hq://1/2" toHandler:^(NSDictionary * _Nonnull params) {
        NSLog(@"%@",params);
    }];
    
    
}






@end
