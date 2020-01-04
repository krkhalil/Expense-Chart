//
//  ViewController.h
//  DailyExpense
//
//  Created by Macbook on 03/08/2019.
//  Copyright © 2019 TP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *remainingAmount;
@property (weak, nonatomic) IBOutlet UIButton *dailyButton;
@property (weak, nonatomic) IBOutlet UIButton *monthlyButton;
@property (weak, nonatomic) IBOutlet UILabel *totalIncome;
@property (weak, nonatomic) IBOutlet UILabel *totalExpense;
@property (weak, nonatomic) IBOutlet UITableView *incomeTable;
@property (weak, nonatomic) IBOutlet UITableView *expenseTable;
@property (weak, nonatomic) IBOutlet UIView *dailyView;
@property (weak, nonatomic) IBOutlet UIView *monthlyView;
@property (weak, nonatomic) IBOutlet UITableView *monthlyTable;



@property (weak, nonatomic) IBOutlet UIView *incomeView;
@property (weak, nonatomic) IBOutlet UIView *expenseView;


- (IBAction)dailyButtonTouchd:(id)sender;

- (IBAction)monthlyButtonTouched:(id)sender;

- (IBAction)addIncomeButtonTouched:(id)sender;
- (IBAction)addExpenseButtonTouched:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *nodata;



@property (weak, nonatomic) IBOutlet UIView *bgView;

- (IBAction)addToHistory:(id)sender;



@property (weak, nonatomic) IBOutlet UIButton *addIncomeButton;
@property (weak, nonatomic) IBOutlet UIButton *addExpenseButton;

- (IBAction)expenseButtonTouched:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *chartView;
@property (weak, nonatomic) IBOutlet UIButton *chartButton;
- (IBAction)chartButtonTouched:(id)sender;
- (IBAction)notesButtonTpuched:(id)sender;

@end

