//
//  ViewController.m
//  DailyExpense
//
//  Created by Macbook on 03/08/2019.
//  Copyright © 2019 TP. All rights reserved.
//

#import "ViewController.h"
#import "DEData.h"
#import "cell1.h"
#import "monthCell.h"
#import "AddIncomeVC.h"
#import "AddExpenseVC.h"
#import "ViewController22222.h"

#import "DYPieChartView.h"

#define MakeColor(r, g, b) [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:1.0f]




@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray * income;
    NSMutableArray * expense;
    NSMutableArray * month;
//
//    TTWKPieChart *pieChart;
//    TTWKPieChartBand *band1;
//    TTWKPieChartBand *band2;
    
    
    DYPieChartView * _pieChartView;
    
    int Hcount;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Hcount = 0;
    
    _incomeTable.delegate = self;
    _expenseTable.delegate = self;
    _monthlyTable.delegate = self;
    
    _incomeTable.dataSource = self;
    _expenseTable.dataSource = self;
    _monthlyTable.dataSource = self;
    
    self.navigationController.navigationBar.hidden = true;
    
    
    
    
    //type 2: quickly
   // [_pieChartView setScaleValues:@[@(0.4), @(0.35), @(0.25), @(0.0), @(0.0)]];
    
    
//    pieChart = [[TTWKPieChart alloc] init];
//
//
//
//
//    // Let's have it smaller for the phone, like a little widget
//    pieChart.radius = 100;
//    // And add a bit more spacing
//    pieChart.bandSpacing = 8;
//
//  band1 = [[TTWKPieChartBand alloc] init];
//    band1.caption = @"Expense";
//    band1.icon = [UIImage imageNamed:@"test-icon-1"];
//    band1.startColor = [UIColor colorWithRed:1.0000 green:0.0941 blue:0.0392 alpha:1.0];
//    band1.endColor = [UIColor colorWithRed:1.0000 green:0.0275 blue:0.6392 alpha:1.0];
//
//
//    band2 = [[TTWKPieChartBand alloc] init];
//    band2.caption = @"Income";
//    band2.icon = [UIImage imageNamed:@"test-icon-2"];
//    band2.startColor = [UIColor colorWithRed:0.0275 green:0.8980 blue:0.9765 alpha:1.0];
//    band2.endColor = [UIColor colorWithRed:0.0314 green:0.9961 blue:0.9059 alpha:1.0];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    _incomeView.hidden = false;
    _expenseView.hidden = true;
    _monthlyView.hidden = true;
    _chartView.hidden = true;
    
    [_dailyButton setBackgroundColor: [UIColor colorWithRed:68.0/255.0 green:58.0/255.0 blue:202.0/255.0 alpha:1.0]];
    
    [_monthlyButton setBackgroundColor: [UIColor colorWithRed:88.0/255.0 green:116.0/255.0 blue:244.0/255.0 alpha:1.0]];
    
    self.navigationController.navigationBar.hidden = true;
    
    
    int e = [DEData getTotalExpense];
    int i = [DEData getTotalIncome];

    
    _remainingAmount.text = [NSString stringWithFormat:@"Balance : %d",(i-e)];
    _totalIncome.text = [NSString stringWithFormat:@"%d",i];
    _totalExpense.text = [NSString stringWithFormat:@"%d",e];

    
    
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
    
    NSInteger day = [components day];
    NSInteger month1 = [components month];
    NSInteger year = [components year];
    
    month1 = month1 -1;
    
    if (day == 1)
    {
        if (i == 0 && e == 0)
        {
            
        }
        else
        {
            if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"already"] isEqualToString:@"NO"])
            {
                [DEData addMonthlyData:[NSString stringWithFormat:@"%d",i] setExpense:[NSString stringWithFormat:@"%d",e] setmonth:[self getMonth:month1] setsavings:[NSString stringWithFormat:@"%d",(i-e)]];
                
                [DEData removeDailyData];
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"already"];
            }
        }
    }
    
    if (day == 2)
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"already"];
    }
    
    
    
    
    
    int e2 = [DEData getTotalExpense];
    int i2 = [DEData getTotalIncome];
    
    
    _remainingAmount.text = [NSString stringWithFormat:@"%d",(i2-e2)];
    _totalIncome.text = [NSString stringWithFormat:@"%d",i2];
    _totalExpense.text = [NSString stringWithFormat:@"%d",e2];
    
    income = [DEData getIncomeArray];
    [_incomeTable reloadData];
    
    expense = [DEData getExpenseArray];
    [_expenseTable reloadData];
    
    month = [DEData getMonthlyData];
    
    if (month.count > 0)
    {
        _nodata.hidden = true;
    }
    else
    {
         _nodata.hidden = false;
    }
    [_monthlyTable reloadData];
    
    
}


