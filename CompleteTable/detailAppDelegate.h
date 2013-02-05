//
//  detailAppDelegate.h
//  CompleteTable
//
//  Created by Shreekant Pawar on 04/02/13.
//  Copyright (c) 2013 the1pawan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TableDataViewViewController;
@interface detailAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) TableDataViewViewController *tableView;
@end
