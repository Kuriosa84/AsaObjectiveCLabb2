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
        self.scrambledAnswers = [self getScrambledAnswers];
    }
    return self;
}

-(NSMutableArray*)getScrambledAnswers {
    NSMutableArray* alternatives = [@[@"", @"", @"", @""] mutableCopy];
    alternatives[arc4random() % 4] = self.correctAnswer;
    int j=0;
    for(int i=0; i<4; i++) {
        if([alternatives[i] isEqualToString:@""]) {
            alternatives[i] = self.wrongAnswers[j++];
        }
    }
    [alternatives exchangeObjectAtIndex:arc4random() % 4 withObjectAtIndex:arc4random() % 4];
    return alternatives;
}

@end
