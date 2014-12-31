//
//  LoginHomeViewController.h
//  LvBan
//
//  Created by 辰 宫 on 14/12/3.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "LVBViewController.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import "QQLoginViewController.h"
#import "PhoneRegisterViewController.h"
#import "PhoneLoginViewController.h"
#import "LVBRoundCornerButton.h"

@interface LoginHomeViewController : LVBViewController <QQLoginDelegate>

@property (weak, nonatomic) IBOutlet LVBUIImageView *logoImage;
@property (weak, nonatomic) IBOutlet LVBRoundCornerButton *qqLoginButton;
@property (weak, nonatomic) IBOutlet LVBUIButton *loginButton;
@property (weak, nonatomic) IBOutlet LVBRoundCornerButton *phoneRegisterButton;

@end
