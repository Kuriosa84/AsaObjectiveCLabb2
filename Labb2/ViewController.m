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
@property (nonatomic) int currentQuestionNr;
@property (nonatomic) int nrOfQuestions;
@property (nonatomic) int nrOfCorrectAnswers;
@property (nonatomic) int nrOfWrongAnswers;

@property (weak, nonatomic) IBOutlet UILabel *questionBox;
@property (weak, nonatomic) IBOutlet UIButton *alt1;
@property (weak, nonatomic) IBOutlet UIButton *alt2;
@property (weak, nonatomic) IBOutlet UIButton *alt3;
@property (weak, nonatomic) IBOutlet UIButton *alt4;
@property (weak, nonatomic) IBOutlet UILabel *correctLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestion;
@property (weak, nonatomic) IBOutlet UILabel *wrongLabel;
@property (weak, nonatomic) IBOutlet UIButton *resultButton;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIButton *playAgainButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpRound];
    }

-(void)setUpRound {
    self.nrOfQuestions = 5;
    self.nrOfWrongAnswers = 0;
    self.nrOfCorrectAnswers = 0;
    self.model = [[Model alloc] init:self.nrOfQuestions];
    self.currentQuestionNr = 0;
    [self setUpQuestion];

}

-(void)setUpQuestion {
    self.q = self.model.roundOfQuestions[self.currentQuestionNr++];
    NSMutableArray* alternatives = self.q.scrambledAnswers;
    
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
    self.nrOfCorrectAnswers++;
    [self.correctLabel setHidden:NO];
    if(self.currentQuestionNr >= self.nrOfQuestions) {
        [self.resultButton setHidden:NO];
    } else {
        [self.nextQuestion setHidden:NO];
    }
}

-(void)answeredWrong {
    self.nrOfWrongAnswers++;
    [self.wrongLabel setHidden:NO];
    if(self.currentQuestionNr >= self.nrOfQuestions) {
        [self.resultButton setHidden:NO];
    } else {
        [self.nextQuestion setHidden:NO];
    }
}

- (IBAction)showFinalScore:(UIButton *)sender {
    [self.correctLabel setHidden:YES];
    [self.wrongLabel setHidden:YES];
    [self.resultLabel setHidden:NO];
    [self.playAgainButton setHidden:NO];
    self.resultLabel.text = [NSString stringWithFormat:@"Du hade %d rätt\n och %d fel.", self.nrOfCorrectAnswers, self.nrOfWrongAnswers];
    
}
- (IBAction)playAgain:(UIButton *)sender {
    [self.resultLabel setHidden:YES];
    [self.resultButton setHidden:YES];
    [sender setHidden:YES];
    [self setUpRound];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
