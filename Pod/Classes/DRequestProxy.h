//
//  DRequestProxy.h
//  hybridAuth
//
//  Created by yangdd on 2017/3/10.
//  Copyright © 2017年 yangdd. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "DForm.h"

@interface DRequestProxy : NSObject

@property(nonatomic, strong) AFHTTPSessionManager *sessionManager;

- (void) get:(DForm *)form url:(NSString *)url responseClass:(Class)responseClass completion:(void(^) (id responseObject, NSError *error))block;

- (void) post:(DForm *)form url:(NSString *)url completion:(void(^) (NSError *error))block;

@end
