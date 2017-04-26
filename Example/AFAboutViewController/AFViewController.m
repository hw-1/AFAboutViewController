//
//  AFViewController.m
//  AFAboutViewController
//
//  Created by vpnss1231@gmail.com on 04/26/2017.
//  Copyright (c) 2017 vpnss1231@gmail.com. All rights reserved.
//

#import "AFViewController.h"
@import AFAboutViewController;

@interface AFViewController ()

@end

@implementation AFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton * b = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 120, 44)];
    [self.view addSubview:b];
    [b setBackgroundColor:[UIColor blueColor]];
    [b setTitle:@"About" forState:UIControlStateNormal];
    [b addTarget:self action:@selector(aboutAction) forControlEvents:UIControlEventTouchUpInside];
}

-(void)aboutAction{
    AFAboutViewController * about = [[AFAboutViewController alloc] initWithAppId:@"1212727402"];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:about];
//    nav.navigationBar.translucent = NO;
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
