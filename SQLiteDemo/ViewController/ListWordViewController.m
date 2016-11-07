//
//  ListBookViewController.m
//  SQLLiteDemo
//
//  Created by ThuyPH on 11/2/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import "ListWordViewController.h"
#import "WordModel.h"

@interface ListWordViewController ()
{
    NSMutableArray *arrWord;
    DatabaseModel *databaseModel;
    AppDelegate *appdelegate;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"wordCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    WordModel *wordModel = [arrWord objectAtIndex:indexPath.row];
    cell.textLabel.text = wordModel.japanese;
    cell.detailTextLabel.text = wordModel.vietnamese;
    return cell;
}

- (void) reloadListWord{
    if (arrWord.count > 0) {
        [arrWord removeAllObjects];
    }
    [arrWord addObjectsFromArray:[DatabaseModel getListWordWithUserId:appdelegate.currentUser.userId]];
    [_listWordTableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
