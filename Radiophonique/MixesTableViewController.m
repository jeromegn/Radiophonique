//
//  MixesTableViewController.m
//  Radiophonique
//
//  Created by Jerome Gravel-Niquet on 11-12-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MixesTableViewController.h"
#import "Mix.h"
#import "JSONFetcher.h"
#import "MixView.h"
#import "Set.h"

@implementation MixesTableViewController

#pragma mark - Life Cycle
- (id)init
{
    self = [super init];
    if (self) {
        set = [[Set alloc] init];
    }
    
    return self;
}

- (void) dealloc {
    [set release];
    [super dealloc];
}

#pragma mark - User Actions
- (IBAction)add:(id)sender {
    fetcher = [[JSONFetcher alloc]
               initWithURLString:@"http://8tracks.com/mixes?format=json&sort=popular&api_key=87c41cb65d45b260f5da4eeebd7a7bb2c9d2effc"
               receiver:self
               action:@selector(createSetWithResponse:)];
    [fetcher start];
}

- (void)createSetWithResponse:(JSONFetcher *)aFetcher
{
    NSAssert(aFetcher == fetcher,
             @"In this example, aFetcher is always the same as the fetcher ivar we set above");
    if ([fetcher.data length] > 0) {
        set.id = [fetcher.result objectForKey:@"id"];
        NSArray *arr = [fetcher.result objectForKey:@"mixes"];
        NSInteger count = [arr count];
        NSInteger i = 0;
        for (i = 0; i < count; i++) {
            Mix *mix = [Mix mixWithDict:[arr objectAtIndex:i] andSet:set];
            [set.mixes addObject:mix];
        }
        [tableView reloadData];
    }
    [fetcher release];
    fetcher = nil;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [set.mixes count];
}

#pragma mark Delegate
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    MixView *mixView    = [[MixView alloc] initWithFrame:CGRectMake(10, 2, 100, 30)];
    Mix *mix            = [set.mixes objectAtIndex:row];
    NSLog(@"%@", mix);
    mixView.mix         = mix;
    
    return mixView;
}

@end
