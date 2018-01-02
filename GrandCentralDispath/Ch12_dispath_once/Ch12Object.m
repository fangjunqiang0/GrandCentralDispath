//
//  Ch12Object.m
//  GrandCentralDispath
//
//  Created by fjq on 2018/1/2.
//  Copyright © 2018年 fjq. All rights reserved.
//

#import "Ch12Object.h"

@implementation Ch12Object
static id _instance;
+ (id)ch12Object {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[[self class]alloc] init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
@end
