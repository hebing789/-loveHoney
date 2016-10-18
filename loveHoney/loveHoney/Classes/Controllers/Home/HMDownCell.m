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

static NSString* cellId = @"HMDownCell1";
@interface HMDownCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,weak)UICollectionView *collectionV;

@property(nonatomic,strong)NSMutableArray* dataAry;

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
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize = CGSizeMake(screemW*0.5-6, 270);
    
    
    flowLayout.sectionInset = UIEdgeInsetsMake(20 , 3, 20, 3);
    
    
    
    flowLayout.minimumInteritemSpacing = 6;
    
    flowLayout.minimumLineSpacing = 6;
    
    UICollectionView *collectionV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    
    self.collectionV = collectionV;
    //设置背景颜色
//    collectionV.backgroundColor = [UIColor colorWithRed:235 green:235 blue:235 alpha:1];
    collectionV.backgroundColor = [UIColor lightGrayColor];
    
    collectionV.delegate =self;
    //设置代理
    collectionV.dataSource = self;
    
    [self.contentView addSubview:collectionV];
    
//    [collectionV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell"];
    
    UINib* nib = [UINib nibWithNibName:@"HMFreshShopCell" bundle:nil];
    [collectionV registerNib:nib forCellWithReuseIdentifier:cellId];
    
    [self getDATA];
    
}

-(void)getDATA{
    
    [HMFreshShopModel modelWithSucess:^(NSMutableArray *ary) {
        
        self.dataAry =ary;
        
        [self.collectionV reloadData];
        
    } andError:^{
        
    }];
    
    
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  self.dataAry.count;
    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    HMFreshShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor redColor];
    
    cell.model =self.dataAry[indexPath.item];
    
    cell.contentView.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1];
    
    return cell;
    
    
}


-(void)layoutSubviews{
    
    
    [super layoutSubviews];
    
    self.collectionV.frame = CGRectMake(0, 0, screemW, 3*screemH);
    

 
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
        HMFreshShopModel* model = self.dataAry[indexPath.item];
    
    HMWebViewController* web = [HMWebViewController new];
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

-(CGFloat)getHight{
    
    return CGRectGetMaxY(self.collectionV.frame);
}

@end
