//
//  Student.m
//  iOS与JavaScript之间的交互
//
//  Created by zhangxu on 16/3/21.
//  Copyright © 2016年 zhangxu. All rights reserved.
//

#import "Student.h"

@implementation Student


// Js调用了callSystemCamera
- (void)printInformation {
    NSLog(@"JS调用了OC的方法，学生信息为： 姓名： 张三 ；性别：男； 年龄：20");
    
}

- (void)jsCallObjcAndObjcCallJsWithDict:(NSDictionary *)params {
    NSLog(@"jsCallObjcAndObjcCallJsWithDict was called, params is %@", params);
    
    // 调用JS的方法
    JSValue *jsParamFunc = self.jsContext[@"jsParamFunc"];
    [jsParamFunc callWithArguments:@[@{@"age": @30, @"name": @"李四", @"gender": @"男"}]];
}

- (void)showInformationwithName:(NSString *)name score:(NSString *)score{
    
    // 必须回到主线程操作
    dispatch_async(dispatch_get_main_queue(), ^{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:name message:score delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    });
    
    
}


@end

@interface ViewController : UIViewController


@end

