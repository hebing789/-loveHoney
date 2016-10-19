//
//  HBTableBarController.m
//  彩票实战
//
//  Created by hebing on 16/8/11.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HBTableBarController.h"
#import "HMHomeController.h"
#import "HMMarketViewController.h"
#import "HMShoppingViewController.h"
#import "HMMeViewController.h"
#import "hideBottomBarNavagationControl.h"
#import "HMTabBar.h"

#import "HMTableViewController.h"
@interface HBTableBarController ()<UITabBarControllerDelegate>

@property(nonatomic,weak)HMShoppingViewController *shoppingVC;

@property(nonatomic,weak)UIViewController* lastViewController;
//解决dismiss后调回之前present的页面问题,购物页面present问题用属性记录无法实现
@property(nonatomic,weak)HMHomeController *homeVC;
@property(nonatomic,strong)NSMutableArray* dataAry;
@property (nonatomic ,assign) NSInteger index;

@end

@implementation HBTableBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    //自定义购物车按钮 的tabBar;
//    HMTabBar* tarBar= [[HMTabBar alloc]init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeShopBangeValue:) name:KAddShoppingNotName object:nil];
    
    self.delegate =  self;
    //自定义无法实现badgeValue的增加
//    [tarBar setButClickCallback:^{
//        HMShoppingViewController *shoppingVC = [[HMShoppingViewController alloc]init];
//        DDBaseNavController *navVC = [[DDBaseNavController alloc]initWithRootViewController:shoppingVC];
//        self.shoppingVC = shoppingVC;
//        shoppingVC.navigationItem.title = @"购物车";
//        [self presentViewController: navVC animated:YES completion:^{
//
//        }];
//        
//        
//    }];
//    [self setValue:tarBar forKey:@"tabBar"];
    
}

-(void)dealloc{
 
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)changeShopBangeValue:(NSNotification*)noti{
    static long long i =0;
    i++;
    self.shoppingVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%lld",i] ;
    
//     self.shoppingVC.tabBarItem.badgeValue = @"99";
    self.shoppingVC.tabBarItem.badgeColor = [UIColor redColor];
    
    [self.tabBar setNeedsLayout];
    
    
}

-(instancetype)init{
    if (self=[super init]) {
        
        [self addChildViewControllers];
        //如何关掉tabbar的渲染颜色
        //这句话直接没颜色,连字都显示不出来
        //        self.tabBar.tintColor=[UIColor clearColor];
        
    }
    
    return self;
}


-(void)addChildViewControllers
{
    HMHomeController *homeVC = [[HMHomeController alloc]init];
    self.homeVC = homeVC;
    HMMarketViewController *marketVC = [[HMMarketViewController alloc]init];
    HMShoppingViewController *shoppingVC = [[HMShoppingViewController alloc]init];
    self.shoppingVC=shoppingVC;
    HMMeViewController *profileVC = [[HMMeViewController alloc]init];
    
    
    [self addChildViewController:homeVC andTitle:@"首页" andImageName:@"v2_home" andSelectedImageName:@"v2_home_r"andIndex:0];
    [self addChildViewController:marketVC andTitle:@"闪电超市" andImageName:@"freshReservation" andSelectedImageName:@"freshReservation_r"andIndex:1];
    [self addChildViewController:shoppingVC andTitle:@"购物车" andImageName:@"shopCart" andSelectedImageName:@"shopCart_r"andIndex:2];
    [self addChildViewController:profileVC andTitle:@"我的" andImageName:@"v2_my" andSelectedImageName:@"v2_my_r"andIndex:3];
    
}

-(void)addChildViewController:(UIViewController *)vc andTitle:(NSString *)title andImageName:(NSString *)imageName andSelectedImageName:(NSString *)selectedImageName andIndex:(NSInteger)index
{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.tag=index;
    UIImage *normalImage = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.tabBarItem.image = normalImage;
    vc.tabBarItem.selectedImage = selectedImage;
    
    
    [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor]} forState:UIControlStateSelected];
    
    DDBaseNavController *navVC = [[DDBaseNavController alloc]initWithRootViewController:vc];
     [self addChildViewController:navVC];
