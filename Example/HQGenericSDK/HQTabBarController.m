//
//  HQTabBarController.m
//  HQGenericSDK_Example
//
//  Created by admin on 2021/3/30.
//  Copyright © 2021 TomInWorker. All rights reserved.
//

#import "HQTabBarController.h"
#import "HQNavigationController.h"
@implementation HQTabBarModel


@end

@interface HQTabBarController ()



@end

@implementation HQTabBarController


-(void)setTitleSelColor:(UIColor *)titleSelColor
{
    NSLog(@"%s",__FUNCTION__);
    _titleSelColor = titleSelColor;
    
}

-(void)setArr_tabBarModel:(NSArray<HQTabBarModel *> *)arr_tabBarModel
{
    NSLog(@"%s",__FUNCTION__);
    _arr_tabBarModel = arr_tabBarModel;
    
    [self setupChildViewController];
    
}

-(instancetype)initWithTabBarArray:(NSArray<HQTabBarModel *> *)arr_tabBarModel
{
    NSLog(@"%s",__FUNCTION__);
    _arr_tabBarModel = arr_tabBarModel;
    self = [super init];
    if (self) {

        [self setupChildViewController];
    }
    return self;
}


-(void)setupChildViewController
{
    [_arr_tabBarModel enumerateObjectsUsingBlock:^(HQTabBarModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *vc = [NSClassFromString(obj.controllerClass) new];
        HQNavigationController *nav = [[HQNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = obj.title;
        item.image = [UIImage imageNamed:obj.image_none_selected];
        item.selectedImage = [[UIImage imageNamed:obj.image_selected] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : obj.title_elected_color} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
    
    
    self.selectedIndex = 0;
}


-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%s",__FUNCTION__);
    [super viewWillAppear:animated];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__FUNCTION__);
    
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    item.badgeValue = nil;
}


-(void)setBadgeValue:(NSInteger)badgeValue atItemIndex:(int)index
{
    if (badgeValue < 0) {
        badgeValue = 0;
    }
    NSString * showStr = [NSString stringWithFormat:@"%zd",badgeValue];
    
    
    if (badgeValue > 99) {
        showStr = @"99+";
    }
    
    self.tabBar.items[index].badgeValue = showStr;
}


@end
