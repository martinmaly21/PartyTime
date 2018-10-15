//
//  ResetPasswordViewController.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-09-04.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit
import FirebaseAuth

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var email: HoshiTextField!
    @IBOutlet weak var confirmationMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendResetLink(_ sender: Any) {
        //Begin loading animation
        let emails = email.text
        
        if emails != nil && emails?.isEmpty == false {
            Auth.auth().sendPasswordReset(withEmail: emails!) { (error) in
                if error == nil {
                    self.confirmationMessage.text = "A link to reset your password has been emailed to \(emails!)."
                } else {
                    Alert.showBasictitle(title: "Error", message: "Error: \(error!.localizedDescription)", vc: self)
                }
            }
        } else {
            Alert.showBasictitle(title: "Error", message: "Error: Please enter an email.", vc: self)        }
    }
    
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

