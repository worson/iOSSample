//
//  GTSplashView.m
//  SampleAPP
//
//  Created by 王圣星 on 30/04/2022.
//

#import "GTSplashView.h"
#import "GTScreen.h"


@interface GTSplashView ()
@property(nonatomic, strong, readwrite)UIButton *button;
@end

@implementation GTSplashView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"icon.bundle/splash.png"];
        [self addSubview:({
            _button = [[UIButton alloc] initWithFrame:UIRect(330, 100, 60, 40)];
            _button.backgroundColor = [UIColor lightGrayColor];
            [_button setTitle:@"跳过" forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(_removeSplashView) forControlEvents:UIControlEventTouchUpInside];
            _button;
        })];
        self.userInteractionEnabled = YES;
    }
    return self;
}

#pragma mark -

- (void)_removeSplashView{
    [self removeFromSuperview];
}

@end
