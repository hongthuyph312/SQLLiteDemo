//
//  ListBookViewController.m
//  SQLLiteDemo
//
//  Created by ThuyPH on 11/2/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import "ListWordViewController.h"
#import "WordModel.h"
#import "ListWordTableViewCell.h"
#import "DetailViewController.h"

@interface ListWordViewController ()
{
    NSMutableArray *arrWord;
    DatabaseModel *databaseModel;
    AppDelegate *appdelegate;
    WordModel *selectedWord;
}
@end

@implementation ListWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _listWordTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    arrWord = [[NSMutableArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self reloadListWord];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addButton_clicked:(id)sender {
}

#pragma mark TableViewDelegate, TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  arrWord.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    WordModel *wordModel = [arrWord objectAtIndex:indexPath.row];
    return [ListWordTableViewCell heightForCell:wordModel];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"ListWordTableViewCell";
    ListWordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[ListWordTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    WordModel *wordModel = [arrWord objectAtIndex:indexPath.row];
    [cell setupCell:wordModel];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectedWord = [arrWord objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"pushToDetail" sender:self];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete Word
        WordModel *currentWord = [arrWord objectAtIndex:indexPath.row];
        BOOL isSuccess = [DatabaseModel deleteWord:currentWord.wordId];
        if (isSuccess == YES) {
            [self reloadListWord];
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Delete wrong" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}

- (void) reloadListWord{
    if (arrWord.count > 0) {
        [arrWord removeAllObjects];
    }
    [arrWord addObjectsFromArray:[DatabaseModel getListWordWithUserId:appdelegate.currentUser.userId]];
    [_listWordTableView reloadData];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"pushToDetail"]) {
        DetailViewController *detailVC = (DetailViewController *)[segue destinationViewController];
        detailVC.selectedWord = selectedWord;
    }
}

@end
