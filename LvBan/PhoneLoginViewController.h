//
//  PhoneLoginViewController.h
//  LvBan
//
//  Created by 辰 宫 on 14/12/30.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "LVBViewController.h"
#import "LVBRoundCornerButton.h"
#import "PasswordBackViewController.h"

@interface PhoneLoginViewController : LVBViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet LVBUITextField *phoneNumText;

@property (weak, nonatomic) IBOutlet LVBUITextField *passwordText;
@property (weak, nonatomic) IBOutlet LVBUIButton *passwordBackButton;
@property (weak, nonatomic) IBOutlet LVBRoundCornerButton *loginButton;
@end
