//
//  DetailViewController.m
//  SQLiteDemo
//
//  Created by ThuyPH on 11/8/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import "DetailViewController.h"
#import "NewWordViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateData{
    _japaneseLabel.text = _selectedWord.japanese;
    _vietnameseLabel.text = _selectedWord.vietnamese;
    _exampleTextView.text = _selectedWord.example;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"pushToEditWord"]) {
         NewWordViewController *newWordVC = (NewWordViewController *)[segue destinationViewController];
        newWordVC.selectedWord = _selectedWord;
    }
}


@end
