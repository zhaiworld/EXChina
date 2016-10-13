//
//  EXNavigationController.m
//  EXChina
//
//  Created by Chia on 16/9/21.
//  Copyright © 2016年 ZW. All rights reserved.
//

#import "EXNavigationController.h"

@interface EXNavigationController ()

@end

@implementation EXNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar-sidebar"]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(onClickMenuButton)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                           target:self
                                                                                           action:@selector(pushSearchViewController)];
}

-(void)onClickMenuButton{
    NSLog(@"点击了左侧");
}

-(void)pushSearchViewController{
    NSLog(@"点击了右侧");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
