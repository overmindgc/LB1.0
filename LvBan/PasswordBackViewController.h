//
//  PasswordBackViewController.h
//  LvBan
//
//  Created by 辰 宫 on 14/12/30.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "LVBViewController.h"
#import "LVBRoundCornerButton.h"
#import "PasswordChangeViewController.h"

@interface PasswordBackViewController : LVBViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet LVBUITextField *phoneText;
@property (weak, nonatomic) IBOutlet LVBUITextField *verifyText;
@property (weak, nonatomic) IBOutlet LVBUIButton *getVerifyCodeButton;
@property (weak, nonatomic) IBOutlet LVBRoundCornerButton *resetPasswordButton;

@end
