//
//  main.m
//  274 NSArryTest2
//
//  Created by 姜凯文 on 2018/6/20.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FKUser.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray* array = [NSArray arrayWithObjects:[[FKUser alloc] initWithName:@"sun" pass:@"123"], [[FKUser alloc] initWithName:@"bai" pass:@"345"], [[FKUser alloc] initWithName:@"zhu" pass:@"654"], [[FKUser alloc] initWithName:@"tang" pass:@"178"], [[FKUser alloc] initWithName:@"niu" pass:@"155"], nil];
        //查找指定新FKUser对象在集合中的索引
        [array makeObjectsPerformSelector:@selector(say:)withObject:@"下午好，NSArray真强大！"];
        NSString* content = @"疯狂iOS讲义";
        //迭代集合内指定范围内的元素，并使用该元素来执行代码块
        [array enumerateObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2, 2)] options:NSEnumerationReverse
         //代码块的第一个参数代表正在遍历的集合元素
         //代码块的第二个参数代表正在遍历的集合元素的索引
        usingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
            NSLog(@"正在处理第%ld个元素：%@", idx, obj);
            [obj say:content];
        }];
    }
    return 0;
    /*
     2018-06-21 20:32:57.244572+0800 274 NSArryTest2[578:12511] sun说：下午好，NSArray真强大！
     2018-06-21 20:32:57.244849+0800 274 NSArryTest2[578:12511] bai说：下午好，NSArray真强大！
     2018-06-21 20:32:57.244881+0800 274 NSArryTest2[578:12511] zhu说：下午好，NSArray真强大！
     2018-06-21 20:32:57.244891+0800 274 NSArryTest2[578:12511] tang说：下午好，NSArray真强大！
     2018-06-21 20:32:57.244930+0800 274 NSArryTest2[578:12511] niu说：下午好，NSArray真强大！
     2018-06-21 20:32:57.245154+0800 274 NSArryTest2[578:12511] 正在处理第3个元素：<FKUser[name = tang, pass = 178]>
     2018-06-21 20:32:57.245233+0800 274 NSArryTest2[578:12511] tang说：疯狂iOS讲义
     2018-06-21 20:32:57.245303+0800 274 NSArryTest2[578:12511] 正在处理第2个元素：<FKUser[name = zhu, pass = 654]>
     2018-06-21 20:32:57.245400+0800 274 NSArryTest2[578:12511] zhu说：疯狂iOS讲义
     Program ended with exit code: 0
     */
}
