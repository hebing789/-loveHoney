//
//  HBTableBarController.m
//  彩票实战
//
//  Created by hebing on 16/8/11.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HBTableBarController.h"

@interface HBTableBarController ()

@property(nonatomic,weak)UIButton* but;

@end

@implementation HBTableBarController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(instancetype)init{
    if (self=[super init]) {
        
//        [self setMyBarControl];
        self.view.backgroundColor=[UIColor redColor];
        
    }
    
    return self;
}

-(void)setMyBarControl{
    
    UIViewController* hall=[self loadControllerByName:@"hall"];
    
      UIViewController* arena=[self loadControllerByName:@"Arena"];
      UIViewController* history=[self loadControllerByName:@"HHhistory"];
      UIViewController* myLottery=[self loadControllerByName:@"Mylottery"];
      UIViewController* discover=[self loadControllerByName:@"Discover"];
    
//    arena.tabBarItem
    
    self.viewControllers=@[hall,arena,discover,history,myLottery];
    
    [self setTabbar];
    
  
    
}

-(void)setTabbar{
//    //法1:
    UIView* view=[[UIView alloc]initWithFrame:self.tabBar.bounds];
    [self.tabBar addSubview:view];
    
    //法2,加在view中,同时在影藏的时候要注意
//    UIView* view=[[UIView alloc]initWithFrame:self.tabBar.frame];
//    UITabBar* tarbar=(UITabBar*)view;
//    [self.view addSubview:tarbar];
////    _tabView=view;
//    [self.tabBar removeFromSuperview];
    
//    //法3
//    UIView* view=[[UIView alloc]initWithFrame:self.tabBar.frame];
//    UITabBar* tarbarView=(UITabBar*)view;
//     [self.tabBar removeFromSuperview];
//    self.tabBarController.tabBar
    //    _tabView=view;
   

  
    for (int i=0; i<self.viewControllers.count; i++) {
        
        
        
        //TabBar1
        UIImage* normal=[UIImage imageNamed:[NSString stringWithFormat:@"TabBar%d", i+1]];
        
        UIImage* seclected=[UIImage imageNamed:[NSString stringWithFormat:@"TabBar%dSel", i+ 1]];
        NSInteger width=self.tabBar.bounds.size.width/self.viewControllers.count;
        UIButton* tiButton=[[UIButton alloc]initWithFrame:CGRectMake(i*width, 0, width, 49)];
        
        [tiButton setBackgroundImage:normal forState:UIControlStateNormal];
        
        tiButton.tag=i;
        
        [tiButton setBackgroundImage:seclected forState:UIControlStateSelected];
        [tiButton addTarget:self action:@selector(butDidClick:) forControlEvents:UIControlEventTouchDown];
        
        tiButton.adjustsImageWhenHighlighted=NO;
        
        [view addSubview:tiButton];
        
        
        //法1
//        UINavigationBar* navagationBar=[UINavigationBar appearance];
//        [navagationBar setTintColor:[UIColor whiteColor]];
//        [navagationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        
//        [navagationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize: 16],NSForegroundColorAttributeName:[UIColor whiteColor]}];
        
        if (i==0) {
            
            _but=tiButton;
            [self butDidClick:tiButton];
        }
        
    }
    

    
}

-(UIViewController*)loadControllerByName:(NSString*)name{
    
    UIStoryboard* sb=[UIStoryboard storyboardWithName:name bundle:nil];
    
    UIViewController* vc=[sb instantiateInitialViewController];

    return vc;
}

//如果重写tabbarItem,可以不用重写点击事件,不过tabbarItem能不能添加button是一个难点



-(void)butDidClick:(UIButton*)but{
    
    
     _but.selected=NO;
    but.selected=YES;
   
    _but=but;
    
    [self setSelectedIndex:but.tag];

    
}



@end
