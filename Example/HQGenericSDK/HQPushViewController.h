//
//  HQPushViewController.h
//  HQGenericSDK_Example
//
//  Created by admin on 2021/3/30.
//  Copyright © 2021 TomInWorker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef  void(^btnClickBlock)(NSString *);

@interface HQPushViewController : UIViewController

@property (nonatomic,retain) NSString * name;
@property (nonatomic,assign) int number;
@property (nonatomic, copy)btnClickBlock callback;



@end

NS_ASSUME_NONNULL_END
