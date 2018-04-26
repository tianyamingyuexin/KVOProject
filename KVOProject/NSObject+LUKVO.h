//
//  NSObject+LUKVO.h
//  KOVSHIXIAN
//
//  Created by mac on 18-2-4.
//  Copyright (c) 2018年 lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LUKVO)
- (void)lu_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;
@end
