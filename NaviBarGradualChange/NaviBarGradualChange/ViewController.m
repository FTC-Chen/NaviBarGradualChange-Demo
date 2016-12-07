//
//  ViewController.m
//  NaviBarGradualChange
//
//  Created by anyongxue on 2016/11/18.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ViewController.h"

#define KscreenHeight [UIScreen mainScreen].bounds.size.height
#define KscreenWidth  [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong)UITableView *mainTableView;

@property (nonatomic,strong)UIImageView *topImgview;

@property (nonatomic,strong)UIView *naviBar;

@property (nonatomic,strong)UILabel *naviTitle;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatTabView];
    
    [self creatCustomNavi];

    
}

- (void)creatCustomNavi{
    
    self.naviBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, 64)];
    
    self.naviBar.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.naviBar];
    
    //标题
    self.naviTitle = [[UILabel alloc] initWithFrame:CGRectMake((KscreenWidth-100)/2, 64/2-4, 100, 20)];
    self.naviTitle.text = @"首页";
    self.naviTitle.alpha = 0;
    self.naviTitle.font = [UIFont boldSystemFontOfSize:17];
    self.naviTitle.textColor = [UIColor whiteColor];
    self.naviTitle.textAlignment = NSTextAlignmentCenter;
    [self.naviBar addSubview:self.naviTitle];
    
    
    //两边button
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    leftBtn.frame = CGRectMake(10, 25, 25, 25);
    
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"fanhui@2x.png"] forState:UIControlStateNormal];
    
    [leftBtn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.naviBar addSubview:leftBtn];
    
    
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightBtn.frame = CGRectMake(KscreenWidth-35, 25, 25, 25);
    
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"add2@2x.png"] forState:UIControlStateNormal];
    
    [rightBtn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.naviBar addSubview:rightBtn];
    
    //测试提交
    //测试提交
}

- (void)creatTabView{
    
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    
    // self.myTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mainTableView.translatesAutoresizingMaskIntoConstraints=NO;
    
    self.mainTableView.delegate = self;//设置表视图外貌代理
    self.mainTableView.dataSource = self;
    
    //头视图
    self.topImgview = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,KscreenWidth,220)];
    self.topImgview.image = [UIImage imageNamed:@"book.jpeg"];//原图
    
    self.mainTableView.tableHeaderView = self.topImgview;
    
    [self.view addSubview:self.mainTableView];
}

#pragma tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier=@"mainCell";

    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
   
    if (cell==nil) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text=@"导航栏渐变";
    
    cell.textLabel.font=[UIFont systemFontOfSize:13];
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    if(_mainTableView.contentOffset.y<-20) {
        
        [_naviBar setHidden:NO];
        
    }else if(self.mainTableView.contentOffset.y<700){
        
        [_naviBar setHidden:NO];
        
        _naviBar.backgroundColor = [UIColor colorWithRed:0.9 green:70/255.0 blue:65/255.0 alpha:self.mainTableView.contentOffset.y /150];
        
        //利用alpha,>1时,自定义导航栏上添加信息
        CGFloat cusAlpha = self.mainTableView.contentOffset.y /150;
        
        self.naviTitle.alpha = cusAlpha;
       
    }else{
       
        [_naviBar setHidden:NO];
        
        _naviBar.backgroundColor=[UIColor colorWithRed:0.9 green:70/255.0 blue:65/255.0 alpha:1];
    }
}

- (void)leftAction{

}

- (void)rightAction{
    
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 30;
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
