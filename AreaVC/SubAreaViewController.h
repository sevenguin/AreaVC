//
//  SubAreaViewController.h
//  AreaVC
//
//  Created by sevenguin on 15/11/25.
//  Copyright © 2015年 weill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AreaTableViewCell.h"

@interface SubAreaViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic)NSObject *subArea;
@property (nonatomic)UIViewController *target;

@end
