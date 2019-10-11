//
//  MOMovie.h
//  assessment4
//
//  Created by Matthew O'Connor on 10/11/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOMovie : NSObject

@property (nonatomic,copy,readonly) NSString *title;
@property (nonatomic,copy,readonly) NSNumber *rating;
@property (nonatomic,copy,readonly, nullable) NSString *overview;

-(MOMovie *)initWithTitle:(NSString *)title
                   rating:(NSNumber *)rating
                 overview:(NSString *)overview;
@end

@interface MOMovie (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
