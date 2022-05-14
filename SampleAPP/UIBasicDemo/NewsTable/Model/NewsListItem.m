//
//  NewsListItem.m
//  SampleAPP
//
//  Created by 王圣星 on 04/05/2022.
//

#import "NewsListItem.h"

@implementation NewsListItem

#pragma mark - public method
- (void)configWithDictionary:(NSDictionary *)dictionary{
#warning 注意类型是否匹配
    self.category = [dictionary objectForKey:@"category"];
}
@end
