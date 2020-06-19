//
//  UITextField+JGFormatNumber.m
//  JGUITextField_FormatNumber
//
//  Created by 郭军 on 2018/6/30.
//  Copyright © 2018年 JG. All rights reserved.
//

#import "UITextField+JGFormatNumber.h"

//手机号长度
#define KPhoneNumLength 11
//身份证号最大长度
#define KIDLength 18
//银行卡号最大长度
#define KBankcardNumLength 24
//手机号334格式空格处光标所处位置长度分别为3，8
#define KPhoneNumFirstPoint 3
#define KPhoneNumSecondPoint 8
//身份证号684格式空格处光标所处位置分别为6，15
#define KIDNumFirstPoint 6
#define KIDNumSecondPoint 15
//银行卡证号684格式空格处光标所处位置分别为4，9，14，19，24
#define KBankcardNumFirstPoint 4
#define KBankcardNumSecondPoint 9
#define KBankcardNumThirdPoint 14
#define KBankcardNumFourthPoint 19
#define KBankcardNumFifthPoint 24


@implementation UITextField (JGFormatNumber)


/**
 *  输入号码格式化
 *  参数 textField UITextField控件
 *  参数 range 文本范围
 *  参数 string 字符串
 *  参数 type 文本框输入号码类型（身份证，手机号，银行卡）
 */
+ (BOOL)numberFormatTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string textFieldType:(kTextFieldType)type
{
//    JGLog(@"%@",NSStringFromRange(range));
    if (textField) {
        NSString *text = textField.text;
        //删除
        if([string isEqualToString:@""]){
            
            //删除一位
            if(range.length == 1){
                //最后一位,遇到空格则多删除一次
                if (range.location == text.length-1 ) {
                    //                    if ([text characterAtIndex:text.length-1] == ' ') {
                    //                        [textField deleteBackward];
                    //                    }
                    
                    return YES;
                }
                //从中间删除
                else{
                    NSInteger offset = range.location;
                    
                    if (range.location < text.length && [text characterAtIndex:range.location] == ' ' && [textField.selectedTextRange isEmpty]) {
                        [textField deleteBackward];
                        
                        offset --;
                    }
                    
                    [textField deleteBackward];
                    
                    textField.text = [self insertString:textField.text withTextFieldType:type];
                    UITextPosition *newPos = [textField positionFromPosition:textField.beginningOfDocument offset:offset];
                    
                    textField.selectedTextRange = [textField textRangeFromPosition:newPos toPosition:newPos];
                    return NO;
                }
            }
            else if (range.length > 1) {
                BOOL isLast = NO;
                //如果是从最后一位开始删除
                if(range.location + range.length == textField.text.length ){
                    isLast = YES;
                }
                [textField deleteBackward];
                textField.text = [self insertString:textField.text withTextFieldType:type];
                
                NSInteger offset = range.location;
                
                [self shouldChangeCharactersInRange:range textFieldType:type locationOffset:offset];
                
                if (isLast) {
                    //光标直接在最后一位了
                }else{
                    UITextPosition *newPos = [textField positionFromPosition:textField.beginningOfDocument offset:offset];
                    textField.selectedTextRange = [textField textRangeFromPosition:newPos toPosition:newPos];
                }
                
                return NO;
            }
            
            else{
                return YES;
            }
        }else if(string.length >0){
            
            
            if (type == kIDCardNoTextFieldType) {
                //限制输入字符个数
                if (([self whiteSpaseString:textField.text].length + string.length - range.length > KIDLength) ) {
                    return NO;
                }
                
            }else if (type == kPhoneNumberTextFieldType){
                
                //限制输入字符个数
                if (([self whiteSpaseString:textField.text].length + string.length - range.length > KPhoneNumLength) ) {
                    return NO;
                }
                
            }else{
                
                //限制输入字符个数
                if (([self whiteSpaseString:textField.text].length + string.length - range.length > KBankcardNumLength) ) {
                    return NO;
                }
                
            }
            
            [textField insertText:string];
            textField.text = [self insertString:textField.text withTextFieldType:type];
            //设置光标偏移量
            NSInteger offset = range.location + string.length;
            [self shouldChangeCharactersInRange:range textFieldType:type locationOffset:offset];
            
            if (type == kIDCardNoTextFieldType) {
                if (range.location == KIDNumFirstPoint || range.location  == KIDNumSecondPoint) {
                    offset ++;
                }
            }else if (type == kPhoneNumberTextFieldType){
                if (range.location == KPhoneNumFirstPoint || range.location  == KPhoneNumSecondPoint) {
                    offset ++;
                }
                
            }else{
                
                if (range.location == KBankcardNumFirstPoint || range.location  == KBankcardNumSecondPoint || range.location == KBankcardNumThirdPoint || range.location  == KBankcardNumFourthPoint || range.location == KBankcardNumFifthPoint) {
                    offset ++;
                }
                
            }
            UITextPosition *newPos = [textField positionFromPosition:textField.beginningOfDocument offset:offset];
            textField.selectedTextRange = [textField textRangeFromPosition:newPos toPosition:newPos];
            return NO;
        }else{
            return YES;
        }
        
    }
    
    return YES;
    
}

