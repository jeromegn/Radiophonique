//
//  AppController.m
//  Radiophonique
//
//  Created by Jerome Gravel-Niquet on 11-12-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"
#import "MainViewController.h"

@implementation AppController

- (id)init
{
    self = [super init];
    if (self) {
        if (!mainViewController) {
            mainViewController = [[MainViewController alloc] init];
        }
        [mainViewController showWindow:self];
    }
    
    return self;
}

- (void)dealloc
{
    [mainViewController release];
    [super dealloc];
}

@end
