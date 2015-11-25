//
//  AreaTableViewCell.h
//  AreaVC
//
//  Created by sevenguin on 15/11/25.
//  Copyright © 2015年 weill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AreaTableViewCell : UITableViewCell

-(instancetype)initWithText:(NSString*)text;
-(void)doEntry:(BOOL)showAccessory;

@end
