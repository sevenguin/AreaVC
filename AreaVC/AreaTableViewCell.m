//
//  AreaTableViewCell.m
//  AreaVC
//
//  Created by sevenguin on 15/11/25.
//  Copyright © 2015年 weill. All rights reserved.
//

#import "AreaTableViewCell.h"
@interface AreaTableViewCell()
@property (nonatomic) NSString* text;
@end

@implementation AreaTableViewCell

-(instancetype)initWithText:(NSString*)text{
    self = [super init];
    self.text = text;
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)doEntry:(BOOL)showAccessory{
    [self.textLabel setText:self.text];
    [self.textLabel setTextColor:[UIColor darkTextColor]];
    if(showAccessory){
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
}

@end
