//
//  HQViewController.m
//  HQGenericSDK
//
//  Created by TomInWorker on 03/30/2021.
//  Copyright (c) 2021 TomInWorker. All rights reserved.
//

#import "HQViewController.h"
#import "HQTestObj.h"
#import "Masonry.h"
#import "MGJRouter.h"
#import "HQRouter.h"

@interface HQViewController ()

@end

@implementation HQViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
    
    HQTestObj * obj = [[HQTestObj alloc]init];
    [obj showTest];
    
//    UIImageView * imgView = []
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.backgroundColor = [UIColor blueColor];
    btn2.frame = CGRectMake(100, 300, 100, 100);
    [btn2 addTarget:self action:@selector(btn2Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}

-(void)btn2Action
{
    [HQRouter openURLRoute:@"hq://1/1" withInfo:@{
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
    
}

-(void)btnAction
{
    [HQRouter openURLRoute:@"hq://1/2" withInfo:@{
            @"aa":@"2222"
    } completion:^(id  _Nonnull result) {
        NSLog(@"%@",result);
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
