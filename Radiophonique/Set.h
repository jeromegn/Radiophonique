//
//  Set.h
//  Radiophonique
//
//  Created by Jerome Gravel-Niquet on 11-12-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Set : NSObject {
    NSInteger *id;
    NSMutableArray *mixes;
}

@property (assign) NSInteger *id;
@property (assign) NSMutableArray *mixes;

@end
