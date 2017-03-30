//
//  FlexWrapCellNode.m
//  AsyncDisplayKitPlayground
//
//  Created by LinXi on 30/03/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import "ASDisplayNode+Helper.h"
#import "FlexWrapCellNode.h"
#import "NSAttributedString+Helper.h"

@interface FlexWrapCellNode ()

@property(nonatomic, strong) NSArray<ASDisplayNode *> *nodeArray;
@property(nonatomic, assign) CGFloat spacing;

@end

@implementation FlexWrapCellNode

- (instancetype)initWithSpacing:(CGFloat)spacing {
  if (self = [super init]) {
    _spacing = spacing;

    CGSize subnodeSize = {70, 70};
    NSArray<ASDisplayNode *> *subnodes = @[
      [ASDisplayNode nodeWithBackgroundColor:[UIColor redColor]
                                        size:subnodeSize],
      [ASDisplayNode nodeWithBackgroundColor:[UIColor blueColor]
                                        size:subnodeSize],
      [ASDisplayNode nodeWithBackgroundColor:[UIColor blackColor]
                                        size:subnodeSize],
      [ASDisplayNode nodeWithBackgroundColor:[UIColor yellowColor]
                                        size:subnodeSize],
      [ASDisplayNode nodeWithBackgroundColor:[UIColor orangeColor]
                                        size:subnodeSize],
      [ASDisplayNode nodeWithBackgroundColor:[UIColor greenColor]
                                        size:subnodeSize],
      [ASDisplayNode nodeWithBackgroundColor:[UIColor grayColor]
                                        size:subnodeSize],
    ];
    [subnodes
        enumerateObjectsUsingBlock:^(ASDisplayNode *_Nonnull obj,
                                     NSUInteger idx, BOOL *_Nonnull stop) {
          [self addSubnode:obj];
        }];
    _nodeArray = subnodes;
  }
  return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
  ASStackLayoutSpec *stackSpec = [[ASStackLayoutSpec alloc] init];
  stackSpec.direction = ASStackLayoutDirectionHorizontal;
  stackSpec.children = self.nodeArray;
  stackSpec.justifyContent = ASStackLayoutJustifyContentSpaceAround;
  stackSpec.alignItems = ASStackLayoutAlignItemsCenter;
  stackSpec.alignContent = ASStackLayoutAlignContentSpaceAround;
  stackSpec.flexWrap = ASStackLayoutFlexWrapWrap;
  stackSpec.spacing = self.spacing;
  stackSpec.style.height = ASDimensionMake([self cellHeight]);

  return stackSpec;
}

- (CGFloat)cellHeight {
  NSInteger rowCount =
      self.nodeArray.count / 4 + ((self.nodeArray.count % 4) > 0 ? 1 : 0);
  return rowCount * 80;
}

@end
