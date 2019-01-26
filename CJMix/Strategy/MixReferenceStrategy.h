//
//  MixReferenceStrategy.h
//  Mix
//
//  Created by ChenJie on 2019/1/21.
//  Copyright © 2019 ChenJie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../Model/MixObject.h"


@interface MixReferenceStrategy : NSObject

+ (NSMutableArray <NSString *> *)classNamesWithObjects:(NSArray <MixObject*>*)objects;

@end
