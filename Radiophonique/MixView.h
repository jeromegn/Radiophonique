//
//  MixView.h
//  Radiophonique
//
//  Created by Jerome Gravel-Niquet on 11-12-27.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Mix;

@interface MixView : NSView

@property (retain) NSImageView *image;
@property (retain) NSTextView *name;

@property (assign, nonatomic) Mix *mix;

- (void)setMix:(Mix *)mix;

@end
