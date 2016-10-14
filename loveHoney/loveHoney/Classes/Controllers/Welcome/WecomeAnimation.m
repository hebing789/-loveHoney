//
//  WecomeAnimation.m
//  彩票实战
//
//  Created by hebing on 16/8/14.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "WecomeAnimation.h"
#warning 注意
#import "UIView+UIframe.h"//必须包含头文件,否则引用报错
#import "HBTableBarController.h"
#import "WelcomCell.h"
#define screemW    [UIScreen mainScreen].bounds.size.width
#define screemH    [UIScreen mainScreen].bounds.size.height

static NSString* useId=@"use";
@interface WecomeAnimation ()
@property (nonatomic, weak) UIImageView *topImageView;

@property (nonatomic, weak) UIImageView *bigImageView;

@property (nonatomic, weak) UIImageView *smallImageView;

@property (nonatomic, assign) NSInteger currentPage;

@end

@implementation WecomeAnimation

-(instancetype)init{
    UICollectionViewFlowLayout* laout=[[UICollectionViewFlowLayout alloc]init];
    
    return self=[super initWithCollectionViewLayout:laout];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    UICollectionViewFlowLayout* flowLayOut=(UICollectionViewFlowLayout*)self.collectionViewLayout;
    
   
    flowLayOut.itemSize=[UIScreen mainScreen].bounds.size;
    
    flowLayOut.sectionInset=UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayOut.minimumLineSpacing=0;
    flowLayOut.minimumInteritemSpacing=0;
    flowLayOut.scrollDirection= UICollectionViewScrollDirectionHorizontal;
    UICollectionView* colletctionView=(UICollectionView*)self.collectionView;
    colletctionView.pagingEnabled=YES;
    colletctionView.bounces=NO;
    colletctionView.showsVerticalScrollIndicator=NO;
    colletctionView.showsHorizontalScrollIndicator=NO;
    
//    colletctionView.backgroundColor=[UIColor whiteColor];
    
    UIImageView *imgview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screemW, screemH)];
    imgview.image=[UIImage imageNamed:@"guide1"];
    _topImageView=imgview;
    [self.collectionView addSubview:imgview];
    
    UIImage* bigImg=[UIImage imageNamed:@"guideLargeText1"];
    UIImageView* bigImgView=[[UIImageView alloc]initWithFrame:CGRectMake(screemW/2, screemH*0.7, bigImg.size.width, bigImg.size.height)];
    bigImgView.center=CGPointMake(screemW/2, screemH*0.7);
    bigImgView.image=bigImg;
    _bigImageView=bigImgView;
    [colletctionView addSubview:bigImgView];
    
    UIImage * smaImg=[UIImage imageNamed:@"guideSmallText1"];
    UIImageView* smaImgView=[[UIImageView alloc]initWithImage:smaImg];
    smaImgView.frame=CGRectMake(0, 0, smaImg.size.width, smaImg.size.height);
    smaImgView.center=CGPointMake(screemW/2, CGRectGetMaxY(bigImgView.frame)+40);
    _smallImageView=smaImgView;
    [colletctionView addSubview:smaImgView];
    
    UIImage *lineImage = [UIImage imageNamed:@"guideLine"];
    UIImageView *lineImageView = [[UIImageView alloc] initWithImage:lineImage];
    
    [colletctionView addSubview:lineImageView];
    
    lineImageView.x = -200;//线条图片左移动
    lineImageView.y += 0;
    
    UIButton* toMainControl=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, screemW*0.6, 40)];
    [toMainControl addTarget:self action:@selector(toMyLottery) forControlEvents:UIControlEventTouchUpInside];
    [toMainControl setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
    toMainControl.center=CGPointMake(screemW*3.5, screemH*0.9);
    [colletctionView addSubview:toMainControl];
    [self.collectionView registerClass:[WelcomCell class] forCellWithReuseIdentifier:useId];
    
}
-(void)toMyLottery{
    UIWindow *keyWindow=[UIApplication sharedApplication].keyWindow;
    
    HBTableBarController* tabControl=[[HBTableBarController alloc]init];
    //直接赋值过去就可以跳转
    keyWindow.rootViewController=tabControl;
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
    
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    WelcomCell* cell=[[WelcomCell alloc]init];
    WelcomCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:useId forIndexPath:indexPath];
    
    //背景图片
    cell.img=[UIImage imageNamed:[NSString stringWithFormat:@"guide%ldBackground568h", indexPath.item + 1]];
    return cell;
    
    
}


//要写完数据源方法后才能拖动
//这个方法在滚动结束后调用
//这个能根据过界面距离判断cell的背景该滚到那个界面
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //考虑3个位置图片轮播,实现动画效果,先将页面跳转到前面或后面,再通过动画实现效果
    
