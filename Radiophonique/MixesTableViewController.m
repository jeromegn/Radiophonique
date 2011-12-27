//
//  MixesTableViewController.m
//  Radiophonique
//
//  Created by Jerome Gravel-Niquet on 11-12-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MixesTableViewController.h"
#import "Mix.h"

@implementation MixesTableViewController

#pragma mark - Life Cycle
- (id)init
{
    self = [super init];
    if (self) {
        list = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void) dealloc {
    [list release];
    [super dealloc];
}

#pragma mark - User Actions
- (IBAction)add:(id)sender {
    [list addObject:[[Mix alloc] init]];
    [tableView reloadData];
}


#pragma mark - NSTableView
#pragma mark Datasource
//- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
//    Mix *mix = [list objectAtIndex:row];
//    NSString *identifier = [tableColumn identifier];
//    NSLog(@"%@", [mix valueForKey:identifier]);
//    return [mix valueForKey:identifier];
//}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [list count];
}

#pragma mark Delegate
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSText *text = [[[NSText alloc] initWithFrame:CGRectMake(10, 2, 100, 30)] autorelease];
    text.string = [[list objectAtIndex:row] name];
    return text;
}

@end
