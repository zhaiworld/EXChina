//
//  HomePageViewController.m
//  EXChina
//
//  Created by Chia on 16/9/22.
//  Copyright © 2016年 ZW. All rights reserved.
//

#import "HomePageViewController.h"
#import "UIColor+Util.h"

@interface HomePageViewController ()

@property (nonatomic ,assign) BOOL isLogin;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我";
    
    self.tableView.backgroundColor = [UIColor themeColor];
    self.tableView.separatorColor = [UIColor separatorColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 23;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    switch (section) {
        case 0:
            return 4;
            break;
        case 1:
            return 1;
            break;
            
        default:
            break;
            
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *reuserId = @"homepage";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserId];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    UIView *selectedBackground = [UIView new];
    selectedBackground.backgroundColor = [UIColor colorWithHex:0xF5FFFA];
    [cell setSelectedBackgroundView:selectedBackground];
    
    cell.backgroundColor = [UIColor whiteColor];//colorWithHex:0xF9F9F9
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @[@"我的消息", @"我的博客", @"我的活动", @"我的团队"][indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@[@"ic_my_messege", @"ic_my_blog", @"ic_my_event", @"ic_my_team"][indexPath.row]];
    } else if (indexPath.section == 1){
        cell.textLabel.text = @[@"设置"][indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@[@"ic_my_setting"][indexPath.row]];
        
    }
    
    
    cell.textLabel.textColor = [UIColor titleColor];
    
    if (indexPath.row == 0 && indexPath.section == 0) {
        UILabel *accessoryBadge = [UILabel new];
        accessoryBadge.backgroundColor = [UIColor redColor];
        accessoryBadge.text = @"5";
        accessoryBadge.textColor = [UIColor whiteColor];
        accessoryBadge.textAlignment = NSTextAlignmentCenter;
        accessoryBadge.layer.cornerRadius = 11;
        accessoryBadge.clipsToBounds = YES;
        
        CGFloat width = [accessoryBadge sizeThatFits:CGSizeMake(MAXFLOAT, 26)].width + 8;
        width = width > 26? width: 22;
        accessoryBadge.frame = CGRectMake(0, 0, width, 22);
        cell.accessoryView = accessoryBadge;
        
    }
    
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor selectCellSColor];
    
    return cell;
}



@end
