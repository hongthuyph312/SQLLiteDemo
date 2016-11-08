//
//  ListWordTableViewCell.m
//  SQLiteDemo
//
//  Created by ThuyPH on 11/8/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import "ListWordTableViewCell.h"

@implementation ListWordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupCell:(WordModel *)wordModel{
    _japaneseLabel.text = wordModel.japanese;
    _vietnameseLabel.text = wordModel.vietnamese;
}

+ (CGFloat)heightForCell:(WordModel *)wordModel{
    CGFloat height = 0;
    UIFont *font = [UIFont systemFontOfSize:14];
    CGFloat heightJP = [Common heightForViewWithText:wordModel.japanese andFont:font andSizeWidth:WIDTH_SCREEN/2];
    CGFloat heightVN = [Common heightForViewWithText:wordModel.vietnamese andFont:font andSizeWidth:WIDTH_SCREEN/2 - 30];
    height = (heightJP>heightVN?heightJP:heightVN) + 20;
    return height>44?height:44;
}

@end
