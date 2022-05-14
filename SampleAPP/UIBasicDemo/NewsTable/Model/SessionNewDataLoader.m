//
//  SessionNewDataLoader.m
//  SampleAPP
//
//  Created by 王圣星 on 04/05/2022.
//

#import "SessionNewDataLoader.h"
#import "NewsListItem.h"

@implementation SessionNewDataLoader

- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock{
    NSLog(@"loadListDataWithFinishBlock#init");
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession * session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask * task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError * jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSArray *dataArray =  [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            NewsListItem *listItem = [[NewsListItem alloc] init];
          [listItem configWithDictionary:info];
          [listItemArray addObject:listItem];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
         if (finishBlock) {
             finishBlock(error == nil, listItemArray.copy);
         }
        });
        
        NSLog(@"loadListDataWithFinishBlock");
    }];
    [task resume];
    NSLog(@"loadListDataWithFinishBlock#resume");
}
- (void) loadData{
    NSLog(@"loadListDataWithFinishBlock#init");
    
    NSLog(@"loadListDataWithFinishBlock#resume");
}

@end
