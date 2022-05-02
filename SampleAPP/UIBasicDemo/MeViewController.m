//
//  MeViewController.m
//  SampleAPP
//
//  Created by 王圣星 on 02/05/2022.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (instancetype)init{
    self= [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image =[UIImage imageNamed:@"icon.bundle/like@2x"];
        self.tabBarItem.selectedImage =[UIImage imageNamed:@"icon.bundle/like_selected@2x"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(100,100,100,100)];
    [bt setTitle:@"title" forState: UIControlStateNormal];
    [bt setBackgroundColor:[UIColor grayColor]];
    [bt addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
}

- (void)clickButton{
    NSLog(@"clickButton");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
