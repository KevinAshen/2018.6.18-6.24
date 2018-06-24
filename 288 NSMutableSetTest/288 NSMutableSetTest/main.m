//
//  main.m
//  288 NSMutableSetTest
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
        //创建一个初始容量为10的set集合
        NSMutableSet* set = [NSMutableSet setWithCapacity:10];
        [set addObject:@"疯狂iOS讲义"];
        NSLog(@"添加一个元素后：%@", NSCollectionToString(set));
        [set addObjectsFromArray:[NSArray
                                  arrayWithObjects:@"疯狂Android讲义", @"疯狂Ajax讲义", @"疯狂XML讲义", nil]];
        NSLog(@"使用NSArray添加3个元素后：%@", NSCollectionToString(set));
        [set removeObject:@"疯狂XML讲义"];
        NSLog(@"删除1个元素后：%@", NSCollectionToString(set));
        //再次创建一个Set集合
        NSSet* set2 = [NSSet setWithObjects:@"孙悟空", @"疯狂iOS讲义", nil];
        //计算两个集合的并集，直接改变set集合的元素
//       [set unionSet: set2];
        //计算两个集合的差集，直接改变set集合的元素
//       [set minusSet: set2];
        //计算两个集合的交集，直接改变set集合的元素
//        [set intersectSet: set2];
        //用set2的集合元素替换set的集合元素，直接改变set集合的元素
        //[set setSet: set2];
        NSLog(@"%@", NSCollectionToString(set));
    }
    return 0;
    /*
     2018-06-24 17:07:55.365460+0800 288 NSMutableSetTest[631:15750] 添加一个元素后：[疯狂iOS讲义]
     2018-06-24 17:07:55.365849+0800 288 NSMutableSetTest[631:15750] 使用NSArray添加3个元素后：[疯狂iOS讲义, 疯狂Ajax讲义, 疯狂Android讲义, 疯狂XML讲义]
     2018-06-24 17:07:55.365884+0800 288 NSMutableSetTest[631:15750] 删除1个元素后：[疯狂iOS讲义, 疯狂Ajax讲义, 疯狂Android讲义]
     2018-06-24 17:07:55.365954+0800 288 NSMutableSetTest[631:15750] [疯狂iOS讲义, 孙悟空]
     Program ended with exit code: 0
     */
}
