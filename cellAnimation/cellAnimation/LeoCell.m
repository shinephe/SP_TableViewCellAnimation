//
//  LeoCell.m
//  cellAnimation
//
//  Created by Leo on 16/6/15.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import "LeoCell.h"
#import "Masonry.h"

@implementation LeoCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 375, 120)];
        self.label.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0f green:arc4random()%255/255.0f blue:arc4random()%255/255.0f alpha:1.0f];
        [self.contentView addSubview:self.label];
        
        //重新定义锚点的位置，让其在父视图上展开的时候可以从中间的位置进行展开
        CGFloat zz = (120/2)/210.0f;
        self.testView = [[UIView alloc]initWithFrame:CGRectMake(0, -(210/2 - 120/2), 375, 210)];
        
        NSLog(@"===============%f",zz);
        self.testView.backgroundColor = [UIColor whiteColor];
        self.testView.userInteractionEnabled = YES;
        self.testView.transform = CGAffineTransformMakeScale(1, 0.0000001);
        
        //这里是进行锚点的坐标改变
        self.testView.layer.anchorPoint = CGPointMake(0.5, zz);
       
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 375, 30)];
        label.backgroundColor = [UIColor blackColor];
        [self.testView addSubview:label];

        [self.contentView addSubview:self.testView];
    }
    return self;
}
-(void)setMm:(Model *)mm
{
    self.label.text = mm.title;
    
    if (mm.isOpen)
    {
        self.testView.transform = CGAffineTransformMakeScale(1, 1);
    }
    else
    {
        self.testView.transform = CGAffineTransformMakeScale(1, 0.00000001);
    }
}


@end
