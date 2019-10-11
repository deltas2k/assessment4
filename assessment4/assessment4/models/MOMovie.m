//
//  MOMovie.m
//  assessment4
//
//  Created by Matthew O'Connor on 10/11/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import "MOMovie.h"

static NSString * const kTitle = @"title";
static NSString * const kRating = @"vote_average";
static NSString * const kOverview = @"overview";

@implementation MOMovie

- (MOMovie *)initWithTitle:(NSString *)title
                    rating:(NSNumber *)rating
                  overview:(NSString *)overview
{
    self = [super init];
    if (self)
    {
        _title = title;
        _rating = rating;
        _overview = overview;
    }
    return self;
}

@end

@implementation MOMovie (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *title = dictionary[kTitle];
    NSNumber *rating = dictionary[kRating];
    NSString *overview = dictionary[kOverview];
    
    return [self initWithTitle:title rating:rating overview:overview];
}

@end

