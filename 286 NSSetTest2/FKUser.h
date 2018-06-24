//
//  FKUser.h
//  274 NSArryTest2
//
//  Created by 姜凯文 on 2018/6/20.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKUser : NSObject
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* pass;
- (instancetype) initWithName: (NSString*) aName pass:(NSString*) apass;
- (void) say:(NSString*) content;
@end
