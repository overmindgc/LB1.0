//
//  LVBUserInfo.h
//  LvBan
//  用于存储用户登陆的信息，使用NSUserDefaults
//  Created by 辰 宫 on 14/12/26.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LVBUserInfo : NSObject

/*存储当前登陆用户的id*/
+ (void)saveCurrentUserId:(NSString *)userId withToken:(NSString *)token;

/*获取当前登陆用户的id*/
+ (NSString *)currentUserId;

/*获取当前登陆用户的token*/
+ (NSString *)currentToken;

@end
