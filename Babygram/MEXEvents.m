//
//  MEXEvents.m
//  Babygram
//
//  Created by Franklin Webber on 10/14/13.
//  Copyright (c) 2013 Guacafy. All rights reserved.
//

#import "MEXEvents.h"

@interface MEXEvents ()

@end

@implementation MEXEvents

+ (NSMutableArray *)all {
    
    static NSMutableArray *allEvents;
    
    if (allEvents == nil) {
        allEvents = [[NSMutableArray alloc] init];
    }
    
    return allEvents;
}

+ (void) save: (MEXEvent *) event {
    NSLog(@"saving entry dated %@",event.babyDate);
    
    [[self all] addObject:event];
}

@end