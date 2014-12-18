//
//  BaseService.h
//  LvBan
//
//  Created by 辰 宫 on 14/12/15.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFAppDotNetAPIClient.h"

@interface BaseNetworking : NSObject

/**
 基础网络通信类，处理公共参数
 */
- (NSURLSessionDataTask *)requerstURL:(NSString *)url
                           parameters:(id)parameters
                                block:(void (^)(NSDictionary *JSON, NSError *error))block;

@end
