//
//  main.m
//  289 NSCountedSetTest
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
        NSCountedSet* set = [NSCountedSet setWithObjects:@"疯狂iOS讲义", @"疯狂Android讲义", @"疯狂Ajax讲义", nil];
        [set addObject:@"疯狂iOS讲义"];
        [set addObject:@"疯狂iOS讲义"];
        //输出集合元素
        NSLog(@"%@", NSCollectionToString(set));
        //获取指定元素的添加顺序
        NSLog(@"\"疯狂iOS讲义\"的添加次数为： %ld", [set countForObject:@"疯狂iOS讲义"]);
        //删除元素
        [set removeObject:@"疯狂iOS讲义"];
        NSLog(@"删除\"疯狂iOS讲义\"1次后的结果：%@", NSCollectionToString(set));
        NSLog(@"删除\"疯狂iOS讲义\"1次后的添加次数为： %ld", [set countForObject:@"疯狂iOS讲义"]);
        //重复删除元素
        [set removeObject:@"疯狂iOS讲义"];
        [set removeObject:@"疯狂iOS讲义"];
        NSLog(@"删除\"疯狂iOS讲义\"3次后的结果：%@", NSCollectionToString(set));
    }
    return 0;
    /*
     2018-06-24 17:29:01.668803+0800 289 NSCountedSetTest[761:22277] [疯狂iOS讲义, 疯狂Android讲义, 疯狂Ajax讲义]
     2018-06-24 17:29:01.669055+0800 289 NSCountedSetTest[761:22277] "疯狂iOS讲义"的添加次数为： 3
     2018-06-24 17:29:01.669114+0800 289 NSCountedSetTest[761:22277] 删除"疯狂iOS讲义"1次后的结果：[疯狂iOS讲义, 疯狂Android讲义, 疯狂Ajax讲义]
     2018-06-24 17:29:01.669138+0800 289 NSCountedSetTest[761:22277] 删除"疯狂iOS讲义"1次后的添加次数为： 2
     2018-06-24 17:29:01.669184+0800 289 NSCountedSetTest[761:22277] 删除"疯狂iOS讲义"3次后的结果：[疯狂Android讲义, 疯狂Ajax讲义]
     Program ended with exit code: 0
     */
}
