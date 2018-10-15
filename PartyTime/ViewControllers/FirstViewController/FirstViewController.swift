//
//  ViewController.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-08-20.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit
import FirebaseAuth


class FirstViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    //TODO: Add onboarding screen to allow users to swipe through various screens explaining how PartyTime works. 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //checkIfUserSignedIn()
        //Checking to see if user already has an account, and then automatically logging them in.
    }
    
    
    @IBAction func signInButton(_ sender: Any) {
    }
    
    @IBAction func registerButton(_ sender: Any) {
        //TODO: Put code here if we want to perform any checks before user registers.
    }
    
    
    
    
    func checkIfUserSignedIn() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.performSegue(withIdentifier: "mainToHome", sender: self)
            }
        }
    }
    
}
