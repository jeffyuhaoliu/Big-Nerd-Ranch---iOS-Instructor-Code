//
//  QuizViewController.m
//  Quiz
//
//  Created by Christian Keur on 6/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, strong) NSArray *questions;
@property (nonatomic, strong) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionField;
@property (nonatomic, weak) IBOutlet UILabel *answerField;

@end

@implementation QuizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        
        // Create two arrays filled with questions and answers
        // and make the pointers point to them
        self.questions = @[@"From what is cognac made?",
                      @"What is 7+7?",
                      @"What is the capital of Vermont?"];
        
        self.answers = @[@"Grapes", @"14", @"Montpelier"];
    }
    
    // Return the address of the new object
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    self.currentQuestionIndex++;
    if (self.currentQuestionIndex == [self.questions count])
        self.currentQuestionIndex = 0;
    
    NSString *question = self.questions[self.currentQuestionIndex];
    
    self.questionField.text = question;
    self.answerField.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    self.answerField.text = answer;
}

@end
