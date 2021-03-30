//
//  HQTabBarController.h
//  HQGenericSDK_Example
//
//  Created by admin on 2021/3/30.
//  Copyright © 2021 TomInWorker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HQTabBarModel : NSObject

@property (nonatomic,copy) NSString * controllerClass;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * image_none_selected;
@property (nonatomic,copy) NSString * image_selected;


@end




@interface HQTabBarController : UITabBarController

@property (nonatomic,retain) NSArray<HQTabBarModel *> * arr_tabBarModel;
@property (nonatomic,retain) UIColor * titleSelColor;

/**
 *设置哪个item上的徽标
 *@param badgeValue : 0时显示红点，非0时显示全部，否则隐藏
 */
- (void)setBadgeValue:(NSInteger)badgeValue atItemIndex:(int)index;

@end

NS_ASSUME_NONNULL_END