-(NSString*)getMonth:(NSInteger) m
{
    if (m == 0)
    {
        return @"December";
    }
    else if (m == 1)
    {
        return @"January";
    }
    else if (m == 2)
    {
        return @"Febraury";
    }
    else if (m == 3)
    {
        return @"March";
    }
    else if (m == 4)
    {
        return @"April";
    }
    else if (m == 5)
    {
        return @"May";
    }
    else if (m == 6)
    {
        return @"June";
    }
    else if (m == 7)
    {
        return @"July";
    }
    else if (m == 8)
    {
        return @"August";
    }
    else if (m == 9)
    {
        return @"September";
    }
    else if (m == 10)
    {
        return @"October";
    }
    else if (m == 11)
    {
        return @"November";
    }
    else
    {
        return @"December";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _incomeTable)
    {
        return income.count;
    }
    else if (tableView == _expenseTable)
    {
        return expense.count;
    }
    else
    {
        return month.count;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    if (tableView == _incomeTable)
    {
        cell1 * cell = [tableView dequeueReusableCellWithIdentifier:@"incomeCell"];
        
        cell.titleName.text = [[income objectAtIndex:indexPath.row] valueForKey:@"title"];
        cell.amountLabel.text = [[income objectAtIndex:indexPath.row] valueForKey:@"amount"];
        cell.dateLabel.text = [[income objectAtIndex:indexPath.row] valueForKey:@"date"];
        
        return cell;
        
    }
    else if (tableView == _expenseTable)
    {
        cell1 * cell = [tableView dequeueReusableCellWithIdentifier:@"expenseCell"];
        
        cell.titleName.text = [[expense objectAtIndex:indexPath.row] valueForKey:@"title"];
        cell.amountLabel.text = [[expense objectAtIndex:indexPath.row] valueForKey:@"amount"];
        cell.dateLabel.text = [[expense objectAtIndex:indexPath.row] valueForKey:@"date"];
        
        return cell;
    }
    else
    {
        monthCell * cell = [tableView dequeueReusableCellWithIdentifier:@"monthCell"];
        
        cell.income.text = [[month objectAtIndex:indexPath.row] valueForKey:@"income"];
        cell.expense.text = [[month objectAtIndex:indexPath.row] valueForKey:@"expense"];
        cell.savings.text = [[month objectAtIndex:indexPath.row] valueForKey:@"savings"];
        
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _incomeTable)
    {
        return 60;
    }
    else if (tableView == _expenseTable)
    {
        return 60;
    }
    else
    {
        return 120;
    }
}



- (IBAction)dailyButtonTouchd:(id)sender
{
    _incomeView.hidden = false;
    _expenseView.hidden = true;
    _monthlyView.hidden = true;
    _chartView.hidden = true;
    
    
    _addIncomeButton.hidden = false;
    _addExpenseButton.hidden = true;
    
    [_dailyButton setBackgroundColor: [UIColor colorWithRed:68.0/255.0 green:58.0/255.0 blue:202.0/255.0 alpha:1.0]];
    
    [_monthlyButton setBackgroundColor: [UIColor colorWithRed:88.0/255.0 green:116.0/255.0 blue:244.0/255.0 alpha:1.0]];
}

- (IBAction)monthlyButtonTouched:(id)sender
{
    
    
    
    _incomeView.hidden = true;
    _expenseView.hidden = true;
     _monthlyView.hidden = false;
    _chartView.hidden = true;
    
    [_monthlyButton setBackgroundColor: [UIColor colorWithRed:68.0/255.0 green:58.0/255.0 blue:202.0/255.0 alpha:1.0]];
    
    [_dailyButton setBackgroundColor: [UIColor colorWithRed:88.0/255.0 green:116.0/255.0 blue:244.0/255.0 alpha:1.0]];
    
    
    
    
    
    
}

- (IBAction)addIncomeButtonTouched:(id)sender
{
    AddIncomeVC * v = [self.storyboard instantiateViewControllerWithIdentifier:@"AddIncomeVC"];
    
    [self.navigationController pushViewController:v animated:YES];
}

- (IBAction)addExpenseButtonTouched:(id)sender
{
    AddExpenseVC * v = [self.storyboard instantiateViewControllerWithIdentifier:@"AddExpenseVC"];
    
    [self.navigationController pushViewController:v animated:YES];
}
- (IBAction)addToHistory:(id)sender
{
    Hcount = Hcount + 1;
    
    int e = [DEData getTotalExpense];
    int i = [DEData getTotalIncome];
    
    [DEData addMonthlyData:[NSString stringWithFormat:@"%d",i] setExpense:[NSString stringWithFormat:@"%d",e] setmonth:[NSString stringWithFormat:@"History %d", Hcount] setsavings:[NSString stringWithFormat:@"%d",(i-e)]];
    
    [DEData removeDailyData];
    
    
    
    _remainingAmount.text = [NSString stringWithFormat:@"Balance : %d",(i-e)];
    _totalIncome.text = [NSString stringWithFormat:@"%d",i];
    _totalExpense.text = [NSString stringWithFormat:@"%d",e];
    
    
    
    int e2 = [DEData getTotalExpense];
    int i2 = [DEData getTotalIncome];
    
    
    _remainingAmount.text = [NSString stringWithFormat:@"%d",(i2-e2)];
    _totalIncome.text = [NSString stringWithFormat:@"%d",i2];
    _totalExpense.text = [NSString stringWithFormat:@"%d",e2];
    
    income = [DEData getIncomeArray];
    [_incomeTable reloadData];
    
    expense = [DEData getExpenseArray];
    [_expenseTable reloadData];
    
    month = [DEData getMonthlyData];
    
    if (month.count > 0)
    {
        _nodata.hidden = true;
    }
    else
    {
        _nodata.hidden = false;
    }
    [_monthlyTable reloadData];
}
- (IBAction)expenseButtonTouched:(id)sender
{
    _incomeView.hidden = true;
    _expenseView.hidden = false;
    _monthlyView.hidden = true;
    
    _chartView.hidden = true;
    
    _addIncomeButton.hidden = true;
    _addExpenseButton.hidden = false;
}

- (IBAction)chartButtonTouched:(id)sender
{
    _incomeView.hidden = true;
    _expenseView.hidden = true;
    _monthlyView.hidden = true;
    
    _chartView.hidden = false;
    
    
    
   
}

- (IBAction)notesButtonTpuched:(id)sender
{
    ViewController22222 * v = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController22222"];
    
    [self.navigationController pushViewController:v animated:YES];
    
}
- (IBAction)generateChart:(id)sender
{
    
    double e = [DEData getTotalExpense];
    double i = [DEData getTotalIncome];
    
    
    double e1 = e / (i - 1);
    double i1 =  i / (i+e);
    
    
    _pieChartView = [[DYPieChartView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    //_pieChartView.backgroundColor = [UIColor lightGrayColor];
    _pieChartView.startAngle = -M_PI/2;
    _pieChartView.clockwise = NO;
    //_pieChartView.lineWidth = @(10);
    _pieChartView.center = self.view.center;
    _pieChartView.sectorColors = @[MakeColor(37, 147, 80),
                                   MakeColor(148, 17, 0)];
    [self.chartView addSubview:_pieChartView];
    
    
    
    //type 1: for duration
    [_pieChartView animateToScaleValues:@[@(i1), @(e1)]
                               duration:2];
}
@end
