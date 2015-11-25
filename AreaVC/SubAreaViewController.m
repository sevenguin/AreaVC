//
//  SubAreaViewController.m
//  AreaVC
//
//  Created by sevenguin on 15/11/25.
//  Copyright © 2015年 weill. All rights reserved.
//

#import "SubAreaViewController.h"

@interface SubAreaViewController (){
    NSArray *showAreas;
    BOOL showAccessory;
}

@end

@implementation SubAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    if([self.subArea isKindOfClass:[NSDictionary class]]){
        showAreas = [(NSDictionary*)self.subArea allKeys];
        showAccessory = YES;
    }else if([self.subArea isKindOfClass:[NSArray class]]){
        showAreas = (NSArray*)self.subArea;
        showAccessory = NO;
    }else{
        showAreas = @[];
        showAccessory = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [showAreas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* text = showAreas[indexPath.row];
    AreaTableViewCell *cell = [[AreaTableViewCell alloc] initWithText:text];
    [cell doEntry:showAccessory];
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"全部";
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(showAccessory){
        AreaTableViewCell* cell = (AreaTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
        NSObject* subs = [self.subArea valueForKey:cell.textLabel.text];
        SubAreaViewController* subArea = [[SubAreaViewController alloc] init];
        subArea.subArea = subs;
        subArea.target = self.target;
        [self.navigationController pushViewController:subArea animated:YES];
    }else{
        [self.navigationController popToViewController:self.target animated:YES];
    }
}

@end
