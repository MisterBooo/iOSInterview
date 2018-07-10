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


@interface Student: NSObject
{
    @public
    int _no;
    int _age;
    int _aaa;
}
@end

@implementation Student
@end

struct Student_IMPL {
    Class isa; //8 字节
    int _no;
    int _age;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *stu = [[Student alloc] init];
        stu->_no = 2;
        stu->_age = 12;
//        stu->_aaa = 12;

        NSLog(@"%zd",class_getInstanceSize([Student class]));
        NSLog(@"%zd",malloc_size((__bridge const void *)(stu)));
        struct Student_IMPL *stuImpl = (__bridge struct Student_IMPL *)stu;
        NSLog(@"no is %d, age is %d",stuImpl->_no, stuImpl->_age);
        NSLog(@"------------end------------");
    }
    return 0;
}
