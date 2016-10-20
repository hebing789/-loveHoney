//
//  HMSettingController.m
//  loveHoney
//
//  Created by hebing on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMSettingController.h"

static NSString* cellId = @"HMSettingContro";
@interface HMSettingController ()



@end

@implementation HMSettingController

-(instancetype)init{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
       

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //这个无法改变tableview最前面的组间距问题
//    self.tableView.frame = [UIScreen mainScreen].bounds;
    self.tableView.tableHeaderView.height=0;
    
    
    self.tableView.sectionHeaderHeight=0;
    self.tableView.sectionFooterHeight=10;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    self.tableView.tableFooterView=[UIView new];
    [self.tableView setScrollEnabled:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    if (section==0) {
        return  2;
    }
    return 1;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    if (indexPath.section ==0) {
        if(indexPath.row == 0 ){
            cell.textLabel.text = @"关于小熊";
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }else{
            cell.textLabel.text = @"清理缓存";
            UILabel* aceView = [[UILabel alloc]init];
            aceView.text = @"3.04M";
            aceView.textColor = [UIColor darkGrayColor];
            aceView.textAlignment = NSTextAlignmentCenter;
            [aceView sizeToFit];
            //一定要给frame才能显示
            aceView.frame = CGRectMake(0, 0, aceView.frame.size.width, aceView.frame.size.height);
            cell.accessoryView =aceView;
//            //addSubView报错
//            [cell.accessoryView addSubview:aceView];
        }

        
    }
    if (indexPath.section ==1) {
        cell.textLabel.text = @"退出当前账号";
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = [UIColor darkGrayColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.center=cell.center;
        
        
    }
    
    
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 ) {
        
        if (indexPath.item ==0) {
            
            //老师说这个位置不用写
            HMWebViewController* webViewController = [[HMWebViewController alloc]init];
            webViewController.navigationItem.title = @"关于作者";
            [self.navigationController pushViewController:webViewController animated:YES];
            
            
        }else{
            
          
//            [[self class]clearCache:pathAddress];
            
            [self clear];
            
            [SVProgressHUD showWithStatus:@"清理缓存"];
            UITableViewCell* cell =  [self.tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
            
            cell.textLabel.text = @"清理缓存";
            UILabel* aceView = [[UILabel alloc]init];
//            aceView.text =[NSString stringWithFormat:@"%f", [[self class]folderSizeAtPath:pathAddress] ];
            aceView.text =@"0M";
            aceView.textColor = [UIColor darkGrayColor];
            aceView.textAlignment = NSTextAlignmentCenter;
            [aceView sizeToFit];
            //一定要给frame才能显示
            aceView.frame = CGRectMake(0, 0, aceView.frame.size.width, aceView.frame.size.height);
            cell.accessoryView =aceView;

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                   [SVProgressHUD dismiss];
            });
            
         
            
        }
        
    }
    
     if (indexPath.section == 1 ) {
         
           [SVProgressHUD showWithStatus:@"退出当前账号"];
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [SVProgressHUD dismiss];
         });
         
     }
    
    
    
   
}
////计算单个文件大小
//
//+(float)fileSizeAtPath:(NSString *)path{
//    NSFileManager *fileManager=[NSFileManager defaultManager];
//    if([fileManager fileExistsAtPath:path]){
//        long long size=[fileManager attributesOfItemAtPath:path error:nil].fileSize;
//        return size/1024.0/1024.0;
//    }
//    return 0;
//}
//
////计算目录大小
//
//+(float)folderSizeAtPath:(NSString *)path{
//    NSFileManager *fileManager=[NSFileManager defaultManager];
//    float folderSize;
//    if ([fileManager fileExistsAtPath:path]) {
//        NSArray *childerFiles=[fileManager subpathsAtPath:path];
//        for (NSString *fileName in childerFiles) {
//            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
//            folderSize +=[FileService fileSizeAtPath:absolutePath];
//        }
//        　　　　　//SDWebImage框架自身计算缓存的实现
//        folderSize+=[[SDImageCache sharedImageCache] getSize]/1024.0/1024.0;
//        return folderSize;
//    }
//    return 0;
//}

+(void)clearCache:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
    [[SDImageCache sharedImageCache] cleanDisk];
}


// 计算目录大小
- (CGFloat)folderSizeAtPath:(NSString *)path{
    // 利用NSFileManager实现对文件的管理
    NSFileManager *manager = [NSFileManager defaultManager];
    CGFloat size = 0;
    if ([manager fileExistsAtPath:path]) {
        // 获取该目录下的文件，计算其大小
        NSArray *childrenFile = [manager subpathsAtPath:path];
        for (NSString *fileName in childrenFile) {
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            size += [manager attributesOfItemAtPath:absolutePath error:nil].fileSize;
        }
        // 将大小转化为M
        return size / 1024.0 / 1024.0;
    }
    return 0;
}

-(void)clear{
    
    [[SDImageCache sharedImageCache] clearDisk];
    
    [[SDImageCache sharedImageCache] clearMemory];
 
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
    
    , ^{
        
        NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        
        NSLog(@"%@", cachPath);
        
        
        
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
        
        NSLog(@"files :%lu",(unsigned long)[files count]);
        
        for (NSString *p in files) {
            
            NSError *error;
            
            NSString *path = [cachPath stringByAppendingPathComponent:p];
            
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                
                [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                
            }
            
        }
        
       };
    
}
@end
