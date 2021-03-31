//
//  HQRouter.m
//  HQGenericSDK_Example
//
//  Created by admin on 2021/3/31.
//  Copyright © 2021 TomInWorker. All rights reserved.
//

#import "HQRouter.h"
#import <objc/runtime.h>
NSString *const HQRouterUrl = @"url";
NSString *const HQRouterInfo = @"info";

@interface HQRouter ()
/**
 *  保存了所有已注册的 URL
 *  结构类似 @{@"beauty": @{@":id": {@"-", [block copy]}}}
 */
@property (nonatomic) NSMutableDictionary *routes;

@end


@implementation HQRouter

-(NSMutableDictionary *)routes
{
    if (!_routes) {
        _routes = [[NSMutableDictionary alloc]init];
    }
    return _routes;
}

+ (instancetype)sharedInstance
{
    static HQRouter * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}


+(void)registerURLRoute:(NSString *)url toHandler:(HQRouterHandler)handler
{
    [[self sharedInstance] registerURLPattern:url andHandler:handler];
}

//注册
- (void)registerURLPattern:(NSString *)URLPattern andHandler:(HQRouterHandler)handler
{
    //字符串分割 如abc://main 分割成abc和main
    NSArray *pathComponents = [self pathComponentsFromURL:URLPattern];
    
    NSMutableDictionary* subRoutes = self.routes;
    for (NSString * pathComponent in pathComponents) {
        if (![subRoutes objectForKey:pathComponent]) {
            subRoutes[pathComponent] = [[NSMutableDictionary alloc] init];
            
        }
        subRoutes = subRoutes[pathComponent];
        
    }
    if (handler && subRoutes) {
        subRoutes[@"-"] = [handler copy];
        
    }
    
    //注册完大概长这样
    /*self.routes
     {
         hq =     {
             main =         {
                 subXXX =             {
                     "-" = "<__NSGlobalBlock__: 0x102e0c160>";
                 };
             };
             mine =         {
                 subXXX =             {
                     "-" = "<__NSGlobalBlock__: 0x102e0c111>";
                 };
             };
         };
     }
     */
    
    
    
   
}

//触发时间
+(void)openURLRoute:(NSString *)url withInfo:(NSDictionary *)info completion:(void (^)(id _Nonnull))completion
{
    NSMutableDictionary * parameters = [[self sharedInstance] checkParametersFromURL:url];
    if (parameters) {
        HQRouterHandler handler = parameters[@"handler"];
        if (info) {
            parameters[HQRouterInfo] = info;
        }
        if (handler) {
            [parameters removeObjectForKey:@"handler"];
            //self.routes取出对应的block,执行block
            handler(parameters);
        }
    }
    //触发结束执行completion,便于调用者继续执行内部事件,可以传nil
    if (completion) {
        completion(parameters[HQRouterInfo]);
    }
    
}

-(NSMutableDictionary *)checkParametersFromURL:(NSString*)url
{
    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
    parameters[HQRouterUrl] = url;
    
    NSArray* pathComponents = [self pathComponentsFromURL:url];
    
    NSMutableDictionary* subRoutes = self.routes;
    
    for (NSString* pathComponent in pathComponents) {
        if ([subRoutes objectForKey:pathComponent]) {
            subRoutes = subRoutes[pathComponent];
            
        }
        
    }
    
    if (!subRoutes[@"-"]) {
        return nil;
    }else{
        parameters[@"handler"] = [subRoutes[@"-"] copy];
    }
    
//    NSLog(@"%@",parameters);
    
    return  parameters;
}



//字符串截取
- (NSArray*)pathComponentsFromURL:(NSString*)URL
{

    NSMutableArray *pathComponents = [NSMutableArray array];
    if ([URL rangeOfString:@"://"].location != NSNotFound) {
        NSArray *pathSegments = [URL componentsSeparatedByString:@"://"];
        // 如果 URL 包含协议，那么把协议作为第一个元素放进去
        [pathComponents addObject:pathSegments[0]];
        
        // 如果只有协议，那么放一个占位符
        URL = pathSegments.lastObject;
//        if (!URL.length) {
//            [pathComponents addObject:MGJ_ROUTER_WILDCARD_CHARACTER];
//        }
    }

    for (NSString *pathComponent in [[NSURL URLWithString:URL] pathComponents]) {
        if ([pathComponent isEqualToString:@"/"]) continue;
        if ([[pathComponent substringToIndex:1] isEqualToString:@"?"]) break;
        [pathComponents addObject:pathComponent];
    }
    return [pathComponents copy];
}


+(void)pushViewControllerWithParams:(NSDictionary*)dict
{
    UINavigationController *navigationVC = dict[@"navigationVC"];
//    NSDictionary * dict = params[@"info"];
    
    NSString * vcStr = dict[@"pushVC"];
    
    id vc = [NSClassFromString(vcStr) new];
    
    unsigned int count = 0;
    objc_property_t * properties = class_copyPropertyList([vc class], &count);
    for (int i = 0; i<count; i++) {
        objc_property_t pro = properties[i];
        NSString * key = [NSString stringWithUTF8String:property_getName(pro)];
        NSString * value = dict[key];
        if (value) {
            [vc setValue:value forKey:key];
        }
    }
    free(properties);
    [navigationVC pushViewController:vc animated:YES];
}

@end
