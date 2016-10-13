//
//  SwipableViewController.h
//  EXChina
//
//  Created by Chia on 16/9/21.
//  Copyright © 2016年 ZW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleBarView.h"
#import "HorizonalTableViewController.h"

@interface SwipableViewController : UIViewController

@property (strong, nonatomic) TitleBarView *titleBar;
@property (strong, nonatomic) HorizonalTableViewController *viewPager;

-(instancetype)initWithTitle:(NSString*)title subTitles:(NSArray*)subTitles controllers:(NSArray*)controllers;

@end
