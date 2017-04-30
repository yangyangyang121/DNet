//
//  DRequestProxy.m
//  hybridAuth
//
//  Created by yangdd on 2017/3/10.
//  Copyright © 2017年 yangdd. All rights reserved.
//

#import "DRequestProxy.h"
#import <DParser/DParser.h>

@implementation DRequestProxy

- (instancetype) init {
    if (self = [super init]) {
        self.sessionManager = [AFHTTPSessionManager manager];
        [self.sessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        self.sessionManager.requestSerializer.timeoutInterval = 50.0f;
        [self.sessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    }
    return self;
}

- (void) get:(DForm *)form url:(NSString *)url responseClass:(Class)responseClass completion:(void(^) (id responseObject, NSError *error))block {

    void (^successBlock)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {

        id obj = [DParser parser:responseObject class:responseClass];

        if (block) {
            block(obj, nil);
        }
    };

     void (^failureBlock)(NSURLSessionDataTask * _Nonnull task, NSError * _Nullable error) = ^ (NSURLSessionDataTask * _Nonnull task, NSError * _Nullable error) {
         if (block) {
             block(nil, error);
         }
    };

    [self.sessionManager GET:url parameters:form progress:nil success:successBlock failure:failureBlock];
}

- (void) post:(DForm *)form url:(NSString *)url completion:(void(^) (NSError *error))block {
}
@end
