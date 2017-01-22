//
//  Question.m
//  Labb2
//
//  Created by Åsa Kwarnmark on 2017-01-17.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

#import "Question.h"


@implementation Question

-(instancetype)init:(NSArray*)array
{
    self = [super init];
    if(self) {
        self.question = array[0];
        self.correctAnswer = array[1];
        self.wrongAnswers = @[array[2], array[3], array[4]];
    }
    return self;
}

@end
