//
//  TableDataViewViewController.h
//  CompleteTable
//
//  Created by Shreekant Pawar on 04/02/13.
//  Copyright (c) 2013 the1pawan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableDataViewViewController : UIViewController<UITableViewDataSource,UITabBarDelegate>
{

    NSMutableArray *langArray;
    __weak IBOutlet UITableView *dataTableView;

}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *deleteData;
- (IBAction)DeleteDataAction:(id)sender;
- (IBAction)AddLanguage:(id)sender;
- (void)refreshTableView;
@end
