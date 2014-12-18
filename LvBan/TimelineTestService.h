//
//  HomePageService.h
//  LvBan
//
//  Created by 辰 宫 on 14/12/15.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNetworking.h"
#import "TimeLineTestModelManager.h"

@interface TimelineTestService : BaseNetworking

+ (TimelineTestService *)sharedInstance;

- (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block cache:(BOOL)isUse;

@end
