//
//  PasswordBackViewController.m
//  LvBan
//
//  Created by 辰 宫 on 14/12/30.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "PasswordBackViewController.h"

@interface PasswordBackViewController ()

@end

@implementation PasswordBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 触摸背景，关闭键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    UIView *view = (UIView *)[touch view];
    if (view == self.view) {
        [self.phoneText resignFirstResponder];
        [self.verifyText resignFirstResponder];
    }
}


#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];    //主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
    return YES;
}


#pragma mark actions
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)resetClick:(id)sender {
    PasswordChangeViewController *psChangeVC = [[PasswordChangeViewController alloc] init];
    [self.navigationController pushViewController:psChangeVC animated:YES];
}

@end
