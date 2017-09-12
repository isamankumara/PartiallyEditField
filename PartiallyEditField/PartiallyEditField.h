//
//  PartiallyEditField.h
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

#import <UIKit/UIKit.h>

typedef enum {
    kNone,
    kLeft,
    kRight
} PreTextSide;

/**
 *  The PartiallyEditField will generate pretext for the textfield.
 */
@interface PartiallyEditField : UITextField {

}
/**
 *  The side that you want append for pretext.
 */
@property (nonatomic, assign) PreTextSide preTextSide;

@property (nonatomic, strong) UIColor *placeHolderColor;
/**
 *  This method will help to downlaod image with complete block. Block response will be an image.
 *
 *  @param string The pre text that you wanted to append.
 */
-(void)setupWithPreText:(NSString *)string;


/**
 *  This method will help to downlaod image with complete block. Block response will be an image.
 *
 *  @param string The pre text that you wanted to append.
 *  @param color The text color for pretext that you wanted.
 */
-(void)setupWithPreText:(NSString *)string color:(UIColor *)color;

@end
