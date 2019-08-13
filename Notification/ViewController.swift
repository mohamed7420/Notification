//
//  ViewController.swift
//  Notification
//
//  Created by Mohamed on 8/13/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        showNotification()
    }
    
    func showNotification(){
        
        // Step1: request user permission
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert , .sound]) { (granted, error) in
            
        }
        
        // create content of notification
        
        let content = UNMutableNotificationContent()
        
        content.title = "You Have a new Notitification"
        content.body = "Open your new notification"
        
        
        // create trigger
        
        let date = Date().addingTimeInterval(5)
        
        let dateComponent = Calendar.current.dateComponents([.year , .month , .day , .hour , .minute , .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        // create request
        
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest.init(identifier: uuidString, content: content, trigger: trigger)
        
        // register with notification center
        
        center.add(request) { (error) in
            
            
        }
        
    }


}

