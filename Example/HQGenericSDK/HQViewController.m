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
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
