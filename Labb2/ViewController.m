//
//  ViewController.m
//  Labb2
//
//  Created by Åsa Kwarnmark on 2017-01-17.
//  Copyright © 2017 Åsa Kwarnmark. All rights reserved.
//

#import "ViewController.h"
#import "Question.h"
#import "Model.h"

@interface ViewController ()

@property (nonatomic) NSString* myName;
@property (nonatomic) Question* q;
@property (nonatomic) Model* model;

@property (weak, nonatomic) IBOutlet UILabel *questionBox;
@property (weak, nonatomic) IBOutlet UIButton *alt1;
@property (weak, nonatomic) IBOutlet UIButton *alt2;
@property (weak, nonatomic) IBOutlet UIButton *alt3;
@property (weak, nonatomic) IBOutlet UIButton *alt4;
@property (weak, nonatomic) IBOutlet UILabel *correctLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestion;
@property (weak, nonatomic) IBOutlet UILabel *wrongLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.model = [[Model alloc] init];
    [self setUpQuestion];
}

-(void)setUpQuestion {
    self.q = [self.model getRandomQuestion];
    NSMutableArray* alternatives = [@[@"", @"", @"", @""] mutableCopy];
    alternatives[arc4random() % 4] = self.q.correctAnswer;
    int j=0;
    for(int i=0; i<4; i++) {
        if([alternatives[i] isEqualToString:@""]) {
            alternatives[i] = self.q.wrongAnswers[j++];
        }
    }
        self.questionBox.text = self.q.question;
    [self.alt1 setTitle:alternatives[0] forState:UIControlStateNormal];
    [self.alt2 setTitle:alternatives[1] forState:UIControlStateNormal];
    [self.alt3 setTitle:alternatives[2] forState:UIControlStateNormal];
    [self.alt4 setTitle:alternatives[3] forState:UIControlStateNormal];
}

- (IBAction)checkIfCorrect:(UIButton *)sender {
    if([[sender titleForState:UIControlStateNormal] isEqualToString:self.q.correctAnswer]) {
        [self answeredCorrectly];
    } else {
        [self answeredWrong];
    }
}
- (IBAction)loadNextQuestion:(UIButton *)sender {
    [self.correctLabel setHidden:YES];
    [self.wrongLabel setHidden:YES];
    [self.nextQuestion setHidden:YES];
    [self setUpQuestion];
    
}

-(void)answeredCorrectly {
    [self.correctLabel setHidden:NO];
    [self.nextQuestion setHidden:NO];
}

-(void)answeredWrong {
    [self.wrongLabel setHidden:NO];
    [self.nextQuestion setHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
