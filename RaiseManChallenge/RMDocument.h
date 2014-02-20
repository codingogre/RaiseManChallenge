//
//  RMDocument.h
//  RaiseManChallenge
//
//  Created by Shawn Hooton on 2/19/14.
//  Copyright (c) 2014 Sixpanel LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RMDocument : NSDocument
{
    NSMutableArray *employees;
}
- (IBAction)addEmp:(id)sender;
- (IBAction)removeEmp:(id)sender;
@property (weak) IBOutlet NSTableView *tableView;


@end
