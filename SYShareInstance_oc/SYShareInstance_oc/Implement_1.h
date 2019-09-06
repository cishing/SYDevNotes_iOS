//
//  Implement_1.h
//  SYShareInstance_oc
//
//  Created by DDL-027 on 2019/9/6.
//  Copyright © 2019 cishing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Implement_1 : NSObject

+ (Implement_1 *)shareInstance;

+ (instancetype) alloc __attribute__((unavailable("replace with 'shareInstance'")));
+ (instancetype) new __attribute__((unavailable("replace with 'shareInstance'")));
- (instancetype) copy __attribute__((unavailable("replace with 'shareInstance'")));
- (instancetype) mutableCopy __attribute__((unavailable("replace with 'shareInstance'")));

@end

NS_ASSUME_NONNULL_END
