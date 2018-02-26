//
//  ViewController.m
//  BillSplitter
//
//  Created by Chris Dean on 2018-02-25.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextfield;
@property (weak, nonatomic) IBOutlet UISlider *numberOfPeople;
@property (weak, nonatomic) IBOutlet UILabel *amountPerPerson;
@property (weak, nonatomic) IBOutlet UILabel *numOfPeopleLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.numberOfPeople addTarget:self action:@selector(sliderValueChangedMethodCall:) forControlEvents:UIControlEventValueChanged];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateSplitAmount:(id)sender {
    float billAmount = [self.billAmountTextfield.text floatValue];
    float amtPerPerson = billAmount/self.numberOfPeople.value;
    NSString *amtPerPersonString = [NSString stringWithFormat:@"$%.02f", amtPerPerson];
    self.amountPerPerson.text = amtPerPersonString;
    
    
//////Not sure why this didnt work!
//    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//    formatter.numberStyle = NSNumberFormatterDecimalStyle;
//    NSDecimalNumber *billAmount = (NSDecimalNumber*)[formatter numberFromString:self.billAmountTextfield.text];
//    NSDecimalNumber *floatDecimal = [[NSDecimalNumber alloc] initWithFloat:self.numberOfPeople.value];
//    NSDecimalNumber *amtPerPerson = (billAmount/floatDecimal);
}

-(IBAction)sliderValueChangedMethodCall:(UISlider*)sender {
    self.numOfPeopleLabel.text = [NSString stringWithFormat:@"%.0f", self.numberOfPeople.value];
}

@end
