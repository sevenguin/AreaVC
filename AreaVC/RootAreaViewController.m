//
//  ViewController.m
//  AreaVC
//
//  Created by sevenguin on 15/11/24.
//  Copyright © 2015年 weill. All rights reserved.
//

#import "RootAreaViewController.h"

@interface RootAreaViewController (){
    NSArray* headers;
    NSMutableArray *sections;
    AreaDataProc *proc;
}
@end

@implementation RootAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择区域";
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height * 2);
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    if(self.target == nil){
        self.target = self;
    }
    
    headers = @[@[@"定位的位置", @"全部"], @[[[NSNumber alloc] initWithDouble:50], [[NSNumber alloc] initWithDouble:30]]];
    proc = [[AreaDataProc alloc] init];
    [proc loadFromFile];
    
    for(NSString* key in proc.area.allKeys){
        NSLog(@"key:%@", key);
    }
    
    sections = [[NSMutableArray alloc] init];
    
    AreaTableViewCell *cell_one = [[AreaTableViewCell alloc] initWithText:@"中国"];
    [sections addObject:@[cell_one]];
    
    NSMutableArray *cell_two = [[NSMutableArray alloc] init];
    for(NSString *key in proc.area.allKeys){
        AreaTableViewCell *cell = [[AreaTableViewCell alloc] initWithText:key];
        [cell_two addObject:cell];
    }
    [sections addObject:cell_two];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AreaTableViewCell* cell = sections[indexPath.section][indexPath.row];
    NSDictionary* cities = proc.area[cell.textLabel.text];
    SubAreaViewController* subArea = [[SubAreaViewController alloc] init];
    subArea.subArea = cities;
    subArea.target = self.target;
    [self.navigationController pushViewController:subArea animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [sections[section] count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return sections.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AreaTableViewCell *cell = sections[indexPath.section][indexPath.row];
    BOOL showAcc = NO;
    if(indexPath.section == 1){
        showAcc = YES;
    }
    [cell doEntry:showAcc];
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return headers[0][section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSNumber *height = headers[1][section];
    return [height doubleValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
