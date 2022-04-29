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
    NSLog(@"init");
    return self;
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    NSLog(@"willMoveToSuperview");
}
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
    NSLog(@"didMoveToSuperview");
}

- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow: newWindow];
    NSLog(@"willMoveToWindow");
}
- (void)didMoveToWindow{
    [super didMoveToWindow];
    NSLog(@"didMoveToWindow");
}

@end

@interface ViewController ()

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *view = [[TestView alloc] init];
    
    
    [self.view addSubview:view];
    
}


@end
