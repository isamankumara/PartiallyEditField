//
//  PartiallyEditField.m
//  PartiallyEditField Example
//
//  Created by Saman kumara on 9/11/17.
//  Copyright © 2017 Saman Weerasinghe. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//https://www.isamankumara.com
//


#import "PartiallyEditField.h"


@interface PartiallyEditField() {
    NSString *prevText;
    UITextRange *prevTextRange;
    UIColor *originalColor;
}

@property (nonatomic, strong) UIFont *preTextFont;
@property (nonatomic, strong) UIColor *preTextColor;
@property (nonatomic, strong) NSString *preText;
@property (nonatomic, strong) NSMutableAttributedString * atributedPlaceHolderString;

@end

@implementation PartiallyEditField

-(void)setupWithPreText:(NSString *)preText {
    self.preText = preText;
    prevText = self.text;
    originalColor = self.textColor;
    if (self.preTextSide == kNone) {
        self.preTextSide = kRight;
    }

    [self addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
    [self createAtributedPlaceHolder];
}

-(void)setupWithPreText:(NSString *)preText color:(UIColor *)color {
    self.preTextColor = color;
    [self setupWithPreText:preText];
}

-(void)textChanged:(PartiallyEditField *) sender {
    if (![self.text isEqualToString:@""]) {
        if ([self.text isEqualToString:self.preText]) {
            self.text = @"";
            prevText = @"";
            return;
        }
        if ([prevText isEqualToString:@""]) {
            if(self.preTextSide == kLeft) {
                self.text = [NSString stringWithFormat:@"%@%@", self.preText,  self.text];
            } else {
                self.text = [NSString stringWithFormat:@"%@%@", self.text, self.preText];
            }
            prevText = self.text;
        }
        
        NSRange range = [self.text rangeOfString:self.preText];
        
         if(self.preTextSide == kLeft) {
             if ([self.text containsString:self.preText] && range.location == 0) {
                 prevText = self.text;
             } else {
                 self.text = prevText;
             }
         } else {
             if (([self.text containsString:self.preText] && ((int)range.location + (int)range.length) >= (int)self.text.length)) {
                 prevText = self.text;
             } else {
                 self.text = prevText;
             }
         }

        [self createAtributedText];
        [self changeRangeToBegin];
    }
}

-(void)changeRangeToBegin {
    NSRange range = [self.text rangeOfString:self.preText];
    
    NSInteger idx = [self offsetFromPosition:self.beginningOfDocument toPosition:prevTextRange.start];

    if (self.preTextSide == kLeft) {
        if (idx > (range.location + range.length)) {
            [self setSelectedTextRange:prevTextRange];
        }else {
            UITextPosition *end = [self positionFromPosition:self.beginningOfDocument offset:range.location];
            [self setSelectedTextRange:[self textRangeFromPosition:end toPosition:end]];
        }
    } else {
        if (idx >= (range.location + range.length)) {
            UITextPosition *end = [self positionFromPosition:self.beginningOfDocument offset:range.location];
            [self setSelectedTextRange:[self textRangeFromPosition:end toPosition:end]];
        }else {
            [self setSelectedTextRange:prevTextRange];
        }
    }
}

-(void)createAtributedPlaceHolder {
    NSString *placeHolderText = [NSString stringWithFormat:@"%@%@", [self.placeholder stringByReplacingOccurrencesOfString:self.preText withString:@""], self.preText];
    if (self.preTextSide == kLeft) {
        placeHolderText = [NSString stringWithFormat:@"%@%@", self.preText, [self.placeholder stringByReplacingOccurrencesOfString:self.preText withString:@""]];
    }
    
    [self setAttributedPlaceholder:[self atrributeTextFromText:placeHolderText isText:NO]];
}

-(NSMutableAttributedString *)atrributeTextFromText:(NSString *)str isText:(BOOL)isText{

    NSRange range = [str rangeOfString:self.preText];
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:str];
   
    if (isText) {
        [string addAttribute:NSForegroundColorAttributeName value:originalColor range:NSMakeRange(0, str.length)];
 
    } else {
        if (self.placeHolderColor) {
            [string addAttribute:NSForegroundColorAttributeName value:self.placeHolderColor range:NSMakeRange(0, str.length)];
        }
    }
    
    if (self.preTextColor) {
        [string addAttribute:NSForegroundColorAttributeName value:self.preTextColor range:range];
    }
    
    return string;
}

-(void)createAtributedText {
    prevTextRange = self.selectedTextRange;
    [self setAttributedText:[self atrributeTextFromText:self.text isText:YES]];
}

-(void)setPreTextSide:(PreTextSide)preTextSide {
    self ->_preTextSide = preTextSide;
    if (self.preText) {
        [self createAtributedPlaceHolder];
    }
}

-(void)setPlaceHolderColor:(UIColor *)placeHolderColor {
    self -> _placeHolderColor = placeHolderColor;
    if (self.preText) {
        [self createAtributedPlaceHolder];
    }
}

@end
