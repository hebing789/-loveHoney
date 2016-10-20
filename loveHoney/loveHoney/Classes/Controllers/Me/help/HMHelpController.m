//
//  HMHelpController.m
//  loveHoney
//
//  Created by hebing on 16/10/16.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HMHelpController.h"
#import <MessageUI/MessageUI.h>
@interface HMHelpController ()<UITextViewDelegate,MFMessageComposeViewControllerDelegate>

@property(nonatomic,strong)UITextView *textView;


@property(nonatomic,weak)UILabel* ziShuLable;
@end

@implementation HMHelpController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //automaticallyAdjustsScrollViewInsets 让提示文字置顶
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UILabel* advise = [[UILabel alloc]init];
//                       WithFrame:CGRectMake(screemW*0.05, 0, screemW*0.9, 40)];
    
    advise.text = @"你的批评和建议能帮助我们更好的完善产品,请留下你的宝贵意见!";
    advise.font=[UIFont systemFontOfSize:16];
    advise.textColor = [UIColor darkGrayColor];
    advise.numberOfLines =0;
    
//    [advise setPreferredMaxLayoutWidth:screemW*0.9];
    
    [self.view addSubview:advise];
    
    [advise mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(5);
        make.left.equalTo(self.view).offset(5);
        make.right.equalTo(self.view).offset(-5);
    }];
    
    
    
    
    UITextView *textView = [[UITextView alloc]init];
    textView.backgroundColor = [UIColor colorWithRed:0.99 green:0.9806 blue:0.9697 alpha:1.0];
    [self.view addSubview:textView];
    //textView没有站位符
    textView.text = @"请反馈意见(15字以上)";

    textView.font = [UIFont systemFontOfSize:20];
    textView.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    
    
    self.textView = textView;
    //设置代理
    textView.delegate = self;
    
    
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(advise.mas_bottom).offset(10);
        make.left.equalTo(10);
        make.right.equalTo(-10);
        make.height.equalTo(300);
        
    }];
    
 

    
    
    UILabel *label = [[UILabel alloc]init];
    self.ziShuLable = label;
    label.text = @"您还可以输入的字数为:50";
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textView.mas_bottom).offset(10);
    
        make.left.mas_equalTo(@60);
        make.right.mas_equalTo(@10);
        
    }];
    
    UIBarButtonItem* send = [[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(keyboard)];
    [send setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor darkGrayColor]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = send;
    
}

//点击事件 button
-(void)keyboard
{
    if(self.textView.text.length == 0)
    {
        [SVProgressHUD showErrorWithStatus:@"请输入反馈文字"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [SVProgressHUD dismiss];
        });
        
    }
    if(self.textView.text.length >=1 && self.textView.text.length <15)
    {
        [SVProgressHUD showErrorWithStatus:@"亲,字数不足哦,需要满足15字哦"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [SVProgressHUD dismiss];
        });

       
       
    }
    if (self.textView.text.length >=15)
    {
//        //这个发短信,只能调出发短信窗口,不能自动发送短信
//
//        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"sms://15692107411"]];
       
//        MFMessageComposeViewControllerDelegate
//        [self messageComposeViewController:self didFinishWithResult:<#(MessageComposeResult)#>]
        [self showMessageView:@[@"15692107411"] title:@"发送短信" body:self.textView.text];
       
        [SVProgressHUD showSuccessWithStatus:@"谢谢您的反馈"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [SVProgressHUD dismiss];
            
        });


  
    
    }
    [self.view endEditing:YES];
}
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    switch (result) {
        case MessageComposeResultSent:
        { //信息传送成功
            [SVProgressHUD showSuccessWithStatus:@"发送成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [SVProgressHUD dismiss];
                //注意pop的位置
                  [self.navigationController popViewControllerAnimated:YES];
              
            });
        }
            break;
        case MessageComposeResultFailed:
            //信息传送失败
        { //信息传送成功
            [SVProgressHUD showSuccessWithStatus:@"发送失败"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [SVProgressHUD dismiss];
                [self.navigationController popViewControllerAnimated:YES];
            });
        }
            
            break;
        case MessageComposeResultCancelled:
            //信息被用户取消传送
            
            break;
        default:
            break;
    }
    
}

//发送短信
-(void)showMessageView:(NSArray *)phones title:(NSString *)title body:(NSString *)body
{
    if( [MFMessageComposeViewController canSendText] )
    {
        MFMessageComposeViewController * controller = [[MFMessageComposeViewController alloc] init];
        controller.recipients = phones;
        controller.navigationBar.tintColor = [UIColor redColor];
        controller.body = body;
        controller.messageComposeDelegate = self;
        [self presentViewController:controller animated:YES completion:nil];
        [[[[controller viewControllers] lastObject] navigationItem] setTitle:title];//修改短信界面标题
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示信息"
                                                        message:@"该设备不支持短信功能"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
//开始的时候
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    textView.text = @"";
    //输入的时候字体黑色
    textView.textColor =[UIColor blackColor];
    return YES;
}
//限制字数
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    //判断加上输入的字符，是否超过界限

    if (textView.text.length >=50)
    {
        
        textView.text = [textView.text substringToIndex:50];
        return NO;
    }
    
    
    return YES;
}
#warning mark-----要判断的~
- (void)textViewDidChange:(UITextView *)textView{
    if (self.ziShuLable.text.length>=50) {
        return;
    }
    self.ziShuLable.text = [NSString stringWithFormat:@"您还可以输入的字数为: %lu",(unsigned long)(50 -textView.text.length)];
    
    
    
  }




@end
