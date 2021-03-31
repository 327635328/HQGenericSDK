//
//  HQProTabBarController.m
//  HQGenericSDK_Example
//
//  Created by admin on 2021/3/30.
//  Copyright © 2021 TomInWorker. All rights reserved.
//

#import "HQProTabBarController.h"

@interface HQProTabBarController ()

@end

@implementation HQProTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    HQTabBarModel * modelMain = [[HQTabBarModel alloc]init];
    modelMain.controllerClass = @"HQViewController";
    modelMain.title = @"首页";
    modelMain.image_none_selected = @"tabBar_home";
    modelMain.image_selected = @"tabBar_sel_home";
    modelMain.title_elected_color = [UIColor purpleColor];
    
    HQTabBarModel * modelSecond = [[HQTabBarModel alloc]init];
    modelSecond.controllerClass = @"HQTempViewController";
    modelSecond.title = @"选货";
    modelSecond.image_none_selected = @"tabBar_chose";
    modelSecond.image_selected = @"tabBar_sel_chose";
    modelSecond.title_elected_color = [UIColor purpleColor];
    
    
    HQTabBarModel * modelThird = [[HQTabBarModel alloc]init];
    modelThird.controllerClass = @"HQTempViewController";
    modelThird.title = @"发现";
    modelThird.image_none_selected = @"tabBar_new";
    modelThird.image_selected = @"tabBar_sel_new";
    modelThird.title_elected_color = [UIColor purpleColor];
    
    
    HQTabBarModel * modelFourth = [[HQTabBarModel alloc]init];
    modelFourth.controllerClass = @"HQDemoViewController";
    modelFourth.title = @"购物车";
    modelFourth.image_none_selected = @"tabBar_shopCart";
    modelFourth.image_selected = @"tabBar_sel_shopCart";
    modelFourth.title_elected_color = [UIColor purpleColor];
    
    
    HQTabBarModel * modelFive = [[HQTabBarModel alloc]init];
    modelFive.controllerClass = @"HQDemoViewController";
    modelFive.title = @"我的";
    modelFive.image_none_selected = @"tabBar_mine";
    modelFive.image_selected = @"tabBar_sel_mine";
    modelFive.title_elected_color = [UIColor purpleColor];
    
    
    self.arr_tabBarModel = @[modelMain,modelSecond,modelThird,modelFourth,modelFive];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
