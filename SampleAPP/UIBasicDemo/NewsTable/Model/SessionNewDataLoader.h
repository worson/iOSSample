//
//  SessionNewDataLoader.h
//  SampleAPP
//
//  Created by 王圣星 on 04/05/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class NewsListItem;
typedef void(^GTListLoaderFinishBlock)(BOOL success, NSArray<NewsListItem *> *dataArray);

@interface SessionNewDataLoader : NSObject

- (void) loadData;
- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock;
@end

NS_ASSUME_NONNULL_END
