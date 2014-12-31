//
//  DataViewController.m
//  TestPageView
//
//  Created by 辰 宫 on 14/12/31.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "DataViewController.h"
#import "AppDelegate.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor appMainColor];
    self.dataLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, 100, 100, 30)];
    self.dataLabel.textAlignment = NSTextAlignmentCenter;
    self.dataLabel.font = [UIFont appMainFontWithSize:25];
    self.dataLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.dataLabel];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 80, 20, 60, 30)];
    [backButton setTitle:@"退出" forState:UIControlStateNormal];
    backButton.tintColor = [UIColor whiteColor];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

- (void)back
{
    [ApplicationDelegate showLoginView];
}

@end
