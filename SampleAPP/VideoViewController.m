//
//  VideoViewController.m
//  SampleAPP
//
//  Created by 王圣星 on 29/04/2022.
//

#import "VideoViewController.h"

@interface VideoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation VideoViewController

- (instancetype)init{
    self= [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image =[UIImage imageNamed:@"icon.bundle/video@2x"];
        self.tabBarItem.selectedImage =[UIImage imageNamed:@"icon.bundle/video@2x"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing=40;
    layout.minimumInteritemSpacing=4;
    layout.itemSize = CGSizeMake((self.view.frame.size.width-10)/2, 100);
    
    UICollectionView *view = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    view.delegate = self;
    view.dataSource = self;
    [view registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
//    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
}

//UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 200;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

@end
