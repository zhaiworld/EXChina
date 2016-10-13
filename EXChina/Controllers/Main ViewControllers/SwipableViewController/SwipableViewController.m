//
//  SwipableViewController.m
//  EXChina
//
//  Created by Chia on 16/9/21.
//  Copyright © 2016年 ZW. All rights reserved.
//

#import "SwipableViewController.h"

@interface SwipableViewController ()

@end

@implementation SwipableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar-sidebar"]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(onClickMenuButton)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                           target:self
                                                                                           action:@selector(pushSearchViewController)];
}

-(instancetype)initWithTitle:(NSString*)title subTitles:(NSArray*)subTitles controllers:(NSArray*)controllers{
    self = [super init];
    if (self) {
        if (title) {
            //界面不向导航栏扩展
            self.edgesForExtendedLayout = UIRectEdgeNone;
            self.title = title;
            
            CGFloat titleBarHeight = 36;
            _titleBar = [[TitleBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, titleBarHeight) andTitles:subTitles];
            _titleBar.backgroundColor = [UIColor clearColor];
            [self.view addSubview:_titleBar];
            
            CGFloat height = self.view.bounds.size.height - titleBarHeight - 64;
            _viewPager = [[HorizonalTableViewController alloc] initWithViewControllers:controllers];
            _viewPager.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, height);
            [self addChildViewController:self.viewPager];
            [self.view addSubview:_viewPager.view];
        }
    }
    return self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onClickMenuButton{
    NSLog(@"点击了左侧");
}

-(void)pushSearchViewController{
    NSLog(@"点击了右侧");
}

@end
