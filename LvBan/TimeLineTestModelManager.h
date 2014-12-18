//
//  TimeLineTestModelManager.h
//  LvBan
//
//  Created by 辰 宫 on 14/12/16.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeLineTestModelManager : NSObject

//插入数据
- (NSArray *)insertCoreData:(NSArray*)dataArray;
//查询
- (NSMutableArray*)selectData;
//删除
- (void)deleteData;
////更新
//- (void)updateData:(NSString*)newsId withIsLook:(NSString*)islook;

@end
