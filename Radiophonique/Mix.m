//
//  Mix.m
//  Radiophonique
//
//  Created by Jerome Gravel-Niquet on 11-12-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Mix.h"
#import "AudioStreamer.h"
#import "JSONFetcher.h"

@implementation Mix

@synthesize name;
@synthesize image;
@synthesize id;
@synthesize set;

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

+ (Mix *)mixWithDict:(NSDictionary *)dict andSet:(Set *)set
{
    Mix *mix = [[[Mix alloc] init] autorelease];
    
    mix.set = set;
    mix.id = [dict objectForKey:@"id"];
    mix.name = [dict objectForKey:@"name"];
    
    NSString *imageUrlString = [[dict objectForKey:@"cover_urls"] objectForKey:@"sq100"];
    NSURL *imageUrl = [[NSURL alloc] initWithString:imageUrlString];
    mix.image = [[NSImage alloc] initWithContentsOfURL:imageUrl];
    
    return mix;
}

- (void)play
{
    NSLog(@"Play called");
    NSString *playUrl = [NSString stringWithFormat:@"http://8tracks.com/sets/%@/play?mix_id=%@&format=json&sort=popular&api_key=87c41cb65d45b260f5da4eeebd7a7bb2c9d2effc", [self.set id], self.id];
    NSLog(playUrl);
    fetcher = [[JSONFetcher alloc]
               initWithURLString: playUrl
               receiver:self
               action:@selector(receivePlayResponse:)];
    [fetcher start];
}

- (void)receivePlayResponse:(JSONFetcher *)aFetcher
{
    NSLog(@"Response received: %@", [[[fetcher.result objectForKey:@"set"] objectForKey:@"track"] objectForKey:@"url"]);
    NSAssert(aFetcher == fetcher,
             @"In this example, aFetcher is always the same as the fetcher ivar we set above");
    if ([fetcher.data length] > 0) {
        NSURL *url = [NSURL URLWithString:[fetcher.result objectForKey:@"set.track.url"]];
        streamer = [[AudioStreamer alloc] initWithURL:url];
        //[streamer start];
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(playbackStateChanged:)
         name:ASStatusChangedNotification
         object:streamer];
        [streamer start];
    }
    [fetcher release];
    fetcher = nil;
}

//
// playbackStateChanged:
//
// Invoked when the AudioStreamer
// reports that its playback status has changed.
//
- (void)playbackStateChanged:(NSNotification *)aNotification
{
    NSLog(@"Stream playback state changed");
	if ([streamer isWaiting])
	{
		//[self setButtonImage:[NSImage imageNamed:@"loadingbutton"]];
	}
	else if ([streamer isPlaying])
	{
		//[self setButtonImage:[NSImage imageNamed:@"stopbutton"]];
	}
	else if ([streamer isIdle])
	{
		//[self destroyStreamer];
		//[self setButtonImage:[NSImage imageNamed:@"playbutton"]];
	}
}


@end
