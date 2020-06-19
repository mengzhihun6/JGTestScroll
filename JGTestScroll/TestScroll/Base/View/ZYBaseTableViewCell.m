//
//  ZYBaseTableViewCell.m
//  WSCollege
//
//  Created by spring on 2020/5/15.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYBaseTableViewCell.h"

@implementation ZYBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self configUI];
        
    }
    return self;
}


- (void)configUI {}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
