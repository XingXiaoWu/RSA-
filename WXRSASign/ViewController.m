//
//  ViewController.m
//  WXRSASign
//
//  Created by 吴兴 on 2016/12/17.
//  Copyright © 2016年 ChanPay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    WXRSASign* _WXSigner;
    UILabel *text1;
    UILabel *text2;
    UITextField *text;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* private_key_string = @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAO/6rPCvyCC+IMalLzTy3cVBz/+wamCFNiq9qKEilEBDTttP7Rd/GAS51lsfCrsISbg5td/w25+wulDfuMbjjlW9Afh0p7Jscmbo1skqIOIUPYfVQEL687B0EmJufMlljfu52b2efVAyWZF9QBG1vx/AJz1EVyfskMaYVqPiTesZAgMBAAECgYEAtVnkk0bjoArOTg/KquLWQRlJDFrPKP3CP25wHsU4749t6kJuU5FSH1Ao81d0Dn9m5neGQCOOdRFi23cV9gdFKYMhwPE6+nTAloxI3vb8K9NNMe0zcFksva9c9bUaMGH2p40szMoOpO6TrSHO9Hx4GJ6UfsUUqkFFlN76XprwE+ECQQD9rXwfbr9GKh9QMNvnwo9xxyVl4kI88iq0X6G4qVXo1Tv6/DBDJNkX1mbXKFYL5NOW1waZzR+Z/XcKWAmUT8J9AkEA8i0WT/ieNsF3IuFvrIYG4WUadbUqObcYP4Y7Vt836zggRbu0qvYiqAv92Leruaq3ZN1khxp6gZKl/OJHXc5xzQJACqr1AU1i9cxnrLOhS8m+xoYdaH9vUajNavBqmJ1mY3g0IYXhcbFm/72gbYPgundQ/pLkUCt0HMGv89tn67i+8QJBALV6UgkVnsIbkkKCOyRGv2syT3S7kOv1J+eamGcOGSJcSdrXwZiHoArcCZrYcIhOxOWB/m47ymfE1Dw/+QjzxlUCQCmnGFUO9zN862mKYjEkjDN65n1IUB9Fmc1msHkIZAQaQknmxmCIOHC75u4W0PGRyVzq8KkxpNBq62ICl7xmsPM=";
    
    
    NSString* public_key_string = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDv+qzwr8ggviDGpS808t3FQc//sGpghTYqvaihIpRAQ07bT+0XfxgEudZbHwq7CEm4ObXf8NufsLpQ37jG445VvQH4dKeybHJm6NbJKiDiFD2H1UBC+vOwdBJibnzJZY37udm9nn1QMlmRfUARtb8fwCc9RFcn7JDGmFaj4k3rGQIDAQAB";
    
    WXRSASign* wxsigner = [WXRSASign new];
    [wxsigner importKeyWithType:KeyTypePrivate andkeyString:private_key_string];
    [wxsigner importKeyWithType:KeyTypePublic andkeyString:public_key_string];
    _WXSigner = wxsigner;
    
    [self creatView];
}

-(void)creatView
{
    text = [[UITextField alloc]initWithFrame:CGRectMake(50, 50, 200, 30)];
    text.borderStyle = UITextBorderStyleRoundedRect;
    text.placeholder = @"输入加签信息";
    [self.view addSubview:text];
    
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    [but setTitle:@"签名" forState:UIControlStateNormal];
    but.frame = CGRectMake(100, 100, 30, 20);
    but.backgroundColor = [UIColor redColor];
    but.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:but];
    [but addTarget:self   action:@selector(signAction) forControlEvents:UIControlEventTouchUpInside];
    
    text1 = [[UILabel alloc]initWithFrame:CGRectMake(50, 130, 200, 150)];
    text1.backgroundColor = [UIColor yellowColor];
    text1.numberOfLines = 0;
    text1.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:text1];
    
    
    
    
    UIButton *but2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [but2 setTitle:@"验签" forState:UIControlStateNormal];
    but2.frame = CGRectMake(100, 300, 30, 20);
    but2.backgroundColor = [UIColor redColor];
    but2.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:but2];
    [but2 addTarget:self   action:@selector(verifyAction) forControlEvents:UIControlEventTouchUpInside];
    
    text2 = [[UILabel alloc]initWithFrame:CGRectMake(50, 330, 200, 150)];
    text2.backgroundColor = [UIColor yellowColor];
    text2.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:text2];
}

-(void)signAction{
    
    NSString* result = [_WXSigner signString:text.text];
    text1.text = result;
}

- (void)verifyAction{
    
        BOOL result = [_WXSigner verifyString:text.text withSign:text1.text];
        text2.text = [NSString stringWithFormat:@"验证签名结果(1成功，0失败)： %d",result];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
