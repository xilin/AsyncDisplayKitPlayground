//
//  MainTextCellNode.m
//  AsyncDisplayKitPlayground
//
//  Created by LinXi on 30/03/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import "MainTextCellNode.h"
#import "NSAttributedString+Helper.h"

@interface MainTextCellNode ()

@property(nonatomic, strong) ASTextNode *textNode;

@end

@implementation MainTextCellNode

- (instancetype)initWithContent:(NSString *)content {
  if (self = [super init]) {
    _textNode = [ASTextNode new];
    _textNode.attributedText =
        [NSAttributedString mt_attributedStringWithContent:content
                                                      font:nil
                                                     color:nil];
    [self addSubnode:_textNode];
  }
  return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
  ASStackLayoutSpec *verticalStackLayoutSpec =
      [ASStackLayoutSpec verticalStackLayoutSpec];
  verticalStackLayoutSpec.alignItems = ASStackLayoutAlignItemsStart;
  verticalStackLayoutSpec.spacing = 5.0;
  verticalStackLayoutSpec.children = @[ self.textNode ];

  return [ASInsetLayoutSpec
      insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 16, 10, 10)
                          child:verticalStackLayoutSpec];
}

@end
