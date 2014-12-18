//
//  LoginHomeViewController.h
//  LvBan
//
//  Created by 辰 宫 on 14/12/3.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "LVBViewController.h"
#import <TencentOpenAPI/TencentOAuth.h>

@interface LoginHomeViewController : LVBViewController <TencentSessionDelegate>
{
    NSArray* _permissions;
    TencentOAuth* _tencentOAuth;
}

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *accessTokenLabel;
@property (weak, nonatomic) IBOutlet UILabel *openIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *expirationDateLabel;

@property (weak, nonatomic) IBOutlet UIImageView *partraitImage;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@end
