//
//  ViewController.m
//  AsyncDisplayKitPlayground
//
//  Created by LinXi on 29/03/2017.
//  Copyright © 2017 MT. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "IndexViewController.h"
#import "MainTextCellNode.h"
#import "NSAttributedString+Helper.h"

@interface IndexViewController ()<ASTableDelegate, ASTableDataSource>

@property(nonatomic, strong) ASTableNode* tableNode;
@property(nonatomic, strong) NSArray<NSString*>* modelArray;

@end

@implementation IndexViewController

- (instancetype)init {
  if (self = [super init]) {
    _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    _tableNode.delegate = self;
    _tableNode.dataSource = self;
    _modelArray = @[ @"FlexWrap" ];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Index";
  // Do any additional setup after loading the view, typically from a nib.
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
  return self.modelArray.count;
}

- (NSInteger)tableNode:(ASTableNode*)tableNode
 numberOfRowsInSection:(NSInteger)section {
  return 1;
}

- (ASCellNodeBlock)tableView:(ASTableView*)tableView
  nodeBlockForRowAtIndexPath:(NSIndexPath*)indexPath {
  NSString* model = self.modelArray[indexPath.row];
  return ^{
    MainTextCellNode* cellNode =
        [[MainTextCellNode alloc] initWithContent:model];

    return cellNode;
  };
}

- (void)tableNode:(ASTableNode*)tableNode
    didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
  NSString* model = self.modelArray[indexPath.row];
  ASViewController* vc = [[NSClassFromString(
      [NSString stringWithFormat:@"%@ViewController", model]) alloc] init];
  [self.navigationController pushViewController:vc animated:YES];
}

@end
