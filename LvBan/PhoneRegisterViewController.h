//
//  PhoneRegisterViewController.h
//  LvBan
//
//  Created by 辰 宫 on 14/12/30.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "LVBViewController.h"
#import "LVBRoundCornerButton.h"

@interface PhoneRegisterViewController : LVBViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneText;
@property (weak, nonatomic) IBOutlet UITextField *verifyText;
@property (weak, nonatomic) IBOutlet UIButton *getVerifyCodeButton;
@property (weak, nonatomic) IBOutlet LVBRoundCornerButton *registerButton;

@end