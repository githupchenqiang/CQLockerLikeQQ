//
//  AppDelegate.h
//  CQChatCricle
//
//  Created by chenq@kensence.com on 16/4/26.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "BaseViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic ,strong)UINavigationController *MainNavigation;
@property (nonatomic ,strong)BaseViewController *bas;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

