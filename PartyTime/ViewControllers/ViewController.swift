//
//  ViewController.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-08-20.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit
import FirebaseAuth
import SwiftVideoBackground
import Hero

class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    //TODO: Add onboarding screen to allow users to swipe through various screens explaining how PartyTime works. 
    
   override func viewDidLoad() {
    super.viewDidLoad()
    animatedBackground()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signInButton(_ sender: Any) {
    }
    
    @IBAction func registerButton(_ sender: Any) {
        //TODO: Put code here if we want to perform any checks before user registers.
    }
    
    func animatedBackground() {
        do {
            if Auth.auth().currentUser == nil {
            try VideoBackground.shared.play(view: view, videoName: "partylights", videoType: "mp4", isMuted: true, darkness: 0.5, willLoopVideo: true, setAudioSessionAmbient: true) }
        } catch {
            print(error.localizedDescription)
        }
    }
    
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    //Checking to see if user already has an account, and then automatically logging them in.
    
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "mainToHome", sender: self)
        }
    }
    
}




