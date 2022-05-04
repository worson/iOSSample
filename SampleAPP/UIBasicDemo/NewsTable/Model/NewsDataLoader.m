//
//  NewsDataLoader.m
//  SampleAPP
//
//  Created by 王圣星 on 04/05/2022.
//

#import "NewsDataLoader.h"
#import <AFNetworking.h>

@implementation NewsDataLoader
- (void) loadData{
    NSLog(@"loadData#init");
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[AFHTTPSessionManager manager] GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"loadData#progress");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"loadData#success");
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"loadData#failure");
        }];
    NSLog(@"loadData#resume");
}
@end
