//
//  BaseService.m
//  LvBan
//
//  Created by 辰 宫 on 14/12/15.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "BaseNetworking.h"
#import "AFAppDotNetAPIClient.h"
#import "SVProgressHUD.h"

@implementation BaseNetworking

- (NSURLSessionDataTask *)requerstURL:(NSString *)url
                           parameters:(id)parameters
                                block:(void (^)(NSDictionary *JSON, NSError *error))block;
{
    return [[AFAppDotNetAPIClient sharedClient] POST:url parameters:parameters success:^(NSURLSessionDataTask * __unused task, id JSON) {
//        NSString *flag = [JSON valueForKeyPath:@"flag"];
//        if ([flag isEqualToString:@"1"]) {
//            if (block) {
//                block([NSArray array], nil);
//            }
//        } else {
//            
//        }
        
        if (block) {
            block(JSON, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"网络访问出错"];
        if (block) {
            block([NSDictionary dictionary], error);
        }
    }];

}



@end
