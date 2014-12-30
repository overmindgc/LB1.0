//
//  QQLoginViewController.m
//  LvBan
//
//  Created by 辰 宫 on 14/12/30.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "QQLoginViewController.h"

@interface QQLoginViewController ()
{
    NSString *accessToken;
    NSString *openId;
    NSDate *expirationDate;
}

@end

@implementation QQLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *appid = @"222222";
    
    _tencentOAuth = [[TencentOAuth alloc] initWithAppId:appid
                                            andDelegate:self];
    //    _permissions = [NSMutableArray arrayWithObjects:@"get_user_info",@"get_simple_userinfo", @"add_t", nil];
    _permissions = [NSArray arrayWithObjects:
                    kOPEN_PERMISSION_GET_USER_INFO,
                    kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                    nil];
    
    //tencentOAuth
    NSLog(@"开始获取token");
    [_tencentOAuth authorize:_permissions inSafari:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark TencentSessionDelegate

- (void)tencentDidLogin
{
    accessToken = [_tencentOAuth accessToken];
    openId = [_tencentOAuth openId];
    expirationDate = [_tencentOAuth expirationDate];
    NSLog(@"登录成功！");
   
    if(![_tencentOAuth getUserInfo]){
        [self showInvalidTokenOrOpenIDMessage];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showInvalidTokenOrOpenIDMessage{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"api调用失败" message:@"可能授权已过期，请重新获取" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 * Called when the user dismissed the dialog without logging in.
 */
- (void)tencentDidNotLogin:(BOOL)cancelled
{
    if (cancelled){
        NSLog(@"用户取消登录");

    }
    else {
        NSLog(@"登录失败");
        
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 * Called when the notNewWork.
 */
-(void)tencentDidNotNetWork
{
    NSLog(@"无网络连接，请设置网络");
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 * Called when the logout.
 */
-(void)tencentDidLogout
{
    NSLog(@"退出登录成功，请重新登录");
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
//        NSLog(@"%@",str);
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"操作成功" message:[NSString stringWithFormat:@"%@",str]
//                              
//                                                       delegate:self cancelButtonTitle:@"我知道啦" otherButtonTitles: nil];
//        [alert show];
//        
//        NSURL *headUrl = [NSURL URLWithString:[response.jsonResponse objectForKey:@"figureurl_qq_2"]];
//        UIImage *headImg = [UIImage imageWithData: [NSData dataWithContentsOfURL:headUrl]];
//        _partraitImage.image = headImg;
//        _nickNameLabel.text = [response.jsonResponse objectForKey:@"nickname"];
        
        NSMutableDictionary *infoDict = [response.jsonResponse mutableCopy];
        [infoDict setObject:accessToken forKey:@"accessToken"];
        [infoDict setObject:openId forKey:@"openId"];
        [infoDict setObject:expirationDate forKey:@"expirationDate"];
        [self.delegate QQLoginSuccessResponse:infoDict];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"操作失败" message:[NSString stringWithFormat:@"%@", response.errorMsg]
                              
                                                       delegate:self cancelButtonTitle:@"我知道啦" otherButtonTitles: nil];
        [alert show];
    }
    NSLog(@"获取个人信息完成");
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
