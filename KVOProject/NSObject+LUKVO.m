//
//  NSObject+LUKVO.m
//  KOVSHIXIAN
//
//  Created by mac on 18-2-4.
//  Copyright (c) 2018年 lu. All rights reserved.
//

#import "NSObject+LUKVO.h"
//#import <objc/runtime.h>
#import <objc/message.h>
@implementation NSObject (LUKVO)
- (void)lu_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{

    /*
     1.动态创建一个子类对象
     2.改变方法调用者类型
     3.重写setName
     */
    NSString *className = [NSString stringWithFormat:@"luKVO_%@",NSStringFromClass(self.class)];
    
    //1.动态创建一个子类
   Class newClass = objc_allocateClassPair(self.class, className.UTF8String, 0);
    
    //注册类
    objc_registerClassPair(newClass);
    
    //2.修改调用者类型 将isa指针指向当前类
    object_setClass(self, newClass);
    
    //3.给子类添加serName方法－－－相当于重写
    class_addMethod(newClass, @selector(setName:),(IMP)test
                    , "v@:@");
    
    
    //4绑定观察者
    objc_setAssociatedObject(self, (__bridge const void *)@"hank", observer, OBJC_ASSOCIATION_ASSIGN);
}


void test(id self,SEL _cmd,NSString *name)
{
    NSLog(@"come in");
    
    
    id class = [self class];
    object_setClass(self, class_getSuperclass(class));
    objc_msgSend(self, @selector(setName:),name);
    object_setClass(self, class);
    
    
    id observer = objc_getAssociatedObject(self, (__bridge const void*)@"hank");
    objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:),self,name,@{@"newName":name},nil);
    
}
@end
