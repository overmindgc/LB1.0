//
//  LVBUIButton.m
//  LvBan
//
//  Created by 辰 宫 on 14/12/3.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "LVBUIButton.h"

@implementation LVBUIButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setLayerStyle];
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        // Initialization code
        [self setLayerStyle];
    }
    return self;
}

- (void)setLayerStyle
{
    self.tintColor = [UIColor appMainColor];
}

@end
