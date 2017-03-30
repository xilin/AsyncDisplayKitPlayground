//
//  FlexWrapChildInsetCellNode.m
//  AsyncDisplayKitPlayground
//
//  Created by LinXi on 30/03/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import "ASDisplayNode+Helper.h"
#import "FlexWrapChildInsetCellNode.h"

@interface FlexWrapChildInsetCellNode ()

@property(nonatomic, strong) NSArray<ASDisplayNode *> *nodeArray;
@property(nonatomic, assign) CGFloat spacing;

@end

@implementation FlexWrapChildInsetCellNode

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
  NSMutableArray *layout = [NSMutableArray array];
  [self.nodeArray
      enumerateObjectsUsingBlock:^(ASDisplayNode *_Nonnull obj, NSUInteger idx,
                                   BOOL *_Nonnull stop) {
        ASInsetLayoutSpec *insetSpec = [ASInsetLayoutSpec
            insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 20, 10, 20)
                                child:obj];
        [layout addObject:insetSpec];
      }];

  ASStackLayoutSpec *stackSpec = [[ASStackLayoutSpec alloc] init];
  stackSpec.direction = ASStackLayoutDirectionHorizontal;
  stackSpec.children = layout;
  stackSpec.justifyContent = ASStackLayoutJustifyContentSpaceAround;
  stackSpec.alignItems = ASStackLayoutAlignItemsCenter;
  stackSpec.alignContent = ASStackLayoutAlignContentSpaceAround;
  stackSpec.flexWrap = ASStackLayoutFlexWrapWrap;
  stackSpec.spacing = self.spacing;

  return stackSpec;
}

@end
