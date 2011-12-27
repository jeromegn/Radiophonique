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

- (id)init
{
    self = [super init];
    if (self) {
        list = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    Mix *mix = [list objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
    NSLog(@"%@", [mix valueForKey:identifier]);
    return [mix valueForKey:identifier];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [list count];
}

- (IBAction)add:(id)sender {
    [list addObject:[[Mix alloc] init]];
    [tableView reloadData];
}

- (void) dealloc {
    [super dealloc];
}

@end
