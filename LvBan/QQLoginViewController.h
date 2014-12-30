//
//  QQLoginViewController.h
//  LvBan
//
//  Created by 辰 宫 on 14/12/30.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "LVBViewController.h"
#import <TencentOpenAPI/TencentOAuth.h>

@protocol QQLoginDelegate <NSObject>

/*qq登陆成功回调代理方法*/
- (void)QQLoginSuccessResponse:(NSDictionary *)responseDict;

@end

@interface QQLoginViewController : LVBViewController <TencentSessionDelegate>
{
    NSArray* _permissions;
    TencentOAuth* _tencentOAuth;
}

@property (nonatomic, weak) id<QQLoginDelegate>delegate;

@end
