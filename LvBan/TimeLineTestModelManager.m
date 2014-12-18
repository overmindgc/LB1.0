//
//  TimeLineTestModelManager.m
//  LvBan
//
//  Created by 辰 宫 on 14/12/16.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "TimeLineTestModelManager.h"
#import "AppDelegate.h"
#import "PostTest.h"

@implementation TimeLineTestModelManager

//插入数据
- (NSArray *)insertCoreData:(NSArray*)dataArray
{
    NSManagedObjectContext *context = ApplicationDelegate.managedObjectContext;
    NSMutableArray *postArray = [[NSMutableArray alloc] init];
    for (NSDictionary *postDict in dataArray) {
        PostTest *newPost = [NSEntityDescription insertNewObjectForEntityForName:@"PostTest" inManagedObjectContext:context];
        newPost.postID = [postDict objectForKey:@"id"];
        newPost.text = [postDict objectForKey:@"text"];
        NSDictionary *userDict = [postDict objectForKey:@"user"];
        newPost.userID = [userDict objectForKey:@"id"];
        newPost.username = [userDict objectForKey:@"username"];
        NSDictionary *imageDict = [userDict objectForKey:@"avatar_image"];
        newPost.avatarImageURLString = [imageDict objectForKey:@"url"];
      
        NSError *error;
        if(![context save:&error])
        {
            NSLog(@"不能保存：%@",[error localizedDescription]);
        }
        [postArray addObject:newPost];
    }
    return postArray;
}

//查询
- (NSMutableArray*)selectData
{
    NSManagedObjectContext *context = ApplicationDelegate.managedObjectContext;
    
    // 限定查询结果的数量
    //setFetchLimit
    // 查询的偏移量
    //setFetchOffset
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
//    [fetchRequest setFetchLimit:pageSize];
//    [fetchRequest setFetchOffset:currentPage];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PostTest" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    NSMutableArray *resultArray = [NSMutableArray array];
    
    for (PostTest *post in fetchedObjects) {
//        NSLog(@"postID:%@", post.postID);
//        NSLog(@"text:%@", post.text);
        [resultArray addObject:post];
    }
    return resultArray;
}

//删除
-(void)deleteData
{
    NSManagedObjectContext *context = ApplicationDelegate.managedObjectContext;
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PostTest" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setIncludesPropertyValues:NO];
    [request setEntity:entity];
    NSError *error = nil;
    NSArray *datas = [context executeFetchRequest:request error:&error];
    if (!error && datas && [datas count])
    {
        for (NSManagedObject *obj in datas)
        {
            [context deleteObject:obj];
        }
        if (![context save:&error])
        {
            NSLog(@"error:%@",error);
        }
    }
}
////更新
//- (void)updateData:(NSString*)newsId  withIsLook:(NSString*)islook
//{
//    NSManagedObjectContext *context = [self managedObjectContext];
//    
//    NSPredicate *predicate = [NSPredicate
//                              predicateWithFormat:@"newsid like[cd] %@",newsId];
//    
//    //首先你需要建立一个request
//    NSFetchRequest * request = [[NSFetchRequest alloc] init];
//    [request setEntity:[NSEntityDescription entityForName:TableName inManagedObjectContext:context]];
//    [request setPredicate:predicate];//这里相当于sqlite中的查询条件，具体格式参考苹果文档
//    
//    //https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/Predicates/Articles/pCreating.html
//    NSError *error = nil;
//    NSArray *result = [context executeFetchRequest:request error:&error];//这里获取到的是一个数组，你需要取出你要更新的那个obj
//    for (News *info in result) {
//        info.islook = islook;
//    }
//    
//    //保存
//    if ([context save:&error]) {
//        //更新成功
//        NSLog(@"更新成功");
//    }
//}

@end
