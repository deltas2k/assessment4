//
//  MOMovieController.h
//  assessment4
//
//  Created by Matthew O'Connor on 10/11/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MOMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface MOMovieController : NSObject

+(void)fetchMovieTitle:(NSString *)searchText
            completion:(void(^)(NSArray<MOMovie *> *))completion;

@end

NS_ASSUME_NONNULL_END
