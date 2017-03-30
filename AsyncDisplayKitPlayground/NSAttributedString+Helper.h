//
//  NSAttributedString+Helper.h
//  AsyncDisplayKitPlayground
//
//  Created by LinXi on 30/03/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (Helper)

+ (NSAttributedString *)attributedStringWithContent:(NSString *)content
                                               font:(UIFont *)font
                                              color:(UIColor *)color;

@end
