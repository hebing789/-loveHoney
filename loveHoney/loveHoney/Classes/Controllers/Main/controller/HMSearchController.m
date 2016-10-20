//
//  HMSearchController.m
//  loveHoney
//
//  Created by hebing on 16/10/18.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMSearchController.h"
#define screenW    ([UIScreen mainScreen].bounds.size.width)
#define screenH       ([UIScreen mainScreen].bounds.size.height)
#import "HMDownCell.h"
@interface HMSearchController ()<UISearchBarDelegate>
@property(nonatomic,assign)CGFloat lastX;
@property(nonatomic,assign)CGFloat lastY;

@property(nonatomic,weak)UISearchBar * searchBar;

@property(nonatomic,strong)NSMutableArray* dataAry;;

@property(nonatomic,weak)UIView * bottomView;

@property(nonatomic,strong)NSMutableArray* labDataAry;

//@property(nonatomic,assign)NSInteger* rowNuber;
@property(nonatomic,weak)UICollectionView *collectionV;

@end

@implementation HMSearchController

//-(void)loadView{
//    
//    self.view =
//}

-(NSMutableArray *)labDataAry{
    if (_labDataAry==nil) {
        _labDataAry = [NSMutableArray new];
    }
    return _labDataAry;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];
    UISearchBar * bar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, screemW - 120, 40)];
    self.navigationItem.titleView = bar;
    self.searchBar = bar;
    self.searchBar.delegate =self;
    bar.placeholder = @"请输入商品名称";
    
//    //左侧是一个uiimageView没有搜索功能,可以KVC,遍历找到控件后增加手势
//    for (UIView* view in bar.subviews) {
//        view.userInteractionEnabled = YES;
//        for (UIView* sub in view.subviews) {
//            sub.userInteractionEnabled = YES;
//            for (UIView* tagert in sub.subviews) {
//                tagert.userInteractionEnabled =YES;
//                for (UIView* tagert1 in tagert.subviews) {
//                    tagert1.userInteractionEnabled =YES;
//                    for (UIView* tagert2 in tagert1.subviews) {
//                        tagert2.userInteractionEnabled =YES;
//                        
//                    }
//                    
//                }
//            }
//        }
//        
//    }
//    [self.view addSubview:bar];

    
    
    [self searchWithSuccussBlock:^(NSArray *ary) {
        
        self.dataAry =ary;
        
        [ary enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            UILabel* lab = (UILabel*)self.labDataAry[idx];
            
            lab.text = obj;
            
            
            
            [self.view setNeedsLayout];
            
        }];
        
    }];
    
    [self.tableView registerClass:[HMDownCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableFooterView = [UIView new];

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //从缓存翅中取不行
    HMDownCell* cell = [[HMDownCell alloc]init];
    return [cell getHight];
}
////将要开始编辑时的回调，返回为NO，则不能编辑
//
//- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
//    
//    return YES;
//}
//
//
////已经开始编辑时的回调
//- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
//    
//}
//
//
//
//
////已经结束编辑的回调
//- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
//    
//}
//
//
//取消按钮点击的回调//*btn没有调用这个方法
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    
    NSLog(@"%s",__func__);
}


//搜索结果按钮点击的回调
- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar{
    
    NSLog(@"%s",__func__);
}


-(void)addShopView{
    
    [SVProgressHUD showWithStatus:@"你搜的商品不存在"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
    
    //        HMWebViewController* web = [[HMWebViewController alloc]init];
    
//    //实现滚动
//    UIScrollView* scorView= [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    
//    //滚动和所有点击事件都没有,原因
//    HMDownCell* cell = [[HMDownCell alloc]init];
//    
//    [cell.collectionV setScrollEnabled: YES];
//    
//    [scorView addSubview:cell];
//    
//    [self.view addSubview:cell];
//    
//    [self.view setNeedsLayout];
    
    self.collectionV.hidden = NO;
    
    self.bottomView.hidden =YES;
//
//    [self.tableView setNeedsLayout];
//    
//    [self.tableView reloadData];

    
}

//搜索按钮点击的回调//回车调用的方法

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"%s",__func__);
    
    if (searchBar.text) {
        
        [self addShopView];
    }else{
        
        
        
    }
    
    
    
    
    
}

