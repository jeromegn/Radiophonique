//
//  MixView.m
//  Radiophonique
//
//  Created by Jerome Gravel-Niquet on 11-12-27.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MixView.h"

@implementation MixView
#pragma mark - Life Cycle

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image  = [[[NSImageView alloc] initWithFrame:(NSRect){20,20,100,100}] autorelease];
        
        self.name   = [[[NSTextView alloc] initWithFrame:(NSRect) {140, 40, 100, 40}] autorelease];
        
        [self addSubview:self.name];
        [self addSubview:self.image];
    }
    
    return self;
}

- (void)dealloc {
    self.image  = nil;
    self.name   = nil;
    
    [super dealloc];
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
}


#pragma mark - Synthesizers
@synthesize image;
@synthesize name;
@end
