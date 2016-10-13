//
//  HorizonalTableViewController.h
//  EXChina
//
//  Created by Chia on 16/9/30.
//  Copyright © 2016年 ZW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizonalTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *controllers;

- (instancetype)initWithViewControllers:(NSArray *)controllers;

@end
