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

// NSObject Implementation
struct NSObject_IMPL {
    Class isa;//64 8个字节
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj = [[NSObject alloc] init];
        // Class's ivar size rounded up to a pointer-size boundary.
        //获得NSObject实例对象的成员变量所占用的大小 >> 8
        NSLog(@"%zd", class_getInstanceSize([NSObject class]));
        //获得obj指针所指向内存的大小 >> 16
        NSLog(@"%zd", malloc_size((__bridge const void *)(obj)));
       
    }
    return 0;
}