//    NSLog(@"%s",__func__);
    //获取当前的页面
    NSInteger index=scrollView.contentOffset.x/screemW+0.5;
    
    
   
    //只有跟换图片,图片在collectionView中,背景在cell中,因此cell在滚动,图片更换,而collectionView中内容无法更换
    _topImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"guide%ld",index+1]];
    
    _smallImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%ld",index+1]];
    _bigImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%ld",index+1]];
    
    
    
    //frame修改;
    if (_currentPage==index) {
        return;
    }
    else{
    
    //要提前跳转页面
    _topImageView.x+=(index-_currentPage)*screemW*2;
    _smallImageView.x+=(index-_currentPage)*screemW*2;
    _bigImageView.x+=(index-_currentPage)*screemW*2;
    
    [UIView animateWithDuration:0.5 animations:^{
        //再来动画
        _topImageView.x-=(index-_currentPage)*screemW;
        _smallImageView.x-=(index-_currentPage)*screemW;
        _bigImageView.x-=(index-_currentPage)*screemW;

    }];
    }
     _currentPage=index;
//    //这样可以实现页面更换,但是不能实现动画效果
//    _topImageView.x+=(index-_currentPage)*screemW;
//    _smallImageView.x+=(index-_currentPage)*screemW;
//    _bigImageView.x+=(index-_currentPage)*screemW;
//    _currentPage=index;

    
}
//-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
//    //考虑3个位置图片轮播,实现动画效果,先将页面跳转到前面或后面,再通过动画实现效果
//    
//        NSLog(@"%s",__func__);
//    //获取当前的页面
//    NSInteger index=scrollView.contentOffset.x/screemW+0.5;
//    
//    
//    
//    //只有跟换图片,图片在collectionView中,背景在cell中,因此cell在滚动,图片更换,而collectionView中内容无法更换
//    _topImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"guide%ld",index+1]];
//    
//    _smallImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%ld",index+1]];
//    _bigImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%ld",index+1]];
//    
//    
//    
//    //frame修改;
//    if (_currentPage==index) {
//        return;
//    }
//    else{
//        
//        //要提前跳转页面
//        _topImageView.x+=(index-_currentPage)*screemW*2;
//        _smallImageView.x+=(index-_currentPage)*screemW*2;
//        _bigImageView.x+=(index-_currentPage)*screemW*2;
//        
//        [UIView animateWithDuration:0.5 animations:^{
//            //再来动画
//            _topImageView.x-=(index-_currentPage)*screemW;
//            _smallImageView.x-=(index-_currentPage)*screemW;
//            _bigImageView.x-=(index-_currentPage)*screemW;
//            
//        }];
//    }
//    //    //这样可以实现页面更换,但是不能实现动画效果
//    //    _topImageView.x+=(index-_currentPage)*screemW;
//    //    _smallImageView.x+=(index-_currentPage)*screemW;
//    //    _bigImageView.x+=(index-_currentPage)*screemW;
//    //    _currentPage=index;
//    
//
//}
//
////拖拽一次,调用一次
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    //考虑3个位置图片轮播,实现动画效果,先将页面跳转到前面或后面,再通过动画实现效果
//    
//    NSLog(@"%s",__func__);
//    //获取当前的页面
//    NSInteger index=scrollView.contentOffset.x/screemW+0.5;
//    
//    
//    
//    //只有跟换图片,图片在collectionView中,背景在cell中,因此cell在滚动,图片更换,而collectionView中内容无法更换
//    _topImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"guide%ld",index+1]];
//    
//    _smallImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%ld",index+1]];
//    _bigImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%ld",index+1]];
//    
//    
//    
//    //frame修改;
//    if (_currentPage==index) {
//        return;
//    }
//    else{
//        
//        //要提前跳转页面
//        _topImageView.x+=(index-_currentPage)*screemW*2;
//        _smallImageView.x+=(index-_currentPage)*screemW*2;
//        _bigImageView.x+=(index-_currentPage)*screemW*2;
//        
//        [UIView animateWithDuration:0.5 animations:^{
//            //再来动画
//            _topImageView.x-=(index-_currentPage)*screemW;
//            _smallImageView.x-=(index-_currentPage)*screemW;
//            _bigImageView.x-=(index-_currentPage)*screemW;
//            
//        }];
//    }
//    //    //这样可以实现页面更换,但是不能实现动画效果
//    //    _topImageView.x+=(index-_currentPage)*screemW;
//    //    _smallImageView.x+=(index-_currentPage)*screemW;
//    //    _bigImageView.x+=(index-_currentPage)*screemW;
//    //    _currentPage=index;
//    
//}
-(BOOL)prefersStatusBarHidden{

                              return YES;
}


@end
