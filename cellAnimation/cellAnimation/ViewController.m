//
//  ViewController.m
//  cellAnimation
//
//  Created by Leo on 16/6/15.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import "ViewController.h"
#import "LeoCell.h"
#import "Masonry.h"
#import "UIView+Leo.h"

@interface ViewController ()

@end

UITableView *tab;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    array = [[NSMutableArray alloc]init];
    for (int i = 0; i < 20; i++)
    {
        Model *mm = [[Model alloc]init];
        mm.title = [NSString stringWithFormat:@"------------%d",i];
        
        [array addObject:mm];
    }
    
    
    tab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tab.delegate = self;
    tab.dataSource = self;
    
    [tab registerClass:[LeoCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:tab];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    cell.mm = array[indexPath.row];
    
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return 35;
    
    if (self.isAdd &&[self.indexPath isEqual:indexPath]) {
        
        return 210;
    }
    return 120;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LeoCell *cell = (LeoCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    Model *mm = array[indexPath.row];
    
    Model *mmRecord;
    LeoCell *cellRecord;
    if (self.indexPath)
    {
        mmRecord = array[self.indexPath.row];
        cellRecord = (LeoCell *)[tableView cellForRowAtIndexPath:self.indexPath];
    }
    if (mmRecord.isOpen)
    {
        [UIView animateWithDuration:0.3
                         animations:^{
                             
                             NSLog(@"-----------------------");
                             cellRecord.testView.transform = CGAffineTransformMakeScale(1, 0.00000001);
                             
                         }completion:^(BOOL finish){
                             
                             //_isOpen = NO;
                             mmRecord.isOpen = NO;
                         }];
        
    }

   //这里才是点击进行相应操作的Cell
    if (!mm.isOpen)
    {
        
        self.isAdd = YES;
       
        self.indexPath = indexPath;

        [UIView animateWithDuration:0.3
                         animations:^{
                             
                             NSLog(@"+++++++++++++++++++++%@",cell.testView);
                             
                             cell.testView.transform = CGAffineTransformMakeScale(1, 1);

                         }completion:^(BOOL finish){
                             
                            //_isOpen = YES;
                             mm.isOpen = YES;
                             
                         }];
    }
    else
    {
        
       self.isAdd = NO;
        
        [UIView animateWithDuration:0.3
                         animations:^{
                            
                             NSLog(@"-----------------------");
                             cell.testView.transform = CGAffineTransformMakeScale(1, 0.00000001);

                         }completion:^(BOOL finish){
                             
                              //_isOpen = NO;
                             mm.isOpen = NO;
                         }];
    }
    
    [tableView beginUpdates];
    
    [tableView endUpdates];

    CGRect rectInTableView = [tableView rectForRowAtIndexPath:indexPath];
   
    CGRect rect = [tableView convertRect:rectInTableView toView:[tableView superview]];
    
    if (rect.origin.y+rect.size.height >=667)
    {
        [tab setContentOffset:CGPointMake(0, tableView.contentOffset.y+210-self.view.frame.size.height+rect.origin.y) animated:YES];
    }
    
    if (rect.origin.y <= 0)
    {
        [tab setContentOffset:CGPointMake(0, tableView.contentOffset.y+rect.origin.y) animated:YES];
    }
    
    NSLog(@"+++++++++++++%@",NSStringFromCGRect(rect));
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
