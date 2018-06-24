//
//  main.m
//  290 NSOrderedSetTest
//
//  Created by 姜凯文 on 2018/6/24.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <Foundation/Foundation.h>
//定义一个函数，该函数可以把NSArray或NSSet集合转化为字符串
NSString* NSCollectionToString(id collection)
{
    NSMutableString* result = [NSMutableString
                               stringWithString:@"["];
    //使用快速枚举遍历NSSet集合
    for (id obj in collection)
    {
        [result appendString:[obj description]];
        [result appendString:@", "];
    }
    //获取字符串长度
    NSUInteger len = [result length];
    //去掉字符串最后的两个字符
    //也就是把最后加上的，+空格去掉
    [result deleteCharactersInRange:NSMakeRange(len-2, 2)];
    [result appendString:@"]"];
    return result;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //创建NSOrderedSet集合，故意使用重复的元素
        //可看到程序只会保留一个元素
        NSOrderedSet* set = [NSOrderedSet orderedSetWithObjects:[NSNumber numberWithInt:40],
                             [NSNumber numberWithInt:12], [NSNumber numberWithInt:-9],
                             [NSNumber numberWithInt:28], [NSNumber numberWithInt:12],
                             [NSNumber numberWithInt:17], nil];
        NSLog(@"%@", NSCollectionToString(set));
        //下面方法都是根据索引来操作集合元素
        NSLog(@"set集合的第一个元素:%@", [set firstObject]);   //获取第一个元素
        NSLog(@"set集合的最后一个元素:%@", [set lastObject]);   //获取最后一个元素
        //获取指定索引处的元素
        NSLog(@"set集合中索引为2的元素：%@", [set objectAtIndex:2]);
        NSLog(@"28在set集合中的索引为：%ld", [set indexOfObject:[NSNumber numberWithInt:28]]);
        //从集合进行过滤，获取元素值大于20的集合元素的索引
        NSIndexSet* indexSet = [set indexesOfObjectsPassingTest:^(id obj, NSUInteger idx, BOOL *stop)
                                {
                                    return (BOOL)([obj intValue] > 20);
                                }];
        NSLog(@"set集合中元素值大于20的元素的索引为：%@", indexSet);
    }
    return 0;
}