//输入相应位数后面增加空格
+(NSString*)insertString:(NSString*)string withTextFieldType:(kTextFieldType)type
{
    if (!string) {
        return nil;
    }
    NSMutableString* tStr = [NSMutableString stringWithString:[string stringByReplacingOccurrencesOfString:@" " withString:@""]];
    if (type == kIDCardNoTextFieldType) {
        //身份证号
        if (tStr.length >KIDNumFirstPoint) {
            [tStr insertString:@" " atIndex:KIDNumFirstPoint];
        }if (tStr.length > KIDNumSecondPoint) {
            [tStr insertString:@" " atIndex:KIDNumSecondPoint];
            
        }
    }else if (type == kPhoneNumberTextFieldType){
        
        //手机号
        if (tStr.length >KPhoneNumFirstPoint) {
            [tStr insertString:@" " atIndex:KPhoneNumFirstPoint];
        }if (tStr.length > KPhoneNumSecondPoint) {
            [tStr insertString:@" " atIndex:KPhoneNumSecondPoint];
            
        }
        
    }else{
        
        //银行卡号
        if (tStr.length >KBankcardNumFirstPoint) {
            [tStr insertString:@" " atIndex:KBankcardNumFirstPoint];
        }if (tStr.length > KBankcardNumSecondPoint) {
            [tStr insertString:@" " atIndex:KBankcardNumSecondPoint];
            
        } if (tStr.length >KBankcardNumThirdPoint) {
            [tStr insertString:@" " atIndex:KBankcardNumThirdPoint];
        }if (tStr.length > KBankcardNumFourthPoint) {
            [tStr insertString:@" " atIndex:KBankcardNumFourthPoint];
            
        }if (tStr.length >KBankcardNumFifthPoint) {
            [tStr insertString:@" " atIndex:KBankcardNumFifthPoint];
        }
        
    }
    
    return  tStr;
}

//设置光标位置
+(void)shouldChangeCharactersInRange:(NSRange)range  textFieldType:(kTextFieldType)type locationOffset:(NSInteger)offset{
    
    if (type == kIDCardNoTextFieldType) {
        if (range.location == KIDNumFirstPoint || range.location  == KIDNumSecondPoint) {
            offset ++;
        }
    }else if (type == kPhoneNumberTextFieldType){
        if (range.location == KPhoneNumFirstPoint || range.location  == KPhoneNumSecondPoint) {
            offset ++;
        }
        
    }else{
        
        if (range.location == KBankcardNumFirstPoint || range.location  == KBankcardNumSecondPoint || range.location == KBankcardNumThirdPoint || range.location  == KBankcardNumFourthPoint || range.location  == KBankcardNumFifthPoint) {
            offset ++;
        }
        
    }
}
//去除空格
+(NSString*)whiteSpaseString:(NSString*)string
{
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
}





@end
