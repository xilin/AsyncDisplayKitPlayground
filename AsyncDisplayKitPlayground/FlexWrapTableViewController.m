//
//  FlexWrapTableViewController.m
//  AsyncDisplayKitPlayground
//
//  Created by LinXi on 30/03/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import "FlexWrapCellNode.h"
#import "FlexWrapTableViewController.h"

@interface FlexWrapTableViewController ()<ASTableDelegate, ASTableDataSource>

@property(nonatomic, strong) ASTableNode* tableNode;

@end

@implementation FlexWrapTableViewController

- (instancetype)init {
  if (self = [super init]) {
    _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    _tableNode.delegate = self;
    _tableNode.dataSource = self;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self.view addSubnode:self.tableNode];
}

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];

  self.tableNode.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - ASTableNode delegate&datasource
- (NSInteger)numberOfSectionsInTableNode:(ASTableNode*)tableNode {
  return 1;
}

- (NSInteger)tableNode:(ASTableNode*)tableNode
 numberOfRowsInSection:(NSInteger)section {
  return 1;
}

- (ASCellNodeBlock)tableView:(ASTableView*)tableView
  nodeBlockForRowAtIndexPath:(NSIndexPath*)indexPath {
  return ^{
    FlexWrapCellNode* cellNode = [[FlexWrapCellNode alloc] init];
    return cellNode;
  };
}

@end
