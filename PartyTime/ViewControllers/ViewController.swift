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
    
    override func viewWillAppear(_ animated: Bool) {
        try? VideoBackground.shared.play(view: view, videoName: "partylights", videoType: "mp4", isMuted: true, darkness: 0.5, willLoopVideo: true, setAudioSessionAmbient: true)
    }
    
   override func viewDidLoad() {
   
    super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInButton(_ sender: Any) {
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
    }
}