////    后面要Push如果当前控制器没有导航控制器push不过去,在此可以获取navegationBar,利用生命周期写,更简单

    
    
}




-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    if(item.tag ==2){
        //由于这个tabbar的点击事件无法拦截,跳转后dismiss都会直接回到购物车页面
        
       
      
        
        if(!self.shoppingVC.tabBarItem.badgeValue){
            
            //需要创建一个,设置属性传过来不行
            HMShoppingViewController *shoppingVC = [[HMShoppingViewController alloc]init];
            DDBaseNavController *navVC = [[DDBaseNavController alloc]initWithRootViewController:shoppingVC];
            
            [self presentViewController: navVC animated:YES completion:^{
                
            }];
            
        }else{
            
            //需要创建一个,设置属性传过来不行
            HMTableViewController *shoppingVC = [[HMTableViewController alloc]init];
            shoppingVC.navigationItem.title = @"购物车";
            DDBaseNavController *navVC = [[DDBaseNavController alloc]initWithRootViewController:shoppingVC];
            
            [self presentViewController: navVC animated:YES completion:^{
                
            }];

            
            
          
            
        }

        return;
    }
    
    //tag值为2的时候不记录,其他的时候都记录
    _index = item.tag;
//
    NSInteger index = 0;
//    NSLog(@"%ld",(long)item.tag);
    for (UIView* subview in tabBar.subviews) {
        
        
        
        if ([subview isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            if (index == item.tag) {
                for (UIView* targertView in subview.subviews) {
                    
                    if ([targertView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                        
                        targertView.transform = CGAffineTransformMakeScale(0.5, 0.5);
                        
                        [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:5 options:UIViewAnimationOptionLayoutSubviews animations:^{
                            
                            targertView.transform = CGAffineTransformMakeScale(1, 1);
                            
                        } completion:^(BOOL finished) {
                            
                        }];
              
                    }
                    
                    
                }
                

            }
            
            index ++;
        }
        
        
    }
    
    
    
    
    
    
    
    
    
}



// 程序启动广告
//站内信广告
- (void)system{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    [param setValue:@"10" forKey:@"call"];
    
    
    [DSHTTPClient postUrlString:@"SystemMessage.json.php" withParam:param withSuccessBlock:^(id data) {
//        NSLog(@"%@",data);
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    } withErrorBlock:^(NSString *message) {
        NSLog(@"%@",message);
    }];
    
    
}

-(void)loadView{
    [super loadView];
    self.view.backgroundColor=[UIColor whiteColor];
    
   }


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];


    
}

-(NSMutableArray *)dataAry{
    
    if (_dataAry == nil) {
        _dataAry = [NSMutableArray new];
//        [_dataAry addObject:@0];
    }
    
    return _dataAry;
}

///这个方法在tabbardidselected后面的调用,在prensent页面点击直接切换点击事件
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    DDBaseNavController* nv = (DDBaseNavController*)viewController;
    
    //数组记录有bug,
//    _lastViewController = nv.childViewControllers.firstObject;
//    UITabBarItem*  last =_lastViewController.tabBarItem;
//    [self.dataAry addObject:last];
//    
//    
//    if (_dataAry.count>2) {
//        
//        [_dataAry removeObjectAtIndex:0];
//    }
//    
    
    if ([nv.childViewControllers.firstObject isKindOfClass:[HMShoppingViewController class]])
        //跳转拦截
      
    {  NSLog(@"跳转");
        
//        UITabBarItem* lastitem = self.dataAry[0];
//        if (self.dataAry.count ==1) {
//            //注意跳转方法名
//              [self setSelectedIndex:_homeVC.tabBarItem.tag];
////            [self tabBar:self.tabBar didSelectItem:_homeVC.tabBarItem.];
//        }else{
//            //能看到动画效果,但是没有页面跳转
//            [self setSelectedIndex:lastitem.tag];
//            NSLog(@"");
////            [self tabBar:self.tabBar didSelectItem:lastitem];
//        }
//        

        self.selectedIndex = _index;

    
    }
    
}

@end
