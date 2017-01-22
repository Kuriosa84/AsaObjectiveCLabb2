//
//  Model.h
//  Labb2
//
//  Created by Åsa Kwarnmark on 2017-01-17.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface Model : NSObject

@property NSMutableArray* allQuestions;
@property NSMutableArray<Question*> *roundOfQuestions;

-(instancetype)init:(int)nrOfQuestions;

-(NSMutableArray*)getRoundOfQuestions:(int)nrOfQuestions;

@end
