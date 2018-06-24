//
//  main.m
//  271 NSArrayTest
//
//  Created by 姜凯文 on 2018/6/20.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray* array = [NSArray arrayWithObjects:@"疯狂iOS讲义", @"疯狂Android讲义", @"疯狂Ajax讲义", @"疯狂XML讲义", @"Struts 2.x权威指南", nil];
        NSLog(@"第一个元素：%@", [array objectAtIndex:0]);
        NSLog(@"索引为1的元素：%@", [array objectAtIndex:1]);
        NSLog(@"最后一个元素：%@", [array lastObject]);
        //获取索引从2~5的元素组成的新集合
        NSArray* arr1 = [array objectsAtIndexes: [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2, 3)]];
        NSLog(@"%@", arr1);
        //获取元素在集合中的位置
        NSLog(@"疯狂Android讲义的位置为：%ld", [array indexOfObject:@"疯狂Android讲义"]);
        //获取元素在集合指定范围内的位置
        NSLog(@"在2~5范围疯狂Android讲义的位置为：%ld", [array indexOfObject:@"" inRange:NSMakeRange(2, 3)]);
        //向数组的最后追加一个元素
        //原NSArray本身并没有改变，只是将新返回的NSArray赋给array
        array = [array arrayByAddingObject:@"孙悟空"];
        //向array数组的最后追加另一个数组的所有元素
        //原NSArray本身并没有改变，只是将新返回的NSArray赋给array
        array = [array arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"宝玉", @"黛玉", nil]];
        for (int i = 0; i < array.count; i++) {
            NSLog(@"%@", [array objectAtIndex:i]);
            //上面的代码也可以简写成：
            //NSLog（“%@”， array【i】）；
        }
        //获取array数组中索引为5~8中的所有元素
        NSArray* arr2 = [array subarrayWithRange:NSMakeRange(5, 3)];
        //将NSArray集合的元素写入文件
        [arr2 writeToFile:@"myFile.txt" atomically:YES];
    }
    return 0;
    /*
     2018-06-20 19:31:46.250612+0800 271 NSArrayTest[918:39433] 第一个元素：疯狂iOS讲义
     2018-06-20 19:31:46.250888+0800 271 NSArrayTest[918:39433] 索引为1的元素：疯狂Android讲义
     2018-06-20 19:31:46.250904+0800 271 NSArrayTest[918:39433] 最后一个元素：Struts 2.x权威指南
     2018-06-20 19:31:46.251014+0800 271 NSArrayTest[918:39433] (
     "\U75af\U72c2Ajax\U8bb2\U4e49",
     "\U75af\U72c2XML\U8bb2\U4e49",
     "Struts 2.x\U6743\U5a01\U6307\U5357"
     )
     2018-06-20 19:31:46.251065+0800 271 NSArrayTest[918:39433] 疯狂Android讲义的位置为：1
     2018-06-20 19:31:46.251094+0800 271 NSArrayTest[918:39433] 在2~5范围疯狂Android讲义的位置为：9223372036854775807
     2018-06-20 19:31:46.251218+0800 271 NSArrayTest[918:39433] 疯狂iOS讲义
     2018-06-20 19:31:46.251234+0800 271 NSArrayTest[918:39433] 疯狂Android讲义
     2018-06-20 19:31:46.251259+0800 271 NSArrayTest[918:39433] 疯狂Ajax讲义
     2018-06-20 19:31:46.251317+0800 271 NSArrayTest[918:39433] 疯狂XML讲义
     2018-06-20 19:31:46.251340+0800 271 NSArrayTest[918:39433] Struts 2.x权威指南
     2018-06-20 19:31:46.251348+0800 271 NSArrayTest[918:39433] 孙悟空
     2018-06-20 19:31:46.251355+0800 271 NSArrayTest[918:39433] 宝玉
     2018-06-20 19:31:46.251362+0800 271 NSArrayTest[918:39433] 黛玉
     Program ended with exit code: 0
     */
}
