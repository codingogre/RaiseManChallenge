//
//  RMDocument.m
//  RaiseManChallenge
//
//  Created by Shawn Hooton on 2/19/14.
//  Copyright (c) 2014 Sixpanel LLC. All rights reserved.
//

#import "RMDocument.h"
#import "Person.h"

@implementation RMDocument

- (id)init
{
    self = [super init];
    if (self) {
        employees = [NSMutableArray array];
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"RMDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
    @throw exception;
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
    @throw exception;
    return YES;
}

- (IBAction)addEmp:(id)sender {
    Person *p = [[Person alloc] init];
    [employees addObject:p];
    NSLog(@"Added task '%@'", p);
    [_tableView reloadData];
    NSLog(@"Employee size: '%lu'", [employees count]);
}

- (IBAction)removeEmp:(id)sender
{
    NSIndexSet *rows = [_tableView selectedRowIndexes];
    // Is the selection empty?
    if ([rows count] == 0)
    {
        NSBeep();
        return;
    }
    [employees removeObjectsAtIndexes:rows];
    [_tableView reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tv
{
    NSUInteger numEmps = [employees count];
    NSLog(@"The count is %lu", (unsigned long)numEmps);
    return numEmps;
}

- (id)tableView:(NSTableView *)tv objectValueForTableColumn:(NSTableColumn *)tc row:(NSInteger)row
{
    NSString *id = [tc identifier];
    Person *p = [employees objectAtIndex:row];
    return [p valueForKey:id];
}

- (void)tableView:(NSTableView *)tv setObjectValue:(id)person forTableColumn:(NSTableColumn *)tc row:(NSInteger)row
{
    
    NSString *identifier = [tc identifier];
    Person *p = [employees objectAtIndex:row];
    [p setValue:person forKey:identifier];
}

- (void)tableView:(NSTableView *)tv sortDescriptorsDidChange:(NSArray *)od
{
    NSArray *nd = [tv sortDescriptors];
    [employees sortUsingDescriptors:nd];
    [tv reloadData];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    NSString *methodName = NSStringFromSelector(aSelector);
    NSLog(@"respondsToSelector:%@", methodName);
    return [super respondsToSelector:aSelector];
}
@end
