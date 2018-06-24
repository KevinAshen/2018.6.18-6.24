//
//  main.m
//  277 NSArraySort
//
//  Created by 姜凯文 on 2018/6/21.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义比较函数，根据两个对象的intValue进行比较
NSInteger intSort(id num1, id num2, void *context)
{
    int v1 = [num1 intValue];
    int v2 = [num2 intValue];
    if (v1 < v2) {
        return NSOrderedAscending;
    } else if (v1 > v2) {
        return NSOrderedDescending;
    } else {
        return NSOrderedSame;
    }
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //初始化一个元素为NSString的NSarry对象
        NSArray* array1 = [NSArray arrayWithObjects:@"Objective-C", @"C", @"C++", @"Ruby", @"perl", @"Python", nil];
        //使用集合元素的compare方法进行排序
        array1 = [array1 sortedArrayUsingSelector:@selector(compare:)];
        NSLog(@"%@", array1);
        //初始化一个元素为NSNumber的NSArray对象
        NSArray* array2 = [NSArray arrayWithObjects:
                           [NSNumber numberWithInt:20],
                           [NSNumber numberWithInt:12],
                           [NSNumber numberWithInt:-8],
                           [NSNumber numberWithInt:50],
                           [NSNumber numberWithInt:19], nil];
        //使用intSort函数进行排序
        array2 = [array2 sortedArrayUsingFunction:intSort context:nil];
        NSLog(@"%@", array2);
        //使用代码块对集合元素进行排序
        NSArray* array3 = [array2 sortedArrayUsingComparator:^(id obj1, id obj2)
                           {
                               //该代码块就是根据集合元素的intValue进行比较
                               if ([obj1 intValue] > [obj2 intValue]) {
                                   return NSOrderedDescending;
                               }
                               if ([obj1 intValue] < [obj2 intValue]) {
                                   return NSOrderedAscending;
                               }
                               return NSOrderedSame;
                           }];
        NSLog(@"%@", array3);
    }
    return 0;
    /*
     2018-06-21 21:08:41.392294+0800 277 NSArraySort[621:21228] (
     C,
     "C++",
     "Objective-C",
     Python,
     Ruby,
     perl
     )
     2018-06-21 21:08:41.392655+0800 277 NSArraySort[621:21228] (
     "-8",
     12,
     19,
     20,
     50
     )
     2018-06-21 21:08:41.392706+0800 277 NSArraySort[621:21228] (
     "-8",
     12,
     19,
     20,
     50
     )
     Program ended with exit code: 0
     */
}
