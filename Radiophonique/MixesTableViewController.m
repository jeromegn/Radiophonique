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

@implementation MixesTableViewController

#pragma mark - Life Cycle
- (id)init
{
    self = [super init];
    if (self) {
        mixes = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void) dealloc {
    [mixes release];
    [super dealloc];
}

#pragma mark - User Actions
- (IBAction)add:(id)sender {
    fetcher = [[JSONFetcher alloc]
               initWithURLString:@"http://8tracks.com/mixes?format=json&sort=popular&api_key=87c41cb65d45b260f5da4eeebd7a7bb2c9d2effc"
               receiver:self
               action:@selector(receiveResponse:)];
    [fetcher start];
}

- (void)receiveResponse:(JSONFetcher *)aFetcher
{
    NSAssert(aFetcher == fetcher,
             @"In this example, aFetcher is always the same as the fetcher ivar we set above");
    if ([fetcher.data length] > 0) {
        [mixes addObjectsFromArray:[fetcher.result objectForKey:@"mixes"]];
        [tableView reloadData];
    }
    [fetcher release];
    fetcher = nil;
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
    return [mixes count];
}

#pragma mark Delegate
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    MixView *mixView    = [[MixView alloc] initWithFrame:CGRectMake(10, 2, 100, 30)];
    Mix *mix = [mixes objectAtIndex:row];
    [mixView setMix:mix];
    
    /*[mixView.name insertText:[mix objectForKey:@"name"]];
    
    NSString *imageUrlString = [[mix objectForKey:@"cover_urls"] objectForKey:@"sq100"];
    NSURL *imageUrl = [[NSURL alloc] initWithString:imageUrlString];
    NSImage *image = [[NSImage alloc] initWithContentsOfURL:imageUrl];
    
    [mixView.image setImage:image];*/
    
    return mixView;
}

@end
