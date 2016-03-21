//
//  Student.h
//  iOS与JavaScript之间的交互
//
//  Created by zhangxu on 16/3/21.
//  Copyright © 2016年 zhangxu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>



@protocol JavaScriptObjectiveCDelegate <JSExport>

// JS调用此方法来调用OC的方法输出学生信息
- (void)printInformation;

// 调用JS中的方法，输出学生信息
- (void)showInformationwithName:(NSString *)name score:(NSString *)score;

// JS调用Oc，然后在OC中通过调用JS方法来传值给JS。
- (void)jsCallObjcAndObjcCallJsWithDict:(NSDictionary *)params;

@end


@interface Student : NSObject <JavaScriptObjectiveCDelegate>

@property (nonatomic, weak) JSContext *jsContext;
@property (nonatomic, weak) UIWebView *webView;

@end
