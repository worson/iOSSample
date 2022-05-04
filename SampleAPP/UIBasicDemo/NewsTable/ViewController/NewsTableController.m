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

@interface NewsTableController() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong, readwrite) NewsDataLoader *dataLoader;

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
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    
    self.dataLoader = [[NewsDataLoader alloc] init];
    [self.dataLoader loadData];
    
    
}

//UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"主标题 -- %@", @(indexPath.row)];
    cell.detailTextLabel.text = @"副标题";
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
