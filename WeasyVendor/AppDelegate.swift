//
//  AppDelegate.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 1/27/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseInstanceID
import FirebaseMessaging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    static var currentUser = User()
    static var currentViewContoller = UIViewController()
    static var defaults:UserDefaults = UserDefaults.standard
    static var cuurentLanguage = "en"
    static var userToken = ""
     let gcmMessageIDKey = "gcm.message_id"
     
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AppDelegate.cuurentLanguage = Locale.current.languageCode!
        Constants.HEADER["lang"] = AppDelegate.cuurentLanguage
        FirebaseApp.configure()
         Messaging.messaging().delegate = self
        if #available(iOS 10.0, *) {
                   // For iOS 10 display notification (sent via APNS)
                   UNUserNotificationCenter.current().delegate = self
                   
                   let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                   UNUserNotificationCenter.current().requestAuthorization(
                       options: authOptions,
                       completionHandler: {_, _ in })
               } else {
                   let settings: UIUserNotificationSettings =
                       UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
                   application.registerUserNotificationSettings(settings)
               }
        application.registerForRemoteNotifications()

        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
  
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "WeasyVendor")
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
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
            // If you are receiving a notification message while your app is in the background,
            // this callback will not be fired till the user taps on the notification launching the application.
            // TODO: Handle data of notification
            // With swizzling disabled you must let Messaging know about the message, for Analytics
            // Messaging.messaging().appDidReceiveMessage(userInfo)
            // Print message ID.
            if let messageID = userInfo[gcmMessageIDKey] {
                print("Message ID: \(messageID)")
            }
            
            // Print full message.
            print(userInfo)
        }
        
        func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                         fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
            // If you are receiving a notification message while your app is in the background,
            // this callback will not be fired till the user taps on the notification launching the application.
            // TODO: Handle data of notification
            // With swizzling disabled you must let Messaging know about the message, for Analytics
            // Messaging.messaging().appDidReceiveMessage(userInfo)
            // Print message ID.
            if let messageID = userInfo[gcmMessageIDKey] {
                print("Message ID: \(messageID)")
            }
            
            // Print full message.
            print(userInfo)
            
            completionHandler(UIBackgroundFetchResult.newData)
        }
        func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
            print("Unable to register for remote notifications: \(error.localizedDescription)")
        }
        
        // This function is added here only for debugging purposes, and can be removed if swizzling is enabled.
        // If swizzling is disabled then this function must be implemented so that the APNs token can be paired to
        // the FCM registration token.
        func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            print("APNs token retrieved: \(deviceToken)")
            //        AppDelegate.userToken = deviceToken
            
            
            
            // With swizzling disabled you must set the APNs token here.
            // Messaging.messaging().apnsToken = deviceToken
        }
        
    }
    @available(iOS 10, *)
    extension AppDelegate : UNUserNotificationCenterDelegate {
        
        // Receive displayed notifications for iOS 10 devices.
        func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    willPresent notification: UNNotification,
                                    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            //    let userInfo = notification.request.content.userInfo
            //
            //    // With swizzling disabled you must let Messaging know about the message, for Analytics
            //    // Messaging.messaging().appDidReceiveMessage(userInfo)
            //    // Print message ID.
            //    if let messageID = userInfo[gcmMessageIDKey] {
            //      print("Message ID: \(messageID)")
            //    }
            //
            //    // Print full message.
            //    print(userInfo)
            
            // Change this to your preferred presentation option
            completionHandler([.sound,.alert, .badge])
        }
        
        func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    didReceive response: UNNotificationResponse,
                                    withCompletionHandler completionHandler: @escaping () -> Void) {
            let userInfo = response.notification.request.content.userInfo
            // Print message ID.
            if let messageID = userInfo[gcmMessageIDKey] {
                print("Message ID: \(messageID)")
            }
            
            // Print full message.
            print(userInfo)
            
            
            completionHandler()
        }
    }
    // [END ios_10_message_handling]

    extension AppDelegate : MessagingDelegate {
        // [START refresh_token]
        func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
            print("Firebase registration token: \(fcmToken)")
            
            let dataDict:[String: String] = ["token": fcmToken]
            NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
            // TODO: If necessary send token to application server.
            // Note: This callback is fired at each app startup and whenever a new token is generated.
            AppDelegate.userToken = fcmToken
            
        }
        // [END refresh_token]
        // [START ios_10_data_message]
        // Receive data messages on iOS 10+ directly from FCM (bypassing APNs) when the app is in the foreground.
        // To enable direct data messages, you can set Messaging.messaging().shouldEstablishDirectChannel to true.
        func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
            print("Received data message: \(remoteMessage.appData)")
        }
        // [END ios_10_data_message]
    }



