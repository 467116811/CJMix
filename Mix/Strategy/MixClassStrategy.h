//
//  MixClassStrategy.h
//  CJMix
//
//  Created by ChenJie on 2019/1/24.
//  Copyright © 2019 Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../Model/MixClass.h"

@interface MixClassStrategy : NSObject

+ (NSArray <MixClass *>*)dataToClassName:(NSString *)data;

@end

