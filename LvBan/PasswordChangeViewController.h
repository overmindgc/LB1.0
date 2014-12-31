//
//  PasswordChangeViewController.h
//  LvBan
//
//  Created by 辰 宫 on 14/12/30.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "LVBViewController.h"
#import "LVBRoundCornerButton.h"

@interface PasswordChangeViewController : LVBViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet LVBUITextField *passwordOneButton;
@property (weak, nonatomic) IBOutlet LVBUITextField *passwordTwoButton;
@property (weak, nonatomic) IBOutlet LVBRoundCornerButton *commitButton;

@end
