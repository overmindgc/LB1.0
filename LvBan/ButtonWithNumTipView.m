//
//  ButtonWithNumTipView.m
//  lbad
//
//  Created by 辰 宫 on 14-8-4.
//  Copyright (c) 2014年 gc. All rights reserved.
//

#import "ButtonWithNumTipView.h"

@implementation ButtonWithNumTipView
{
    UIView *cicleView;
    UILabel *numLab;
}

@synthesize btnNum;


- (id)initWithFrame:(CGRect)frame imagePath:(NSString *)path andText:(NSString *)text
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIImage *btnImg = [UIImage imageNamed:path];
        [self setImage:btnImg forState:UIControlStateNormal];
        [self setImage:btnImg forState:UIControlStateHighlighted];
        
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(-5, self.frame.size.height, self.frame.size.width+10, 25)];
        textLabel.text = text;
        textLabel.textColor = [UIColor whiteColor];
        textLabel.font = [UIFont appMainFontWithSize:15];
        textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:textLabel];
        
        cicleView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width - 28, -2, 28, 28)];
        cicleView.backgroundColor = [UIColor whiteColor];
        cicleView.layer.cornerRadius = 14;
        [cicleView setHidden:YES];
        
        numLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 28, 28)];
        numLab.font = [UIFont appMainFontWithSize:10];
        numLab.textColor = [UIColor appMainColor];
        numLab.textAlignment = NSTextAlignmentCenter;
        [cicleView addSubview:numLab];
        [self addSubview:cicleView];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
}

- (void)showTipNumber:(NSString *)num;
{
    numLab.text = num;
    
    CGAffineTransform smallTransform = CGAffineTransformMakeScale(0.1, 0.1);
    [cicleView setTransform:smallTransform];
    [numLab setTransform:smallTransform];
    
    [cicleView setHidden:NO];
    
    [UIView animateWithDuration:0.15 animations:^{
        CGAffineTransform originTransform = CGAffineTransformMakeScale(1.0, 1.0);
        [cicleView setTransform:originTransform];
        [numLab setTransform:originTransform];
    }];
}

- (void)hideTipNumber
{
    [cicleView setHidden:YES];
}

@end
