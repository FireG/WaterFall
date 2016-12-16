//
//  ViewController.m
//  CollectionViewS
//
//  Created by guozihui on 16/12/15.
//  Copyright © 2016年 guozihui. All rights reserved.
//

#import "ViewController.h"
#import "PhotoController.h"
#import "WaterFallController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *collectionArr;
@end

@implementation ViewController

-(instancetype)init{
    
    if (self = [super init]){
        self.collectionArr = [NSArray arrayWithObjects:@"相册",@"瀑布流",nil];
        self.navigationItem.title = @"CollectionViews";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc]init];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.collectionArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.collectionArr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[[PhotoController alloc]init] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[[WaterFallController alloc]init] animated:YES];
            break;
        default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
