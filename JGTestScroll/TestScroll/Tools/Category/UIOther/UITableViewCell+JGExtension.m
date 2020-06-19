//
//  UITableViewCell+JGExtension.m
//  FileConversion
//
//  Created by 郭军 on 2019/9/10.
//  Copyright © 2019 JG. All rights reserved.
//

#import "UITableViewCell+JGExtension.h"

@implementation UITableViewCell (JGExtension)
/**
 快速获取注册cellid
 @return 注册的类名+ID
 */
+ (NSString *)jg_identifier {
    return [NSString stringWithFormat:@"%@ID",NSStringFromClass([self class])];
}

@end

@implementation UITableView (JGExtension)

/**
 快速注册cell 根据传入的cellName自动判断是注册的xib还是Class
 @param cell cell的class 或者cell字符串
 */
- (void)jg_registerCell:(id)cell {
    NSString *cellName = [self getCellName:cell];
    NSString *reuseIdentifier = [NSString stringWithFormat:@"%@ID", cellName];
    if ([self jg_getNibPath:cellName]) {
        [self registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellReuseIdentifier:reuseIdentifier];
    } else {
        [self registerClass:NSClassFromString(cellName) forCellReuseIdentifier:reuseIdentifier];
    }
}

/**
 快速获取cell 可以不用注册 内部自动判断是否注册 未注册自动注册
 
 @param cell cell的class 或者cell字符串 (推荐用class类型)
 @param indexPath 对应的NSIndexPath
 @return cell
 */
- (id)jg_dequeueReusableCell:(id)cell and:(NSIndexPath *)indexPath {
    NSString *cellName = [self getCellName:cell];
    NSString *reuseIdentifier = (NSString *)[NSString stringWithFormat:@"%@ID", cellName];
    UITableViewCell *newCell = [self dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (newCell == nil) {
        [self jg_registerCell:cell];
    }
    return [self dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
}

//获取cellName
- (NSString *)getCellName:(id)cell {
    NSString *cellName;
    if ([cell isKindOfClass:[NSString class]]) {
        cellName = cell;
    } else {
        cellName = NSStringFromClass(cell);
    }
    return  cellName;
}

// 通过判断nib是否存在来确认注册方式
- (BOOL)jg_getNibPath:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"nib"];
    if (path == nil) { // 路径不存在
        return NO;
    } else { // 路径存在
        return YES;
    }
}



@end
