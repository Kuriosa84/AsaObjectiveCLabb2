//
//  Question.h
//  Labb2
//
//  Created by Åsa Kwarnmark on 2017-01-17.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property NSString* question;
@property NSString* correctAnswer;
@property NSArray* wrongAnswers;
@property NSMutableArray* scrambledAnswers;

-(instancetype)init:(NSArray*)array;

@end
