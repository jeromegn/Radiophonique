//
//  RadiophoniqueAppDelegate.m
//  Radiophonique
//
//  Created by Jerome Gravel-Niquet on 11-12-24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RadiophoniqueAppDelegate.h"
#import "AppController.h"

@implementation RadiophoniqueAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    appController = [[AppController alloc] init];
}

@end
