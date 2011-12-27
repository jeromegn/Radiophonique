//
//  Mix.m
//  Radiophonique
//
//  Created by Jerome Gravel-Niquet on 11-12-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Mix.h"

@implementation Mix

@synthesize name;

- (id)init
{
    self = [super init];
    if (self) {
        name = @"Test mix";
        NSLog(@"%@", [self name]);
    }
    
    return self;
}

@end
