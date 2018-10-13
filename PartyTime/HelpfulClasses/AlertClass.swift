//
//  alertClass.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-08-25.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit
import Foundation

class Alert {
    
     class func showBasictitle(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}
