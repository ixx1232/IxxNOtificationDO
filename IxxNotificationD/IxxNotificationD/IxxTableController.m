//
//  IxxTableController.m
//  IxxNotificationD
//
//  Created by apple on 15/10/12.
//  Copyright © 2015年 incoshare. All rights reserved.
//

#import "IxxTableController.h"

@interface IxxTableController ()

@end

@implementation IxxTableController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    static NSString *resue = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resue];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:resue];
    }
    
    // 给cell赋值
    cell.textLabel.text = [@(indexPath.row) description];
    
    // 3.返回cell
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.发布通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cellClick" object:self userInfo:@{@"cellIndex":@(indexPath.row)}];
    
    // 销毁控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
