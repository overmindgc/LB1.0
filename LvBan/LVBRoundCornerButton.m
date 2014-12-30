//
//  LVBRoundCornerButton.m
//  LvBan
//
//  Created by 辰 宫 on 14/12/30.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "LVBRoundCornerButton.h"

@implementation LVBRoundCornerButton

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
    self.layer.cornerRadius = 7;
    self.backgroundColor = [UIColor appMainColor];
    self.tintColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont appMainFontWithSize:20.0];
}

- (void)showBorder
{
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor grayColor].CGColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
