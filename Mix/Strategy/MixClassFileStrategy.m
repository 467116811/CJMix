//
//  MixClassFileStrategy.m
//  Mix
//
//  Created by ChenJie on 2019/1/21.
//  Copyright © 2019 ChenJie. All rights reserved.
//

#import "MixClassFileStrategy.h"

@implementation MixClassFileStrategy

+ (NSArray <MixClassFile *> *)filesToClassFiles:(NSArray <MixFile *>*)hmFiles {
    NSMutableArray <MixClassFile *>*classFiles = [NSMutableArray arrayWithCapacity:0];
    
    for (MixFile * obj in hmFiles) {
        @autoreleasepool {
            if (obj.fileType == MixFileTypeH) {
                MixFile * mFile = [self mFileOfHFile:obj classFiles:hmFiles];
                MixClassFile * classFile = [[MixClassFile alloc] init];
                classFile.hFile = obj;
                if (mFile) {
                    classFile.mFile = mFile;
                }
                [classFiles addObject:classFile];
            }
        }
    }

    return [NSArray arrayWithArray:classFiles];
    
    
//    __block NSMutableDictionary * fileDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
//
//    [hmFiles enumerateObjectsUsingBlock:^(MixFile * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (obj.fileType == MixFileTypeH) {
//            MixClassFile * classFile = [[MixClassFile alloc] init];
//            classFile.hFile = obj;
//            if ([fileDictionary.allKeys containsObject:classFile.classFileName]) {
//                MixClassFile * classFile2 = [fileDictionary objectForKey:classFile.classFileName];
//                classFile2.hFile = obj;
//            }else {
//                [fileDictionary setObject:classFile forKey:classFile.classFileName];
//            }
//        } else if (obj.fileType == MixFileTypeM || obj.fileType == MixFileTypeMM) {
//            MixClassFile * classFile = [[MixClassFile alloc] init];
//            classFile.mFile = obj;
//            if ([fileDictionary.allKeys containsObject:classFile.classFileName]) {
//                MixClassFile * classFile2 = [fileDictionary objectForKey:classFile.classFileName];
//                classFile2.mFile = obj;
//            } else {
//                [fileDictionary setObject:classFile forKey:classFile.classFileName];
//            }
//        }
//    }];
//
//
//    return fileDictionary.allValues;
}

+ (MixFile *)mFileOfHFile:(MixFile *)hFile classFiles:(NSArray <MixFile *>*)hmFiles {
    __block MixFile * mFile = nil;
    
    for (MixFile * obj in hmFiles) {
        if (obj.fileType == MixFileTypeM || obj.fileType == MixFileTypeMM) {
            NSString * classHFileName = [hFile.fileName stringByReplacingOccurrencesOfString:@".h" withString:@""];
            
            NSString * suffix = @".m";
            if (obj.fileType == MixFileTypeMM) {
                suffix = @".mm";
            }
            NSString * classMFileName = [obj.fileName stringByReplacingOccurrencesOfString:suffix withString:@""];
            if ([classHFileName isEqualToString:classMFileName]) {
                mFile = obj;
            }
        }
    }
  
    return mFile;
}


@end
