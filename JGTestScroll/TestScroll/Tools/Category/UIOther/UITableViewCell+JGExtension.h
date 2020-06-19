//
//  UITableViewCell+JGExtension.h
//  FileConversion
//
//  Created by 郭军 on 2019/9/10.
//  Copyright © 2019 JG. All rights reserved.
//


/*
 // 注册cell
 [self.tableView jg_registerCell:@"UITableViewCell"];
 
 // 获取cell (可以通过Class和字符串 推荐用class)
 textCell *cell = [tableView jg_dequeueReusableCell:[textCell class] and:indexPath];
 textCell *cell = [tableView jg_dequeueReusableCell:@"textCell" and:indexPath];
 
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (JGExtension)

/**
 快速获取注册cellid
 @return 注册的类名+ID
 */
+ (NSString *)jg_identifier;
@end


@interface UITableView (JGExtension)
/**
 快速注册cell 根据传入的cellName自动判断是注册的xib还是Class
 @param cell cell的class 或者cell字符串
 */
- (void)jg_registerCell:(id)cell;

/**
 快速获取cell 可以不用注册 内部自动判断是否注册 未注册自动注册
 
 @param cell cell的class 或者cell字符串 (推荐用class类型)
 @param indexPath 对应的NSIndexPath
 @return cell
 */
- (id)jg_dequeueReusableCell:(id)cell and:(NSIndexPath *)indexPath;
@end



NS_ASSUME_NONNULL_END
