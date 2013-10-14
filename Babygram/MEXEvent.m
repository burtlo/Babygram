//
//  MEXEvent.m
//  Babygram
//
//  Created by Franklin Webber on 10/14/13.
//  Copyright (c) 2013 Guacafy. All rights reserved.
//

#import "MEXEvent.h"

@interface MEXEvent ()

@end

@implementation MEXEvent

+ (id)create:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    
    if (self) {
        // Let's do work
        // unpack the dictionary and assign all the values to our properties
//        [self setBabyImageURL:[dictionary objectForKey:@"image"]];
        self.babyImageURL = [dictionary objectForKey:@"image"];
        self.babyDescription = [dictionary objectForKey:@"description"];
        self.babyDate = [dictionary objectForKey:@"created_at"];
    }
    
    return self;
}


@end
