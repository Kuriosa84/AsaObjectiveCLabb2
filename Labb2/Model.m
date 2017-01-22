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

-(instancetype)init
{
    self = [super init];
    
    if(self) {
        self.questions = @[
                           [[Question alloc] init:@[@"Vad heter Kalle Ankas farbror?", @"Joakim", @"Kajsa", @"Fnatte", @"Alexander"]],
                           [[Question alloc] init:@[@"Vad heter huvudstaden i Norge?", @"Oslo", @"Bergen", @"Moskva", @"Shanghai"]],
                           [[Question alloc] init:@[@"Vem spelade Tv-detektiven Columbo?", @"Peter Falk", @"Tom Selleck", @"Richard Dean Anderson", @"Gillian Anderson"]],
                           [[Question alloc] init:@[@"Vad heter Sveriges drottning?", @"Silvia", @"Salvia", @"Saliv", @"Annika"]],
                           [[Question alloc] init:@[@"Hur många sidor har en fyrkant?", @"Fyra", @"Tre", @"En", @"Hundra"]],
                           [[Question alloc] init:@[@"Vad heter Bamses äldsta dotter?", @"Nalle-Maja", @"Brumma", @"Teddy", @"Skalman"]],
                           [[Question alloc] init:@[@"Vad heter Japans huvudstad?", @"Tokyo", @"Linköping", @"Rom", @"Alingsås"]],
                           [[Question alloc] init:@[@"I vilket landskap ligger Malmö?", @"Skåne", @"Norrbotten", @"Västmanland", @"Småland"]],
                           [[Question alloc] init:@[@"Vad hette USA:s första president?", @"George Washington", @"George Harrison", @"George Formby", @"George Foreman"]],
                           [[Question alloc] init:@[@"Vem är störst och vackrast i skogen?", @"Bo Ko", @"Gösta Grävling", @"Krösus Sork", @"Tiger"]]
                           ];
    }
    
    return self;
}





-(Question*)getRandomQuestion {
    return self.questions[arc4random() % self.questions.count];
}


@end
