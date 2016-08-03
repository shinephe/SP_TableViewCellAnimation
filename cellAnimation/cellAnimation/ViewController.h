//
//  ViewController.h
//  cellAnimation
//
//  Created by Leo on 16/6/15.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *array;

}

@property(assign,nonatomic)BOOL isOpen;
@property(assign,nonatomic)BOOL isAdd;
@property(strong,nonatomic)UIView *textView;
@property(strong,nonatomic)NSIndexPath *indexPath;

@end

