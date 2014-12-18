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
}

@end

@implementation LoginHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor appMainColor];
    // Do any additional setup after loading the view from its nib.
//    NSString *appid = @"1103564258";
    NSString *appid = @"222222";
    
    _tencentOAuth = [[TencentOAuth alloc] initWithAppId:appid
                                            andDelegate:self];
//    _permissions = [NSMutableArray arrayWithObjects:@"get_user_info",@"get_simple_userinfo", @"add_t", nil];
    _permissions = [NSArray arrayWithObjects:
                     kOPEN_PERMISSION_GET_USER_INFO,
                     kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                     nil];
    
    tipBtn = [[ButtonWithNumTipView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 80/2, 300, 80, 80) imagePath:@"friends" andText:@"朋友"];
    [tipBtn addTarget:self action:@selector(friendClick) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:tipBtn];
    [tipBtn showTipNumber:@"6"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)friendClick
{
    [tipBtn hideTipNumber];
    [tipBtn showTipNumber:@"6"];
}

/**
 * tencentOAuth
 */
- (IBAction)onClickTencentOAuth:(id)sender {
    _resultLabel.text = @"开始获取token";
    [_tencentOAuth authorize:_permissions inSafari:YES];
}

#pragma mark TencentSessionDelegate

- (void)tencentDidLogin
{
    NSString *accessToken = [_tencentOAuth accessToken];
    NSString *openId = [_tencentOAuth openId];
    NSDate *expirationDate = [_tencentOAuth expirationDate];
    _resultLabel.text = @"登录成功！";
    _accessTokenLabel.text = [NSString stringWithFormat:@"accessToken：%@",accessToken];
    _openIdLabel.text = [NSString stringWithFormat:@"openId：%@",openId];
    _expirationDateLabel.text = [NSString stringWithFormat:@"expirationDate：%@",expirationDate];
    
    if(![_tencentOAuth getUserInfo]){
        [self showInvalidTokenOrOpenIDMessage];
    }
}

- (void)showInvalidTokenOrOpenIDMessage{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"api调用失败" message:@"可能授权已过期，请重新获取" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

/**
 * Called when the user dismissed the dialog without logging in.
 */
- (void)tencentDidNotLogin:(BOOL)cancelled
{
    if (cancelled){
        _resultLabel.text = @"用户取消登录";
    }
    else {
        _resultLabel.text = @"登录失败";
    }
    
}

/**
 * Called when the notNewWork.
 */
-(void)tencentDidNotNetWork
{
    _resultLabel.text=@"无网络连接，请设置网络";
}

/**
 * Called when the logout.
 */
-(void)tencentDidLogout
{
    _resultLabel.text=@"退出登录成功，请重新登录";
    
}

/**
 * Called when the get_user_info has response.
 */
- (void)getUserInfoResponse:(APIResponse*) response {
    if (response.retCode == URLREQUEST_SUCCEED)
    {
        NSMutableString *str=[NSMutableString stringWithFormat:@""];
        for (id key in response.jsonResponse) {
            [str appendString: [NSString stringWithFormat:@"%@:%@\n",key,[response.jsonResponse objectForKey:key]]];
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"操作成功" message:[NSString stringWithFormat:@"%@",str]
                              
                                                       delegate:self cancelButtonTitle:@"我知道啦" otherButtonTitles: nil];
        [alert show];
        
        NSURL *headUrl = [NSURL URLWithString:[response.jsonResponse objectForKey:@"figureurl_qq_2"]];
        UIImage *headImg = [UIImage imageWithData: [NSData dataWithContentsOfURL:headUrl]];
        _partraitImage.image = headImg;
        _nickNameLabel.text = [response.jsonResponse objectForKey:@"nickname"];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"操作失败" message:[NSString stringWithFormat:@"%@", response.errorMsg]
                              
                                                       delegate:self cancelButtonTitle:@"我知道啦" otherButtonTitles: nil];
        [alert show];
    }
    _resultLabel.text=@"获取个人信息完成";
}


@end
