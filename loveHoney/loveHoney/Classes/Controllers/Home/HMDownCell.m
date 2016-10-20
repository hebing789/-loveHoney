//
//  HMDownCell.m
//  loveHoney
//
//  Created by 黄凯 on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMDownCell.h"
#import "HMFreshShopModel.h"

#import "HMFreshShopCell.h"

#import "HMWebViewController.h"

#import "DDAnimationTools.h"

static NSString* cellId = @"HMDownCell1";
@interface HMDownCell ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSMutableArray* dataAry;


//转换坐标用
@property(nonatomic,weak)UIView* view;



@end

@implementation HMDownCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //这个时候貌似contentView的frame混乱
        [self setupUI];
    }
    return self;
}


////这个方法不调用
//-(instancetype)initWithFrame:(CGRect)frame{
//    
//    if (self = [super initWithFrame:frame]) {
//        [self setupUI];
//    }
//    return self;
//}

- (void)setupUI{
    
    UIView* view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view =view;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize = CGSizeMake(screemW*0.5-6, 270);
    
    
    flowLayout.sectionInset = UIEdgeInsetsMake(20 , 3, 20, 3);
    
    
    
    flowLayout.minimumInteritemSpacing = 6;
    
    flowLayout.minimumLineSpacing = 6;
    
    UICollectionView *collectionV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    
    self.collectionV = collectionV;
    //设置背景颜色
    collectionV.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
//    collectionV.backgroundColor = [UIColor lightGrayColor];
    
    collectionV.delegate =self;
    //设置代理
    collectionV.dataSource = self;
    
    [self.contentView addSubview:collectionV];
    
//    [collectionV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell"];
    //这句话写上就不能滚动了
    [collectionV setScrollEnabled: NO];
    UINib* nib = [UINib nibWithNibName:@"HMFreshShopCell" bundle:nil];
    [collectionV registerNib:nib forCellWithReuseIdentifier:cellId];
        [self getDATA];
    
    
}





-(void)setDataAry:(NSMutableArray *)dataAry{
    
    _dataAry =dataAry;
    
    [self.collectionV setNeedsLayout];
    [self.collectionV reloadData];
}
//数据来直接需要再返回一次行高
-(CGFloat)getHight{
    
    return 278*32/2+282;
    return screemH*7-430;
    
    //要网络来了再返回一次;
    return self.dataAry.count/2*282 +282;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  self.dataAry.count==0?32:self.dataAry.count;
    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    HMFreshShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor redColor];
    
    //加载占位图,网络数据来了显示数据
    if (self.dataAry[indexPath.item]) {
        cell.model =self.dataAry[indexPath.item];

    }
    
    
    [cell setCallback:^(UIImageView *foodImgView) {
        
        //转换坐标
        CGRect rect = [cell convertRect:foodImgView.frame toView:self.view];
        
        [[DDAnimationTools sharedTool]leftBigImgStartAnimationWithView:foodImgView startRect:rect endRect:CGPointMake(SCREEN_WIDTH/4*2.5, SCREEN_HEIGHT-49) finish:^(BOOL finish) {
            UIView *view = [self viewController].tabBarController.tabBar.subviews[3];
            [DDAnimationTools shakeAnimation:view];
        }];
        
        
        
        UIViewController *vc = [self viewController].tabBarController.viewControllers[2];
        NSInteger badgeValue = [vc.tabBarItem.badgeValue integerValue];
        badgeValue += 1;
        NSString *str = [NSString stringWithFormat:@"%zd", badgeValue];
        if ([str isEqualToString:@"0"]) {
            str = nil;
        }
        vc.tabBarItem.badgeValue = str;
        
    }];
        
        
//      
        
    

    
    cell.contentView.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1];
    
    return cell;
    
    
}


-(void)layoutSubviews{
    
    
    [super layoutSubviews];
    
    self.collectionV.frame = CGRectMake(0, 0, screemW, [self getHight]);
    

 
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
        HMFreshShopModel* model = self.dataAry[indexPath.item];
    
    HMWebViewController* web = [HMWebViewController new];
    
    //这个数据跳转和超市页面的数据有关,自身数据无此数据
    web.urlString = model.img;
    [[self viewController].navigationController pushViewController:web animated:YES];
    
}
- (UIViewController *)viewController
{
    //获取当前view的superView对应的控制器
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
    
}

//collctionvew的数据
-(void)getDATA{
    
    [HMFreshShopModel modelWithSucess:^(NSMutableArray *ary) {
        
        self.dataAry =ary;
        
       
        
        
        
        
    } andError:^{
        
    }];
    
}

@end
