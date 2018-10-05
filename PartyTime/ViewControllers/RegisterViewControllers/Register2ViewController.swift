//
//  Register2ViewController.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-08-29.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit

class Register2ViewController: UIViewController {
    let formatter = DateFormatter()
    @IBOutlet weak var birthdayText: HoshiTextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func datePicker(_ sender: UIDatePicker) {
 
        
        birthdayText.text = formatter.string(from: datePicker.date)
        
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //Write code so that user can not pick date ahead of today's date
        //Write code to ensure they're 19
        datePicker.setValue(UIColor.white, forKey: "textColor")
        formatter.dateFormat = "MMMM dd, yyyy"
        
        birthdayText.text = formatter.string(from: datePicker.date)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
