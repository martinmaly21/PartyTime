//
//  PushNotification.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-10-15.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit
import UserNotifications

class localNotification {
    
    var title: String
    var body: String
    var delay: Double
    var identifier: String
    var sound = UNNotificationSound.default
    
    
    init(title: String, body: String, delay: Double, identifier: String) {
        self.title = title
        self.body = body
        self.delay = delay
        self.identifier = identifier
    }

    func sendNotification() {
        //content
        let content = UNMutableNotificationContent()
            content.title = title
            content.body = body
            content.sound = sound
        //trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: delay, repeats: false)
        //request
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            //Handle error when notification could not be sent
            if error != nil {
            print("Error: \(error!)")
            } else {
                print("success\n\n\n")
            }
        }
    }


}
