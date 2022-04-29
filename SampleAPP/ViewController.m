//
//  ViewController.m
//  SampleAPP
//
//  Created by 王圣星 on 28/04/2022.
//

#import "ViewController.h"

@interface TestView:UIView

@end

@implementation TestView

- (instancetype)init {
    self = [super init];
    self.backgroundColor = [UIColor redColor];
    self.frame = CGRectMake(100, 100, 100, 100);
    NSLog(@"TestView#init");
    return self;
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    NSLog(@"TestView#willMoveToSuperview");
}
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
    NSLog(@"TestView#didMoveToSuperview");
}

- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow: newWindow];
    NSLog(@"TestView#willMoveToWindow");
}
- (void)didMoveToWindow{
    [super didMoveToWindow];
    NSLog(@"TestView#didMoveToWindow");
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (instancetype) init {
    NSLog(@"ViewController#init");
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"ViewController#viewWillAppear");
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"ViewController#viewDidAppear");
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"ViewController#viewWillDisappear");
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear: animated];
    NSLog(@"ViewController#viewDidDisappear");
}



- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ViewController#viewDidLoad");
    // Do any additional setup after loading the view.
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor greenColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:view];
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    [view addGestureRecognizer: tapGesture];
    
}

- (void) pushController{
    
    UIViewController * vc = [[UIViewController alloc]init];
    vc.title = @"标题";
    
    // todo 未生效
    vc.navigationItem.rightBarButtonItem.title= [[UIBarButtonItem alloc]initWithTitle:@"分享" menu:nil];
    
    [self.navigationController pushViewController: vc animated:NO];
}


@end
