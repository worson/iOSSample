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
    
    NSArray<NewsListItem *> *listdata = [self _readDataFromLocal];
    if (finishBlock) {
        finishBlock(YES, listdata);
    }
    
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession * session = [NSURLSession sharedSession];
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask * task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSError * jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSArray *dataArray =  [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            NewsListItem *listItem = [[NewsListItem alloc] init];
          [listItem configWithDictionary:info];
          [listItemArray addObject:listItem];
        }
        [strongSelf _archiveListDataWithArray:listItemArray.copy];
        dispatch_async(dispatch_get_main_queue(), ^{
         if (finishBlock) {
             finishBlock(error == nil, listItemArray.copy);
         }
        });
        
        NSLog(@"loadListDataWithFinishBlock");
    }];
//    [task resume];
    NSLog(@"loadListDataWithFinishBlock#resume");
}
- (void)_archiveListDataWithArray:(NSArray<NewsListItem *> *)array{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];

    NSFileManager *fileManager = [NSFileManager defaultManager];

    //创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"NewsInfo"];
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
//    listData=[@"abc" dataUsingEncoding:NSUTF8StringEncoding];
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:nil];
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    NSLog(@"_archiveListDataWithArray, listDataPath=%@",listDataPath);
}
- (NSArray<NewsListItem *> *)_readDataFromLocal{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"NewsInfo/list"];
    
    NSLog(@"_readDataFromLocal, listDataPath=%@",listDataPath);
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    if([fileManager fileExistsAtPath:listDataPath]){
        NSData *readListData = [fileManager contentsAtPath:listDataPath];
        id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[NewsListItem class], nil]  fromData:readListData error:nil];
        if ([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0) {
            NSLog(@"_readDataFromLocal, data size = %d",[unarchiveObj count]);
            return (NSArray<NewsListItem *> *)unarchiveObj;
        }
    }
    NSLog(@"_readDataFromLocal, data is nil");
    
    return nil;
}

- (void) loadData{
    NSLog(@"loadListDataWithFinishBlock#init");
    
    NSLog(@"loadListDataWithFinishBlock#resume");
}

@end
