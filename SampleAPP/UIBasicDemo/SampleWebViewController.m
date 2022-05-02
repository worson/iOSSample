//
//  SampleWebViewController.m
//  SampleAPP
//
//  Created by 王圣星 on 02/05/2022.
//

#import "SampleWebViewController.h"
#import <WebKit/WebKit.h>

@interface SampleWebViewController () <WKNavigationDelegate>

@property(nonatomic,strong,readwrite) WKWebView* webview;

@end

@implementation SampleWebViewController

- (void)dealloc{
    [self.webview removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webview = [[WKWebView alloc] initWithFrame:self.view.frame];
    self.webview.navigationDelegate=self;
    [self.webview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.view addSubview:self.webview];
    
    [self.webview loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:@"https://www.baidu.com/"]]];
    
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
    NSLog([NSString stringWithFormat:@"observeValueForKeyPath: %@", @(self.webview.estimatedProgress)]);
}

@end
