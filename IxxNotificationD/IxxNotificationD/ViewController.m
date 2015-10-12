//
//  ViewController.m
//  IxxNotificationD
//
//  Created by apple on 15/10/12.
//  Copyright © 2015年 incoshare. All rights reserved.
//

#import "ViewController.h"
#import "IxxTableController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
- (IBAction)btnClick;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 2.注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receives:) name:@"cellClick" object:nil];
}


- (void)receives:(NSNotification *)notification
{
    [self.btn setTitle:[notification.userInfo[@"cellIndex"] description] forState:UIControlStateNormal];
    
    if ([[notification.userInfo[@"cellIndex"] description] integerValue] & 1) {
        self.view.backgroundColor = [UIColor redColor];
    }else{
        self.view.backgroundColor = [UIColor greenColor];
    }
}

// 移除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (IBAction)btnClick {
    
    IxxTableController *vc = [[IxxTableController alloc] init];
    
    [self presentViewController:vc animated:YES completion:nil];
}
@end
