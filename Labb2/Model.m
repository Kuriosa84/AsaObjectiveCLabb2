//
//  Model.m
//  Labb2
//
//  Created by Åsa Kwarnmark on 2017-01-17.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

#import "Model.h"
#import "Question.h"


@implementation Model

-(instancetype)init:(int)nrOfQuestions
{
    self = [super init];
    
    if(self) {
        self.allQuestions = [@[
                           @[@"Vad heter Kalle Ankas farbror?", @"Joakim", @"Kajsa", @"Fnatte", @"Alexander"],
                           @[@"Vad heter huvudstaden i Norge?", @"Oslo", @"Bergen", @"Moskva", @"Shanghai"],
                           @[@"Vem spelade Tv-detektiven Columbo?", @"Peter Falk", @"Tom Selleck", @"Richard Dean Anderson", @"Gillian Anderson"],
                           @[@"Vad heter Sveriges drottning?", @"Silvia", @"Salvia", @"Saliv", @"Annika"],
                           @[@"Hur många sidor har en fyrkant?", @"Fyra", @"Tre", @"En", @"Hundra"],
                           @[@"Vad heter Bamses äldsta dotter?", @"Nalle-Maja", @"Brumma", @"Teddy", @"Skalman"],
                           @[@"Vad heter Japans huvudstad?", @"Tokyo", @"Linköping", @"Rom", @"Alingsås"],
                           @[@"I vilket landskap ligger Malmö?", @"Skåne", @"Norrbotten", @"Västmanland", @"Småland"],
                           @[@"Vad hette USA:s första president?", @"George Washington", @"George Harrison", @"George Formby", @"George Foreman"],
                           @[@"Vem är störst och vackrast i skogen?", @"Bo Ko", @"Gösta Grävling", @"Krösus Sork", @"Tiger"]
                           ]
                           mutableCopy];
    }
    self.roundOfQuestions = [self getRoundOfQuestions:nrOfQuestions];
    
    return self;
}

-(NSMutableArray*)getRoundOfQuestions:(int)nrOfQuestions {
    NSMutableArray* result = [@[] mutableCopy];
    for(int i=1; i<=nrOfQuestions; i++) {
        int rand = arc4random() % self.allQuestions.count;
        [result addObject:[[Question alloc] init:self.allQuestions[rand]]];
        [self.allQuestions removeObjectAtIndex:rand];
    }
    return result;
}

@end
