//
//  Man.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/8/24.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "Person.h"

@interface Man : Person
@property (nonatomic,strong) Man* son;
@property (nonatomic,strong) NSArray<Person*>* family;
@end