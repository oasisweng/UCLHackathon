//
//  LLAppDelegate.m
//  UCLHackathon
//
//  Created by Dingzhong Weng on 10/23/13.
//  Copyright (c) 2013 Dingzhong Weng. All rights reserved.
//

#import "LLAppDelegate.h"

@implementation LLAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//	NSString* filePath = [[NSBundle mainBundle]pathForResource:@"specifications" ofType:@"plist"];
//	NSMutableDictionary* specs = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
//	NSLog(@"%@",specs);
//	NSInteger minAge = 16;
//	NSInteger maxAge = 30;
//	[specs setObject:[NSArray arrayWithObjects:[NSNumber numberWithInteger:minAge],[NSNumber numberWithInteger:maxAge],nil] forKey:@"age"];
//	NSString* countFile = [[NSBundle mainBundle]pathForResource:@"counts" ofType:@"txt"];
//	NSString* countContent = [NSString stringWithContentsOfFile:countFile encoding:NSUTF8StringEncoding error:nil];
//	NSArray* countries = [countContent componentsSeparatedByString:@"\n"];
//	NSString* uniFile = [[NSBundle mainBundle]pathForResource:@"uni" ofType:@"txt"];
//	NSString* uniContent = [NSString stringWithContentsOfFile:uniFile encoding:NSUTF8StringEncoding error:nil];
//	NSArray* universities = [uniContent componentsSeparatedByString:@"\n"];
//	NSString* ethFile = [[NSBundle mainBundle]pathForResource:@"eth" ofType:@"txt"];
//	NSString* ethContent = [NSString stringWithContentsOfFile:ethFile encoding:NSUTF8StringEncoding error:nil];
//	NSArray* ethnicity = [ethContent componentsSeparatedByString:@"\n"];
//	NSString* courseFile = [[NSBundle mainBundle]pathForResource:@"course" ofType:@"txt"];
//	NSString* couContent = [NSString stringWithContentsOfFile:courseFile encoding:NSUTF8StringEncoding error:nil];
//	NSArray* courses = [couContent componentsSeparatedByString:@"\n"];
//	NSString* relFile = [[NSBundle mainBundle]pathForResource:@"rel" ofType:@"txt"];
//	NSString* relContent = [NSString stringWithContentsOfFile:relFile encoding:NSUTF8StringEncoding error:nil];
//	NSArray* religions = [relContent componentsSeparatedByString:@"\n"];
//	[specs setObject:countries forKey:@"nationality"];
//	[specs setObject:universities forKey:@"university"];
//	[specs setObject:ethnicity forKey:@"ethnicity"];
//	[specs setObject:courses forKey:@"course"];
//	[specs setObject:religions forKey:@"religion"];
//	[specs writeToFile:filePath atomically:YES];
//	NSLog(@"filePaht %@",filePath);
			

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Saves changes in the application's managed object context before the application terminates.
	[self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"UCLHackathon" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"UCLHackathon.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
