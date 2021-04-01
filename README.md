# HQGenericSDK

[![CI Status](https://img.shields.io/travis/TomInWorker/HQGenericSDK.svg?style=flat)](https://travis-ci.org/TomInWorker/HQGenericSDK)
[![Version](https://img.shields.io/cocoapods/v/HQGenericSDK.svg?style=flat)](https://cocoapods.org/pods/HQGenericSDK)
[![License](https://img.shields.io/cocoapods/l/HQGenericSDK.svg?style=flat)](https://cocoapods.org/pods/HQGenericSDK)
[![Platform](https://img.shields.io/cocoapods/p/HQGenericSDK.svg?style=flat)](https://cocoapods.org/pods/HQGenericSDK)

## Example

#HQRouter路由调用.
#如: 触发url
#1. 
[HQRouter openURLRoute:@"hq://main/detail" withInfo:@{
        @"navigationVC":self.navigationController,
        @"pushVC":@"HQPushViewController",
        @"name":@"小明",
        @"number":@"1",
        @"callback":^(NSString * test){
        NSLog(@"/////test%@",test);
    }

    } completion:^(id  _Nonnull result) {
        NSLog(@"%@",result);
  }];
#2. 
[HQRouter openURLRoute:@"hq://main/select" withInfo:@{
        @"proid":@"2222"
   } completion:nil];
   
   
   
   
#如:注册

#+(void)load
{
    [HQRouter registerURLRoute:@"hq://main/detail" toHandler:^(NSDictionary * _Nonnull params) {
        [HQRouter pushViewControllerWithParams:params[@"info"]];
    }];
    [HQRouter registerURLRoute:@"hq://main/select" toHandler:^(NSDictionary * _Nonnull params) {
        NSLog(@"%@",params);
    }];
    
}


## Requirements

## Installation

HQGenericSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HQGenericSDK'
```


## License

HQGenericSDK is available under the MIT license. See the LICENSE file for more info.
