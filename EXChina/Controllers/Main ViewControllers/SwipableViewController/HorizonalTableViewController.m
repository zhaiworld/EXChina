//
//  HorizonalTableViewController.m
//  EXChina
//
//  Created by Chia on 16/9/30.
//  Copyright © 2016年 ZW. All rights reserved.
//

#import "HorizonalTableViewController.h"
#import "UIColor+Util.h"

@interface HorizonalTableViewController ()

@end

static NSString *kHorizonalCellID = @"HorizonalCell";

@implementation HorizonalTableViewController

-(instancetype)initWithViewControllers:(NSArray *)controllers{
    self = [super init];
    if (self) {
        _controllers = [NSMutableArray arrayWithArray:controllers];
        for (UIViewController * controller in controllers) {
            [self addChildViewController:controller];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [UITableView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollsToTop = NO;
    self.tableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.pagingEnabled = YES;
    self.tableView.backgroundColor = [UIColor themeColor];
    self.tableView.bounces = NO;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kHorizonalCellID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _controllers.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.frame.size.width;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kHorizonalCellID forIndexPath:indexPath];
    cell.contentView.transform = CGAffineTransformMakeRotation(M_PI_2);
    cell.contentView.backgroundColor = [UIColor themeColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIViewController *controller = _controllers[indexPath.row];
    controller.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:controller.view];
    
    return cell;
}


@end
