//
//  RegistViewController.m
//  CQChatCricle
//
//  Created by chenq@kensence.com on 16/6/29.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "RegistViewController.h"
#import "BaseViewController.h"

@interface RegistViewController ()
@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UITextField *Passward;
@property (weak, nonatomic) IBOutlet UITextField *NickName;
- (IBAction)Cancle:(id)sender;
- (IBAction)Regist:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *Cancle;
@property (weak, nonatomic) IBOutlet UIButton *Regist;

@end

@implementation RegistViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
      
        RegistViewController *regist = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"Regist"];
        self = regist;
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _Cancle.layer.masksToBounds = YES;
    _Cancle.layer.cornerRadius = 3;
    
    _Regist.layer.masksToBounds = YES;
    _Regist.layer.cornerRadius = 3;
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Cancle:(id)sender {
    
}

- (IBAction)Regist:(id)sender {
    BaseViewController *tabbar = [BaseViewController new];
    [self presentViewController:tabbar animated:YES completion:nil];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_UserName resignFirstResponder];
    [_Passward resignFirstResponder];
    [_NickName resignFirstResponder];
}




@end
