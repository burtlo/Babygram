//
//  MEXEvents.h
//  Babygram
//
//  Created by Franklin Webber on 10/14/13.
//  Copyright (c) 2013 Guacafy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MEXEvent.h"

@interface MEXEvents : NSObject

+ (void) save: (MEXEvent *) event;
+ (NSMutableArray *)all;

@end

