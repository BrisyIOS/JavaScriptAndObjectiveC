//
//  ViewController.m
//  iOS与JavaScript之间的交互
//
//  Created by zhangxu on 16/3/21.
//  Copyright © 2016年 zhangxu. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,strong) JSContext *jsContext;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化JavaScript环境
    self.jsContext = [[JSContext alloc] init];
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    
    // 加载HTML
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"html"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:0 timeoutInterval:10];
    [self.webView loadRequest:request];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    // 在此处可以拦截发送的请求。或者JS的传过来的方法名
    NSLog(@"%@",request.URL.absoluteString);
    return YES;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    Student *student = [[Student alloc] init];
    self.jsContext[@"Student"] = student;
    student.jsContext = self.jsContext;
    student.webView = self.webView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
