//
//  MEXEvent.h
//  Babygram
//
//  Created by Franklin Webber on 10/14/13.
//  Copyright (c) 2013 Guacafy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEXEvent : NSObject

+ (id)create:(NSDictionary *)dictionary;

@property (strong, nonatomic) UIImage *babyImage;
@property (strong, nonatomic) NSString *babyDescription;
@property (strong, nonatomic) NSDate *babyDate;

@end
