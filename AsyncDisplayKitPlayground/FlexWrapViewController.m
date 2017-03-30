//
//  FlexWrapViewController.m
//  AsyncDisplayKitPlayground
//
//  Created by LinXi on 30/03/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import "ASDisplayNode+Helper.h"
#import "FlexWrapViewController.h"

@interface FlexWrapViewController ()

@property(nonatomic, strong) ASDisplayNode *topNode;

@end

@implementation FlexWrapViewController

- (instancetype)init {
  if (self = [super init]) {
    [self setupNode];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.

  [self.view addSubnode:self.topNode];
}

- (void)setupNode {
  ASDisplayNode *topNode = [ASDisplayNode new];

  CGSize subnodeSize = {70, 70};
  NSArray<ASDisplayNode *> *subnodes = @[
    [ASDisplayNode nodeWithBackgroundColor:[UIColor redColor] size:subnodeSize],
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

  [subnodes enumerateObjectsUsingBlock:^(ASDisplayNode *_Nonnull obj,
                                         NSUInteger idx, BOOL *_Nonnull stop) {
    [topNode addSubnode:obj];
  }];

  ASStackLayoutSpec *spec = [ASStackLayoutSpec
      stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                           spacing:30.f
                    justifyContent:ASStackLayoutJustifyContentSpaceAround
                        alignItems:ASStackLayoutAlignItemsCenter
                          flexWrap:ASStackLayoutFlexWrapWrap
                      alignContent:ASStackLayoutAlignContentSpaceAround
                          children:subnodes];

  topNode.layoutSpecBlock = ^ASLayoutSpec *_Nonnull(
      __kindof ASDisplayNode *_Nonnull node, ASSizeRange constrainedSize) {
    spec.style.width = ASDimensionMake(constrainedSize.max.width);
    return spec;
  };
  topNode.style.preferredSize = CGSizeMake(300, 300);
  self.topNode = topNode;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
  self.topNode.frame = self.view.frame;
}
@end
