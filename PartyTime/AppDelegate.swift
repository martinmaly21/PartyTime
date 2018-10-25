//
//  AppDelegate.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-08-20.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit
import Firebase
import FirebaseMessaging
import IQKeyboardManagerSwift
import UserNotifications
import MapKit

@UIApplicationMain
//add message delegate (not working for some reason)
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    
    var window: UIWindow?
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "testIdentifier" {
            //I can customize what the app does when the user clicks on the notification here
            print("Handling notification.")
        }
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        //this allows remote notification to be displayed when app is in foreground (below)
        
        //completionHandler(.alert)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        checkIfUserSignedIn()
        askUserForNotificationPermission(application)
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        shouldConnectToFCM(false)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        self.shouldConnectToFCM(true)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        
        InstanceID.instanceID().instanceID { (result, error) in
            if let err = error {
                print("Error fetching the remote instance ID: \(err)")
                
            } else if let rslt = result {
                print("Remote Instance ID token: \(rslt.token)")
                self.shouldConnectToFCM(true)
            }
        }
    }
    
    //User-created functions
    func askUserForNotificationPermission(_ application: UIApplication) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if error != nil {
                //Handle Error
                print("Error: \(error!.localizedDescription)")
            } else if granted {
                //Handle user allowing notifications
                UNUserNotificationCenter.current().delegate = self
                Messaging.messaging().delegate = self
                DispatchQueue.main.async(execute: {
                    application.registerForRemoteNotifications()
                })
                //                print("User notification status: \(granted)")
            }
        }
    }
    
    func shouldConnectToFCM(_ trueOrFalse : Bool){
        //Telling messaging system "yes we want this app to establish direct connection to firebase system"
        Messaging.messaging().shouldEstablishDirectChannel = trueOrFalse
    }
    
    
    func checkIfUserSignedIn() {
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            
            let bounds = UIScreen.main.bounds
            self.window = UIWindow(frame: bounds)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            if user != nil {
                //App should launch to home view
                
                let homeView = storyboard.instantiateViewController(withIdentifier: "homeView")
                self.window?.rootViewController = homeView
                
            } else {
                //App should launch to first view
                
                let firstView = storyboard.instantiateViewController(withIdentifier: "firstView")
                self.window?.rootViewController = firstView
                
            }
            self.window?.makeKeyAndVisible()
        }
    }
    
}
