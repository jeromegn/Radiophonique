//
//  Mix.h
//  Radiophonique
//
//  Created by Jerome Gravel-Niquet on 11-12-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AudioStreamer;

@interface Mix : NSObject {
    NSString *name;
    NSImage *image;
}

@property (copy) NSString *name;
@property (assign) NSImage *image;

- (void)play;

@end
