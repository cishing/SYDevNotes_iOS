//
//  Implement_1.m
//  SYShareInstance_oc
//
//  Created by DDL-027 on 2019/9/6.
//  Copyright © 2019 cishing. All rights reserved.
//

#import "Implement_1.h"

@implementation Implement_1

+ (Implement_1 *)shareInstance {
    
    static Implement_1 *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[super allocWithZone:nil] init];
    });
    
    return instance;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        
    }
    
    return self;
}

@end
