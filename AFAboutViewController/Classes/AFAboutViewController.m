//
//  AFAboutViewController.m
//  privatediary
//
//  Created by privacy on 4/26/17.
//  Copyright © 2017 user1231. All rights reserved.
//

#import "AFAboutViewController.h"

@interface AFAboutViewController ()

@property(nonatomic,strong)NSString* AppId;

@end

@implementation AFAboutViewController

- (instancetype)initWithAppId:(NSString*)AppId
{
    self = [super init];
    if (self) {
        self.AppId = AppId;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"About";
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadviews];
}

-(void)loadviews{
    UIImageView * logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AppIcon60x60"]];
    [self.view addSubview:logo];
    logo.translatesAutoresizingMaskIntoConstraints = NO;
 
    logo.layer.cornerRadius = 10;
    [logo.layer setMasksToBounds:YES];
 
    
    CGFloat deltaY = 44;
    if (self.navigationController && self.navigationController.navigationBar.translucent) {
        deltaY += 88;
    }
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:deltaY]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:88]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:88]];
    
    //version
    UILabel * versionLabel = [[UILabel alloc] init];
    versionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:versionLabel];
    versionLabel.textColor = [UIColor blackColor];
    versionLabel.font = [UIFont systemFontOfSize:17];
    versionLabel.textAlignment = NSTextAlignmentCenter;
    NSString *appDisplayName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *buildVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    appName = appDisplayName?:appName;
    
    versionLabel.text = [NSString stringWithFormat:@"%@ %@(%@)",appName,version,buildVersion];
    
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:versionLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:logo attribute:NSLayoutAttributeBottom multiplier:1.0 constant:44]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:versionLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:versionLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:versionLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:21]];
    
    //rate
    UIButton * rateButton = [[UIButton alloc] init];
    [self.view addSubview:rateButton];
    rateButton.translatesAutoresizingMaskIntoConstraints = NO;
    rateButton.layer.borderWidth = 0.5f;
    rateButton.layer.borderColor =[UIColor lightGrayColor].CGColor;
    rateButton.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    NSString * ratestr = [[NSString stringWithFormat:@" Rate %@",appName] uppercaseString];
    [rateButton setTitle:ratestr forState:UIControlStateNormal];
    [rateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rateButton addTarget:self action:@selector(rateApp) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rateButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:versionLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:44]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rateButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rateButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rateButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:44]];
    
    //copyright
    UILabel * copyright = [[UILabel alloc] init];
    copyright.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:copyright];
    copyright.textColor = [UIColor blackColor];
    copyright.font = [UIFont systemFontOfSize:15];
    copyright.textAlignment = NSTextAlignmentCenter;
 
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    copyright.text = [NSString stringWithFormat:@"©%ld %@",(long)[components year],appName];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:copyright attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-22]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:copyright attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:copyright attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:copyright attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:21]];
    
}

- (void)rateApp{
    NSString *str = [NSString stringWithFormat:
                     @"https://itunes.apple.com/us/app/id%@?ls=1&mt=8",
                     self.AppId ];
    NSLog(@"%@",str);
    [[UIApplication sharedApplication]  openURL:[NSURL URLWithString:str]  options:@{} completionHandler:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 
@end
