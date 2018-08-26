//
//  Register1ViewController.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-08-24.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit
import FirebaseAuth

class Register1ViewController: UIViewController {
    
    enum registerErrors: Error {
        case incompleteForm
        case invalidEmailFormat
        case invalidPassword
        case passwordsDoNotMatch
        //MAYBE: CHECK FOR WIFI OR NOT??
     
    }

    @IBOutlet weak var emailTextField: HoshiTextField!
    @IBOutlet weak var passwordTextField: HoshiTextField!
    @IBOutlet weak var confirmPasswordTextField: HoshiTextField!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func register() throws {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let confirmPassword = confirmPasswordTextField.text!
        
        if email.isEmpty || password.isEmpty || confirmPassword.isEmpty  {
            throw registerErrors.incompleteForm
        }
        if validateEmail(candidate: email) == false {
            throw registerErrors.invalidEmailFormat
        }
        if password != confirmPassword {
            throw registerErrors.passwordsDoNotMatch
        }
        if !validatePassword(candidate: password) {
            throw registerErrors.invalidPassword
        }
        
        //DO all firebase registering
        
    }
    
    @IBAction func registerAccount(_ sender: Any) {
        do {
            try register()
        } catch registerErrors.incompleteForm {
            Alert.showBasictitle(title: "Error", message: "Please fill out all fields.", vc: self)
        } catch registerErrors.invalidEmailFormat {
            Alert.showBasictitle(title: "Error", message: "Please enter a valid email.", vc: self)
        } catch registerErrors.passwordsDoNotMatch {
            Alert.showBasictitle(title: "Error", message: "Your passwords do not match.", vc: self)
        } catch registerErrors.invalidPassword {
            Alert.showBasictitle(title: "Error", message: "Invalid password! Please ensure your password contains atleast 8 characters, including at least one special character, one capital letter, and one number. ", vc: self)
        } catch {
           Alert.showBasictitle(title: "Error", message: "Unfortunately we could not register your account at this time. Please try again at a later time.", vc: self)
        }
    }
    
    func validateEmail(candidate: String) -> Bool {
        //NOTE: This will need to be updated for specific schools.
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
    
    func validatePassword(candidate: String) -> Bool {
        let passwordCheck = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordCheck).evaluate(with: candidate)
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
