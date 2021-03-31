//
//  HQPushViewController.m
//  HQGenericSDK_Example
//
//  Created by admin on 2021/3/30.
//  Copyright © 2021 TomInWorker. All rights reserved.
//

#import "HQPushViewController.h"

@interface HQPushViewController ()

@end

@implementation HQPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(blocked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

- (void)blocked
{
    if (self.callback){
        self.callback(@"回传");
    }
    [self.navigationController popViewControllerAnimated:YES];
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
