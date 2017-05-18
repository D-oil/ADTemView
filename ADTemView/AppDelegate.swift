//
//  AppDelegate.swift
//  ADTemView
//
//  Created by andong on 2017/5/15.
//  Copyright © 2017年 AD.org. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //方便开发，添加一个测试模式，很多东西直接跳过
    static let appMode = Enum.AppMode.testMode
    
    static var sharedDelegate : AppDelegate  {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    static func deviceRotationTo(deviceOrientation:UIDeviceOrientation) {
        
        let orientationUnknow = NSNumber.init(value: UIDeviceOrientation.unknown.rawValue)
        UIDevice.current .setValue(orientationUnknow, forKey: "orientation")
        let orientationTarget = NSNumber.init(value: deviceOrientation.rawValue)
        UIDevice.current .setValue(orientationTarget, forKey: "orientation")
    }

    func firstLoadingApplicationOption(){
        
        if ADTemView.temperatureMode == nil {
            ADTemView.temperatureMode = Enum.TemperatureMode.centigrade.rawValue
        }
        
        if ADTemView.alarmSwitch == nil {
            ADTemView.alarmSwitch = true
        }
        
        if ADTemView.highTemperatureSwitch == nil {
            ADTemView.highTemperatureSwitch = true
        }
        
        if ADTemView.highTemperatureValue == nil {
            ADTemView.highTemperatureValue = 38.5
        }
        
        if ADTemView.lowTemperatureSwitch == nil {
            ADTemView.lowTemperatureSwitch = true
        }
        
        if ADTemView.lowTemperatureValue == nil {
            ADTemView.lowTemperatureValue = 35.5
        }
        
        if ADTemView.alarmModeSwitch == nil {
            ADTemView.alarmModeSwitch = true
        }
        
        if ADTemView.alarmMode == nil {
            ADTemView.alarmMode = Enum.AlarmModel.vibration.rawValue
        }

    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        firstLoadingApplicationOption()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        if #available(iOS 10.0, *) {
            self.saveContext()
        } else {
            // Fallback on earlier versions
        }
    }

    // MARK: - Core Data stack

    @available(iOS 10.0, *)
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "ADTemView")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    @available(iOS 10.0, *)
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

