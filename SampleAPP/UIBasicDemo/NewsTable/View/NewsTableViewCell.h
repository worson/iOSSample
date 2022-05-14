//
//  NewsTableViewCell.h
//  SampleAPP
//
//  Created by 王圣星 on 14/05/2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class NewsListItem;

/**
 点击删除按钮
 */
@protocol NewsTableViewCellDelegate <NSObject>
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;
@end

@interface NewsTableViewCell : UITableViewCell
@property (nonatomic, weak, readwrite) id<NewsTableViewCellDelegate> delegate;

- (void)layoutTableViewCellWithItem:(NewsListItem *)item;

@end

NS_ASSUME_NONNULL_END