//搜索
// 首页新鲜热卖
- (void)searchWithSuccussBlock:(void(^)(NSArray*))SuccussBlock{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    [param setValue:@"6" forKey:@"call"];
    
    
    [DSHTTPClient postUrlString:@"search.json.php" withParam:param withSuccessBlock:^(id data) {
        NSDictionary* dic = data[@"data"];
        NSArray* ary = dic[@"hotquery"];
        SuccussBlock(ary);
        
        NSLog(@"%@",data);
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    } withErrorBlock:^(NSString *message) {
        NSLog(@"%@",message);
    }];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

 
//    UITableViewCell* cell;
    
   
        HMDownCell*  cell2= [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    self.collectionV =  cell2.collectionV;
    //    bottomView.backgroundColor = [UIColor redColor];
    cell2.collectionV.hidden = YES;
    
    UIView * bottomView=[[UIView alloc]init];
    
    self.bottomView = bottomView;

    
    
    self.view.userInteractionEnabled =YES;
    [cell2.contentView addSubview:bottomView];
    
    
    UILabel* headLab = [[UILabel alloc]initWithFrame:CGRectMake(20, -30, screemW, 20)];
    headLab.text=@"热门收索:";
    headLab.textColor = [UIColor darkGrayColor];
    
    [bottomView addSubview:headLab];
    
    for (int i =0; i<11; i++) {
        UILabel* lb=[[UILabel alloc]init];
        
        lb.layer.borderColor =(__bridge CGColorRef _Nullable)([UIColor darkGrayColor]);
        lb.layer.borderWidth=1;
        
        lb.layer.cornerRadius = 15;
        lb.layer.masksToBounds = YES;
        
        
        
        UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addShopView)];
        lb.userInteractionEnabled =YES;
        [lb addGestureRecognizer:tap];
        
        
        lb.backgroundColor = [UIColor lightGrayColor];
        //          lb.backgroundColor = [UIColor colorWithRed:213.0 green:20.0 blue:20.0 alpha:1];
        //        [lb setText:[NSString stringWithFormat:@"%d",i]];
        lb.textColor=[UIColor blackColor];
        
        lb.font=[UIFont systemFontOfSize:14];
        [lb sizeToFit];
        
        lb.textAlignment = NSTextAlignmentCenter;
        //        lb.frame=CGRectMake(_lastX, _lastY, lb.frame.size.width+40, lb.frame.size.height);
        
        [self.labDataAry addObject:lb];
        [bottomView addSubview:lb];
        
    }
    
    bottomView.frame=CGRectMake(0, 100, screenW, _lastY);
    bottomView.userInteractionEnabled =YES;

    
        //        cell2.dataAry = self.dataAry;
    
        return cell2;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self addShopView];
}


-(void)viewDidLayoutSubviews{
    
    [super viewDidLayoutSubviews];
    CGFloat margin = 10;
    _lastX=margin;_lastY=margin;
    for (UILabel* lb in self.labDataAry) {
        [lb sizeToFit];
        UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addShopView)];
        lb.userInteractionEnabled =YES;
        [lb addGestureRecognizer:tap];

        
        
        lb.frame=CGRectMake(_lastX, _lastY, lb.frame.size.width+30, lb.frame.size.height+10);
        
        _lastX = _lastX+lb.frame.size.width+margin;
        if (_lastX>screenW) {
            
            _lastX=10;
            _lastY = _lastY+lb.frame.size.height+margin;
            //同时更新布局
            lb.frame=CGRectMake(_lastX, _lastY, lb.frame.size.width, lb.frame.size.height);
            _lastX = _lastX+lb.frame.size.width+margin;
            
        }
        
        
        
//        if (i==14) {
//            _lastY = _lastY+lb.frame.size.height+2*margin;
//        }

        
    }
    
    self.bottomView.frame=CGRectMake(0, 100, screenW, _lastY+40);
    
}


@end
