//
//  main.m
//  268 FKItem
//
//  Created by 姜凯文 on 2018/6/20.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FKItem.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FKItem* item = [FKItem new];    //创建一个FKItem对象
        item.name = [NSMutableString stringWithString:@"疯狂iOS讲义"]; //为item的name属性赋值
        [item.name appendString:@"fkit"];   //为item的name属性后追加一个字符串
    }
    return 0;
}
