//
//  NSAttributedString+Helper.m
//  AsyncDisplayKitPlayground
//
//  Created by LinXi on 30/03/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import "NSAttributedString+Helper.h"

@implementation NSAttributedString (Helper)

+ (NSAttributedString *)mt_attributedStringWithContent:(NSString *)content
                                                  font:(UIFont *)font
                                                 color:(UIColor *)color {
  if (!color) {
    color = [UIColor darkGrayColor];
  }
  if (!font) {
    font = [UIFont systemFontOfSize:18];
  }
  return
      [[NSAttributedString alloc] initWithString:content
                                      attributes:@{
                                        NSForegroundColorAttributeName : color,
                                        NSFontAttributeName : font
                                      }];
}

@end
