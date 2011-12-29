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
@class Set;

@interface MixesTableViewController : NSObject <NSTableViewDataSource> {
@private
    IBOutlet NSTableView *tableView;
    Set *set;
    JSONFetcher *fetcher;
}

-(IBAction)add:(id)sender;
-(void)createSetWithResponse:(JSONFetcher *)aFetcher;

@end
