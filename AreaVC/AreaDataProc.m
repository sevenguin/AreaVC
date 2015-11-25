//
//  AreaDataProc.m
//  AreaVC
//
//  Created by sevenguin on 15/11/24.
//  Copyright © 2015年 weill. All rights reserved.
//

#import "AreaDataProc.h"

@implementation AreaDataProc

-(void)loadFromFile{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cities" ofType:@"plist"];
    NSLog(@"filePath:%@", filePath);
    self.area  = [[NSDictionary alloc] initWithContentsOfFile:filePath];
}

@end
