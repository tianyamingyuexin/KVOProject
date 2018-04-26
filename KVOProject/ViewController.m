//
//  ViewController.m
//  KVOProject
//
//  Created by guangshu01 on 2018/4/25.
//  Copyright © 2018年 guangshu01. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+LUKVO.h"
@interface ViewController ()
@property (nonatomic,strong)Person *person;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   _person = [[Person alloc] init];
   
    [_person lu_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    
  
    
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@--%@",change,_person.name);
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    static int a = 0;
    a ++;
    _person.name = [NSString stringWithFormat:@"%d",a];
    
    
}




@end
