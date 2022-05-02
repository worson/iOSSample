//
//  SampleWebViewController.m
//  SampleAPP
//
//  Created by 王圣星 on 02/05/2022.
//

#import "SampleWebViewController.h"
#import <WebKit/WebKit.h>
#import "GTScreen.h"

@interface SampleWebViewController () <WKNavigationDelegate>

@property(nonatomic,strong,readwrite) WKWebView* webView;
@property(nonatomic,strong,readwrite) UIProgressView* progressView;

@end

@implementation SampleWebViewController

- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    CGFloat progressHeight = 88;
//    CGFloat toolBarHeight=0;
    
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 88)];
        self.progressView;
    })];
    
    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88)];
        self.webView.navigationDelegate=self;
        [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        self.webView;
    })];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:@"https://www.baidu.com/"]]];
    
}
# pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"didFinishNavigation");
}
# pragma mark - Obsereve
- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{
    NSLog(@"%@", [NSString stringWithFormat:@"observeValueForKeyPath: %@", @(self.webView.estimatedProgress)]);
    self.progressView.progress = self.webView.estimatedProgress;
}

@end
