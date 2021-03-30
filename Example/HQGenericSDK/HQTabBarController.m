//
//  HQTabBarController.m
//  HQGenericSDK_Example
//
//  Created by admin on 2021/3/30.
//  Copyright © 2021 TomInWorker. All rights reserved.
//

#import "HQTabBarController.h"

@implementation HQTabBarModel


@end

@interface HQTabBarController ()

@end

@implementation HQTabBarController

-(void)setArr_tabBarModel:(NSArray<HQTabBarModel *> *)arr_tabBarModel
{
    _arr_tabBarModel = arr_tabBarModel;
    
}

-(void)setTitleSelColor:(UIColor *)titleSelColor
{
    _titleSelColor = titleSelColor;
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.tabBar.tintColor = kThemeColor;
    
    NSArray *configureArray = @[
                            @{
                                @"class":@"SJDiscoverViewController",
                                @"title":@"首页",
                                @"image_none_selected":@"tabBar_home",
                                @"image_selected":@"tabBar_sel_home"
                              },
                            
                            @{
                                @"class":@"SJMeViewController",
                                @"title":@"选货",
                                @"image_none_selected":@"tabBar_chose",
                                @"image_selected":@"tabBar_sel_chose"
                                },
                            @{
                                @"class":@"SJMeViewController",
                                @"title":@"发现",
                                @"image_none_selected":@"tabBar_new",
                                @"image_selected":@"tabBar_sel_new"
                                },
                            @{
                                @"class":@"SJMeViewController",
                                @"title":@"购物车",
                                @"image_none_selected":@"tabBar_shopCart",
                                @"image_selected":@"tabBar_sel_shopCart"
                                },
                            @{
                                @"class":@"SJMeViewController",
                                @"title":@"我的",
                                @"image_none_selected":@"tabBar_mine",
                                @"image_selected":@"tabBar_sel_mine"
                                },
                            ];
    
    [configureArray enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController * vc = [[UIViewController alloc]init];
//        UIViewController *vc = [NSClassFromString(dict[@"class"]) new];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[@"title"];
        item.image = [UIImage imageNamed:dict[@"image_none_selected"]];
        item.selectedImage = [[UIImage imageNamed:dict[@"image_selected"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateSelected];
        [self addChildViewController:nav];

    }];
    self.selectedIndex = 0;
}


-(void)setBadgeValue:(NSInteger)badgeValue atItemIndex:(int)index
{
    if (badgeValue < 0) {
        badgeValue = 0;
    }
    NSString * showStr = [NSString stringWithFormat:@"%ld",badgeValue];
    
    
    if (badgeValue > 99) {
        showStr = @"99+";
    }
    
    self.tabBar.items[index].badgeValue = showStr;
}


@end
