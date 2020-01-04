//
//  AddExpenseVC.m
//  DailyExpense
//
//  Created by Macbook on 03/08/2019.
//  Copyright © 2019 TP. All rights reserved.
//

#import "AddExpenseVC.h"
#import "DEData.h"


@interface AddExpenseVC ()

@end

@implementation AddExpenseVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = false;
    
    
   
    
    
}

- (IBAction)addIncomeButtinTouched:(id)sender
{
    
    
    NSString *dateStr = @"2016-07-29 09:05";
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    // set the date format related to what the string already you have
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    // again add the date format what the output u need
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *finalDate = [dateFormat stringFromDate:date];
    NSLog(@"finalDate==%@",finalDate);
    
    [DEData addExpenseToArray:_titleTextField.text setDate:finalDate setDetail:@"1" setAmount:_amountTextField.text];
    
    
    int a = [DEData getTotalExpense];
    
    if (_amountTextField.text.length > 0)
    {
        int b = [_amountTextField.text integerValue];
        a = a+b;
        
        [DEData setTotalExpense:[NSString stringWithFormat:@"%d",a]];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
