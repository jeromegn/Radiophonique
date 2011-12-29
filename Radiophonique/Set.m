//
//  Set.m
//  Radiophonique
//
//  Created by Jerome Gravel-Niquet on 11-12-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Set.h"

@implementation Set

- (id)init
{
    self = [super init];
    if (self) {
        self.mixes = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@synthesize mixes;
@synthesize id;

@end
