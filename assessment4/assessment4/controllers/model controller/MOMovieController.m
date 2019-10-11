//
//  MOMovieController.m
//  assessment4
//
//  Created by Matthew O'Connor on 10/11/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import "MOMovieController.h"

static NSString * const kBaseURLString = @"https://api.themoviedb.org/3/search/";
static NSString * const kURLComponent = @"movie";
static NSString * const kAPIKey = @"api_key";
static NSString * const kKeyKey = @"4a40c8425d1279ead340f563465c0a7c";
static NSString * const kQueryItem = @"query";


@implementation MOMovieController
+ (void)fetchMovieTitle:(NSString *)searchText
             completion:(void (^)(NSArray<MOMovie *> * _Nonnull))completion
{
    NSURL * baseURL = [NSURL URLWithString:kBaseURLString];
    NSURL * movieURL = [baseURL URLByAppendingPathComponent:kURLComponent];
    NSURLQueryItem * firstQuery = [[NSURLQueryItem alloc] initWithName:kAPIKey value:kKeyKey];
    NSURLQueryItem * secondQuery = [[NSURLQueryItem alloc] initWithName:kQueryItem value:searchText];
    NSURLComponents * urlComponents = [NSURLComponents componentsWithURL:movieURL resolvingAgainstBaseURL:true];
    urlComponents.queryItems = @[firstQuery,secondQuery];
    NSURL * finalURL = urlComponents.URL;
    
    NSLog(@"%@",finalURL);
    
    [[[NSURLSession sharedSession]dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"error retrieving data %@", [error localizedDescription]);
            return;
        }
        if (response)
        {
            NSLog(@"%@",response);
        }
        if (data)
        {
            NSDictionary * TopLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error][@"results"];
            if (TopLevelDictionary == nil)
            {
                NSLog(@"dictionary failed %@", error);
                return;
            }
            NSMutableArray * movieArray = [NSMutableArray new];
            for (NSDictionary * movieDictionary in TopLevelDictionary)
            {
                MOMovie * movie  = [[MOMovie alloc]initWithDictionary:movieDictionary];
                [movieArray addObject:movie];
            }
            completion(movieArray);
        }
    }]resume];
}

@end
