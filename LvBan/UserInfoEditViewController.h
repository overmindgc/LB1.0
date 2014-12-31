//
//  UserInfoEditViewController.h
//  LvBan
//
//  Created by 辰 宫 on 14/12/30.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "LVBViewController.h"

@interface UserInfoEditViewController : LVBViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *downBarButton;
@property (weak, nonatomic) IBOutlet LVBUIImageView *headImageView;
@property (weak, nonatomic) IBOutlet LVBUITextField *nickNameText;
@property (weak, nonatomic) IBOutlet LVBUITextField *passwordText;

@end
