//
//  ViewController.h
//  AreaVC
//
//  Created by sevenguin on 15/11/24.
//  Copyright © 2015年 weill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AreaDataProc.h"
#import "AreaTableViewCell.h"
#import "SubAreaViewController.h"

@interface RootAreaViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic)UIViewController *target;
@property (nonatomic)SEL choose;

@end

