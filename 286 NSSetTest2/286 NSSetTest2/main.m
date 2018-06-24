//
//  main.m
//  286 NSSetTest2
//
//  Created by 姜凯文 on 2018/6/24.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FKUser.h"

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
        NSSet* set = [NSSet setWithObjects:
                      [[FKUser alloc] initWithName:@"sun" pass:@"123"],
                      [[FKUser alloc] initWithName:@"bai" pass:@"345"],
                      [[FKUser alloc] initWithName:@"sun" pass:@"123"],
                      [[FKUser alloc] initWithName:@"tang" pass:@"178"],
                      [[FKUser alloc] initWithName:@"niu" pass:@"155"], nil];
        NSLog(@"set集合元素的个数：%ld", [set count]);
        NSLog(@"%@", NSCollectionToString(set));
    }
    return 0;
    /*
     2018-06-24 16:45:07.055624+0800 286 NSSetTest2[562:9088] set集合元素的个数：5
     2018-06-24 16:45:07.055909+0800 286 NSSetTest2[562:9088] [<FKUser[name = bai, pass = 345]>, <FKUser[name = sun, pass = 123]>, <FKUser[name = tang, pass = 178]>, <FKUser[name = sun, pass = 123]>, <FKUser[name = niu, pass = 155]>]
     Program ended with exit code: 0
     */
    /*
     2018-06-24 16:50:31.085140+0800 286 NSSetTest2[586:10818] ===hash===
     2018-06-24 16:50:31.085327+0800 286 NSSetTest2[586:10818] ===hash===
     2018-06-24 16:50:31.085336+0800 286 NSSetTest2[586:10818] ===hash===
     2018-06-24 16:50:31.085354+0800 286 NSSetTest2[586:10818] ===hash===
     2018-06-24 16:50:31.085361+0800 286 NSSetTest2[586:10818] ===hash===
     2018-06-24 16:50:31.085405+0800 286 NSSetTest2[586:10818] set集合元素的个数：4
     2018-06-24 16:50:31.085479+0800 286 NSSetTest2[586:10818] [<FKUser[name = bai, pass = 345]>, <FKUser[name = sun, pass = 123]>, <FKUser[name = tang, pass = 178]>, <FKUser[name = niu, pass = 155]>]
     Program ended with exit code: 0
     */
}
