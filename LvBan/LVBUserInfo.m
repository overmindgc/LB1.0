//
//  LVBUserInfo.m
//  LvBan
//
//  Created by 辰 宫 on 14/12/26.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "LVBUserInfo.h"

@implementation LVBUserInfo

+ (void)saveCurrentUserId:(NSString *)userId withToken:(NSString *)token
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:userId forKey:@"user_id"];
    [userDefaults setObject:token forKey:@"token"];
    [userDefaults synchronize];//同步存储到磁盘
}

+ (NSString *)currentUserId;
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    return [userDefaults stringForKey:@"user_id"];
}

+ (NSString *)currentToken
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    return [userDefaults stringForKey:@"token"];
}

@end
