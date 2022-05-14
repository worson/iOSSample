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
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.uniqueKey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
}
@end
