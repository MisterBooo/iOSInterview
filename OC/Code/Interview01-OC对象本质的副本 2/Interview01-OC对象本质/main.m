//
//  main.m
//  Interview01-OC对象本质
//
//  Created by MisterBooo on 2018/7/10.
//  Copyright © 2018年 MisterBooo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface Person: NSObject
{
    @public
    int _age;
}
//** h */
@property(nonatomic, assign) float height;
@end

@implementation Person
@end



@interface Student: Person
{
    @public
    int _no;
    int _a;
}
@end

@implementation Student
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p  = [[Person alloc] init];
        
        Student *stu = [[Student alloc] init];
        stu->_no = 2;
        stu->_age = 12;
        NSLog(@"%zd",class_getInstanceSize([Person class]));
        NSLog(@"%zd",malloc_size((__bridge const void *)(p)));
        NSLog(@"********");
        NSLog(@"%zd",class_getInstanceSize([Student class]));
        NSLog(@"%zd",malloc_size((__bridge const void *)(stu)));
      
    }
    return 0;
}
