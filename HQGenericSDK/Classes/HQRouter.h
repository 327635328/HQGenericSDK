//
//  HQRouter.h
//  HQGenericSDK_Example
//
//  Created by admin on 2021/3/31.
//  Copyright © 2021 TomInWorker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef void(^HQRouterHandler) (NSDictionary * params);

@interface HQRouter : NSObject



+ (void)registerURLRoute:(NSString*)url toHandler:(HQRouterHandler)handler;

+ (void)openURLRoute:(NSString *)url withInfo:(nullable NSDictionary *)info completion:(void (^ __nullable)(id result))completion;


+(void)pushViewControllerWithParams:(NSDictionary*)dict;



@end

NS_ASSUME_NONNULL_END
