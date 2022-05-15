//
//  NewsTableController.m
//  SampleAPP
//
//  Created by 王圣星 on 04/05/2022.
//

#import "NewsTableController.h"
#import "SampleWebViewController.h"
#import "SessionNewDataLoader.h"
#import "NewsDataLoader.h"
#import "NewsTableViewCell.h"

@interface NewsTableController() <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong, readwrite) NSArray *dataArray;
@property (nonatomic, strong, readwrite) SessionNewDataLoader *dataLoader;

@end

@implementation NewsTableController

- (instancetype)init{
    self= [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.tabBarItem.title = @"新闻2";
        self.tabBarItem.image =[UIImage imageNamed:@"icon.bundle/page@2x"];
        self.tabBarItem.selectedImage =[UIImage imageNamed:@"icon.bundle/page_selected@2x"];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView = tableView;
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    
    self.dataLoader = [[SessionNewDataLoader alloc] init];
//    [self.dataLoader loadData];

    __weak typeof(self)wself = self;
    [self.dataLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<NewsListItem *> * _Nonnull dataArray) {
        __strong typeof(wself) strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
    
}

//UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
//    todo add image
    return cell;
}

//UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController * vc = [[SampleWebViewController alloc]init];
    vc.title = [NSString stringWithFormat:@"item %@", @(indexPath.row)];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
