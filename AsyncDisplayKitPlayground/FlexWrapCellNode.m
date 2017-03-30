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

@end

@implementation FlexWrapCellNode

- (instancetype)init {
  if (self = [super init]) {
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
  stackSpec.spacing = 50;
  //    stackSpec.style.height = ASDimensionMake([self cellHeight]);

  return stackSpec;
}

@end
