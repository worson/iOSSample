//
//  SessionNewDataLoader.m
//  SampleAPP
//
//  Created by 王圣星 on 04/05/2022.
//

#import "SessionNewDataLoader.h"

@implementation SessionNewDataLoader

- (void) loadData{
    NSLog(@"loadData#init");
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession * session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask * task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"loadData");
    }];
    [task resume];
    NSLog(@"loadData#resume");
}
@end
