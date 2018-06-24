//
//  main.m
//  284 NSSetTest
//
//  Created by 姜凯文 on 2018/6/24.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义一个函数，该函数可以吧NSArray和NSSet转化为字符串
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
        //用4个元素初始化NSSet集合
        //故意传入两个相等的元素，NSSet集合只会保留一个元素
        NSSet* set1 = [NSSet setWithObjects:
                       @"疯狂iOS讲义", @"疯狂Android讲义",
                       @"疯狂Ajex讲义", @"疯狂iOS讲义", nil];
        //程序输出set1集合中元素个数为3
        NSLog(@"set1集合中元素个数为%ld", [set1 count]);
        NSLog(@"s1集合：%@", NSCollectionToString(set1));
        NSSet* set2 = [NSSet setWithObjects:@"孙悟空", @"疯狂Android讲义",@"猪八戒", nil];
        NSLog(@"s2集合：%@", NSCollectionToString(set2));
        //向set1集合中添加单个元素，将添加元素后生成的新集合赋给set1
        set1 = [set1 setByAddingObject:@"Struts 2.1权威指南"];
        NSLog(@"添加一个元素后：%@", NSCollectionToString(set1));
        //使用NSSet集合向set1集合中添加多个元素，相当于计算两个集合的并集
        NSSet* s = [set1 setByAddingObjectsFromSet:set2];
        NSLog(@"set1与set2的并集：%@", NSCollectionToString(s));
        BOOL b = [set1 intersectsSet:set2]; //  计算两个NSSet集合是否有交集
        NSLog(@"set1与set2是否有交集：%d", b);  //    将输出代表YES的1
        BOOL bo = [set2 isSubsetOfSet:set1];    //  判断set2是否是set1的子集
        NSLog(@"set2是否为set1的子集：%d", bo); // 将输出代表NO的0
        //判断NSSet集合是否包含指定元素
        BOOL bb = [set1 containsObject:@"疯狂Ajax讲义"];
        NSLog(@"set1是否包含\"疯狂Ajax讲义\"：%d", bb); //将输出代表YES的1
        //下个面两行代码将取出相同的元素，到取出哪个元素是不确定的
        NSLog(@"set1取出一个元素：%@", [set1 anyObject]);
        NSLog(@"set1取出一个元素：%@", [set1 anyObject]);
        //使用代码块对集合元素进行过滤
        NSSet* filtereSet = [set1 objectsPassingTest:
                             ^(id obj, BOOL *stop) {
                                 return (BOOL)([obj length] > 8);
                             }];
        NSLog(@"set1中的元素长度大于8的集合元素有：%@", NSCollectionToString(filtereSet));
    }
    return 0;
    /*
     2018-06-24 11:04:32.748476+0800 284 NSSetTest[790:30554] set1集合中元素个数为3
     2018-06-24 11:04:32.748714+0800 284 NSSetTest[790:30554] s1集合：[疯狂Ajex讲义, 疯狂Android讲义, 疯狂iOS讲义]
     2018-06-24 11:04:32.748752+0800 284 NSSetTest[790:30554] s2集合：[孙悟空, 疯狂Android讲义, 猪八戒]
     2018-06-24 11:04:32.748794+0800 284 NSSetTest[790:30554] 添加一个元素后：[疯狂Ajex讲义, 疯狂Android讲义, 疯狂iOS讲义, Struts 2.1权威指南]
     2018-06-24 11:04:32.748814+0800 284 NSSetTest[790:30554] set1与set2的并集：[疯狂iOS讲义, 疯狂Ajex讲义, 猪八戒, 疯狂Android讲义, 孙悟空, Struts 2.1权威指南]
     2018-06-24 11:04:32.748826+0800 284 NSSetTest[790:30554] set1与set2是否有交集：1
     2018-06-24 11:04:32.748837+0800 284 NSSetTest[790:30554] set2是否为set1的子集：0
     2018-06-24 11:04:32.748846+0800 284 NSSetTest[790:30554] set1是否包含"疯狂Ajax讲义"：0
     2018-06-24 11:04:32.748857+0800 284 NSSetTest[790:30554] set1取出一个元素：疯狂Ajex讲义
     2018-06-24 11:04:32.748866+0800 284 NSSetTest[790:30554] set1取出一个元素：疯狂Ajex讲义
     2018-06-24 11:04:32.748996+0800 284 NSSetTest[790:30554] set1中的元素长度大于8的集合元素有：[疯狂Android讲义, Struts 2.1权威指南]
     Program ended with exit code: 0
     */
}
