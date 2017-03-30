//
//  ASDisplayNode+Helper.m
//  AsyncDisplayKitPlayground
//
//  Created by LinXi on 30/03/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import "ASDisplayNode+Helper.h"

@implementation ASDisplayNode (Helper)

+ (ASDisplayNode *)nodeWithBackgroundColor:(UIColor *)backgroundColor
                                      size:(CGSize)size {
  ASDisplayNode *node = [[ASDisplayNode alloc] init];
  node.layerBacked = YES;
  node.backgroundColor = backgroundColor;
  node.style.width = ASDimensionMakeWithPoints(size.width);
  node.style.height = ASDimensionMakeWithPoints(size.height);
  return node;
}

@end
