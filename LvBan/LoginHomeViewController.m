//
//  LoginHomeViewController.m
//  LvBan
//
//  Created by 辰 宫 on 14/12/3.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "LoginHomeViewController.h"
#import "ButtonWithNumTipView.h"

@interface LoginHomeViewController ()
{
    ButtonWithNumTipView *tipBtn;
    BOOL logoHasAnimation;
}

@end

@implementation LoginHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.phoneRegisterButton showBorder];
    [self.qqLoginButton showBorder];
    self.qqLoginButton.backgroundColor = [UIColor clearColor];
    self.loginButton.tintColor = [UIColor appMainColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    if (!logoHasAnimation) {
        [self logoAnimation];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//logo动画
- (void)logoAnimation
{
    CGPoint originLogoPoint = self.logoImage.layer.position;
    self.logoImage.layer.position = CGPointMake(originLogoPoint.x, originLogoPoint.y - 100);
    [UIView animateWithDuration:0.6 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.logoImage setAlpha:1.0];
        self.logoImage.layer.position = originLogoPoint;
    } completion:^(BOOL finished) {
        self.logoImage.layer.position = originLogoPoint;
    }];
    logoHasAnimation = YES;
}

#pragma mark actions
- (IBAction)phoneRegisterAction:(id)sender {
    PhoneRegisterViewController *phoneRegVC = [[PhoneRegisterViewController alloc] init];
    [self.navigationController pushViewController:phoneRegVC animated:YES];
}

- (IBAction)QQLoginAction:(id)sender {
    QQLoginViewController *qqLoginVC = [[QQLoginViewController alloc] init];
    qqLoginVC.delegate = self;
    [self.navigationController presentViewController:qqLoginVC animated:YES completion:nil];
}

- (IBAction)loginAction:(id)sender {
    
}

#pragma QQLoginDelegate
- (void)QQLoginSuccessResponse:(NSDictionary *)responseDict {
    NSLog(@"%@",responseDict);
}

@end
