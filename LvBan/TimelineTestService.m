//
//  HomePageService.m
//  LvBan
//
//  Created by 辰 宫 on 14/12/15.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "TimelineTestService.h"

#import "AFAppDotNetAPIClient.h"
#import "PostTest.h"

static TimeLineTestModelManager *modelManager;

@implementation TimelineTestService


+ (TimelineTestService *)sharedInstance
{
    static dispatch_once_t once;
    static TimelineTestService *sharedInstance = nil;
    
    dispatch_once(&once, ^
                  {
                      sharedInstance = [[self alloc] init];
                      modelManager = [[TimeLineTestModelManager alloc] init];
                  });
    
    return sharedInstance;
}

#pragma mark -

- (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block cache:(BOOL)isUse {
    
    NSMutableArray *cachePostArray = [modelManager selectData];
    if (isUse && cachePostArray.count > 0) {
        if (block) {
            block(cachePostArray, nil);
        }
    }
 
    NSString *requestUrl = @"/stream/0/posts/stream/global";
    NSURLSessionDataTask *task = [self requerstURL:requestUrl parameters:nil block:^(NSDictionary *JSON, NSError *error) {
//        [modelManager deleteData];
        NSMutableArray *postArray;
        NSArray *postsFromResponse = [JSON valueForKeyPath:RESULT_DATA_KEY];
        
        NSArray *newPosts;
        if (cachePostArray.count == 0) {
            newPosts = [modelManager insertCoreData:postsFromResponse];
        } else {
            //判断id只添加新加的
            NSMutableArray *newCachePosts = [[NSMutableArray alloc] init];
            BOOL isNew = YES;
            for (NSDictionary *newPost in postsFromResponse) {
                NSString *postId = [newPost objectForKey:@"id"];

                for (PostTest *cahPost in cachePostArray) {
                    if ([cahPost.postID isEqualToString:postId]) {
                        isNew = NO;
                    }
                }
                if (isNew) {
                    [newCachePosts addObject:newPost];
                }
            }
            
            newPosts = [modelManager insertCoreData:newCachePosts];
        }
        
        if (newPosts.count > 0) {
            if (cachePostArray.count == 0) {
                postArray = [newPosts mutableCopy];
            } else {
                postArray = cachePostArray;
                NSMutableIndexSet *indexes = [NSMutableIndexSet indexSetWithIndexesInRange:NSMakeRange(0, newPosts.count)];
                [postArray insertObjects:newPosts atIndexes:indexes];
            }
        }
        
        if (block) {
            block(postArray, nil);
        }
    }];
    return task;
}

@end
