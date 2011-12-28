//
//  MixesTableViewController.h
//  Radiophonique
//
//  Created by Jerome Gravel-Niquet on 11-12-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSONFetcher;
@class MixViewController;

@interface MixesTableViewController : NSObject <NSTableViewDataSource> {
@private
    IBOutlet NSTableView *tableView;
    NSMutableArray *mixes;
    JSONFetcher *fetcher;
}

-(IBAction)add:(id)sender;
-(void)receiveResponse:(JSONFetcher *)aFetcher;

@end
