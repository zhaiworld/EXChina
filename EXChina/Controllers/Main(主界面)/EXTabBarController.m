//
//  EXTabBarController.m
//  EXChina
//
//  Created by Chia on 16/9/12.
//  Copyright © 2016年 ZW. All rights reserved.
//

#import "EXTabBarController.h"
#import "EXTabBar.h"
#import "UIColor+Util.h"
#import "EXNavigationController.h"
#import "SwipableViewController.h"
#import "DiscoverViewController.h"
#import "HomePageViewController.h"
#import "OSCActivityViewController.h"
#import "NewBlogsViewController.h"
#import "QuesAnsViewController.h"   
#import "InformationViewController.h"
#import "TweetsViewController.h"

@interface EXTabBarController ()<EXTabBarDelegate>

@end

@implementation EXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.初始化“综合”类控制器
    NewBlogsViewController *newsTableView = [[NewBlogsViewController alloc] init];
    InformationViewController *infoTableView = [[InformationViewController alloc] init];
    QuesAnsViewController *quesAnsTableView = [[QuesAnsViewController alloc] init];
    OSCActivityViewController *activityTableView = [[OSCActivityViewController alloc] init];
    
    //2.初始化“动弹”类控制器
    TweetsViewController *newTweetViewCtl = [[TweetsViewController alloc] init];
    TweetsViewController *hotTweetViewCtl = [[TweetsViewController alloc] init];
    TweetsViewController *myFriendTweetViewCtl = [[TweetsViewController alloc] init];
    
    //.1创建子控制器
    SwipableViewController *newsSVC = [[SwipableViewController alloc] initWithTitle:@"综合" subTitles:@[@"资讯", @"博客", @"问答", @"活动"] controllers:@[infoTableView,newsTableView,quesAnsTableView,activityTableView]];
    newsSVC.view.backgroundColor = [UIColor themeColor];
    SwipableViewController *tweetsSVC = [[SwipableViewController alloc] initWithTitle:@"动弹" subTitles:@[@"最新动弹", @"热门动弹", @"我的动弹"] controllers:@[newTweetViewCtl,hotTweetViewCtl,myFriendTweetViewCtl]];
    tweetsSVC.view.backgroundColor = [UIColor themeColor];
    
    DiscoverViewController *discoverSB = [[DiscoverViewController alloc] init];
    discoverSB.view.backgroundColor = [UIColor themeColor];
    HomePageViewController *homepageSB = [[HomePageViewController alloc] init];
    homepageSB.view.backgroundColor = [UIColor themeColor];
    
    //2.添加子控制器到tabBarController
    [self addChildVcWith:newsSVC title:@"综合" image:@"tabbar-news" selectedImage:@"tabbar-news-selected"];
    [self addChildVcWith:tweetsSVC title:@"动弹" image:@"tabbar-tweet" selectedImage:@"tabbar-tweet-selected"];
    [self addChildVcWith:discoverSB title:@"发现" image:@"tabbar-discover" selectedImage:@"tabbar-discover-selected"];
    [self addChildVcWith:homepageSB title:@"我的" image:@"tabbar-me" selectedImage:@"tabbar-me-selected"];
    
    //2.自定义tabBar 更换系统自带
    EXTabBar *extabBar = [[EXTabBar alloc] init];
    extabBar.backgroundColor = [UIColor colorWithRed:246.0 green:246.0 blue:246.0 alpha:1];
    extabBar.translucent = NO;
    [self setValue:extabBar forKey:@"tabBar"];
}
-(void)addChildVcWith:(UIViewController*)viewController title:(NSString*)title image:(NSString*)image selectedImage:(NSString*)selectedImage{
    //1.设置tabBarItem内容
    [viewController.tabBarItem setTitle:title];
    viewController.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //2.添加带有子控制器的导航控制器到tabbarcontroller
    EXNavigationController *nav = [[EXNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:nav];
    
}


-(void)onClickMenuButton{
    NSLog(@"点击了左侧");
}

-(void)pushSearchViewController{
    NSLog(@"点击了右侧");
}

#pragma mark--实现EXTabBarDelegate
-(void)tabBarDidClickCreateBtn:(EXTabBar *)tabBar{
    UIViewController *createVc = [[UIViewController alloc] init];
    createVc.title = @"发布动弹";
    //    [self presentViewController:createVc animated:YES completion:nil];
    [self.navigationController pushViewController:createVc animated:YES];
}
@end
