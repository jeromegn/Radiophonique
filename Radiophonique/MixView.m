//
//  MixView.m
//  Radiophonique
//
//  Created by Jerome Gravel-Niquet on 11-12-27.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MixView.h"
#import "Mix.h"

@implementation MixView
#pragma mark - Life Cycle

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image  = [[[NSImageView alloc] initWithFrame:(NSRect){20,20,100,100}] autorelease];
        
        self.name   = [[[NSTextView alloc] initWithFrame:(NSRect) {140, 40, 330, 40}] autorelease];
        
        [self addSubview:self.name];
        [self addSubview:self.image];
    }
    
    return self;
}

- (void)setMix:(Mix *)mix
{
    self.mix = [mix retain];

    [self.name insertText:[mix objectForKey:@"name"]];
    
    NSString *imageUrlString = [[mix objectForKey:@"cover_urls"] objectForKey:@"sq100"];
    NSURL *imageUrl = [[NSURL alloc] initWithString:imageUrlString];
    NSImage *image = [[NSImage alloc] initWithContentsOfURL:imageUrl];
    
    [self.image setImage:image];
    
}

- (void)dealloc {
    self.image  = nil;
    self.name   = nil;
    self.mix    = nil;
    
    [super dealloc];
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
}


#pragma mark - Synthesizers
@synthesize image;
@synthesize name;
@synthesize mix;
@end
