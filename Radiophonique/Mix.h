//
//  Mix.h
//  Radiophonique
//
//  Created by Jerome Gravel-Niquet on 11-12-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AudioStreamer;
@class JSONFetcher;
@class Set;

@interface Mix : NSObject {
    NSString *name;
    NSImage *image;
    AudioStreamer *streamer;
    JSONFetcher *fetcher;
    Set *set;
}

@property (copy) NSString *name;
@property (assign) NSImage *image;
@property (assign) NSInteger *id;
@property (assign) Set *set;

- (void)play;
+ (Mix *)mixWithDict:(NSDictionary *)dict andSet:(Set *)set;

@end
