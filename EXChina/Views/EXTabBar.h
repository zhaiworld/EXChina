//
//  EXTabBar.h
//  EXChina
//
//  Created by Chia on 16/9/12.
//  Copyright © 2016年 ZW. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EXTabBar;

@protocol EXTabBarDelegate <NSObject>
-(void)tabBarDidClickCreateBtn:(EXTabBar*)tabBar;
@end


@interface EXTabBar : UITabBar

@property(nonatomic , weak) id <EXTabBarDelegate> delegate;

@end
