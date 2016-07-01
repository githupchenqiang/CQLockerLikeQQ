# CQLockerLikeQQ
##模仿QQ的侧滑抽屉效果，
###使用:
> 在使用时只需要将 Locker文件夹下的文件都导入工程中即可，依照在application中设置根视图


`TabbarViewController *mainVC = [[TabbarViewController alloc]init];`

    [self.MainNavigation.navigationBar setBarTintColor:[UIColor colorWithRed:31/255.0 green:169/255.0 blue:235/255.0 alpha:1]];`
   
    LeftViewController *LetVC = [[LeftViewController alloc]init];
  
    _bas = [[BaseViewController alloc]initWithLeftView:LetVC andMainView:mainVC];`
   
    self.window.rootViewController = _bas;

`  self.window.rootViewController = _bas;
`
