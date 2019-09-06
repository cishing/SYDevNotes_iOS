//
//  Implement_2.m
//  SYShareInstance_oc
//
//  Created by DDL-027 on 2019/9/6.
//  Copyright © 2019 cishing. All rights reserved.
//

#import "Implement_2.h"

@implementation Implement_2

+ (Implement_2 *)shareInstance {
    
    static Implement_2 *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[Implement_2 alloc] init];
    });
    
    return instance;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        
    }
    
    return self;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self shareInstance];
}

- (id)copyWithZone:(NSZone *)zone {
    return [[self class] shareInstance];
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    return [[self class] shareInstance];
}

@end
