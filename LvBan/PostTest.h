//
//  PostTest.h
//  LvBan
//
//  Created by 辰 宫 on 14/12/17.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PostTest : NSManagedObject

@property (nonatomic, retain) NSString * postID;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSString * userID;
@property (nonatomic, retain) NSString * avatarImageURLString;
@property (nonatomic, retain) NSString * username;

@end
