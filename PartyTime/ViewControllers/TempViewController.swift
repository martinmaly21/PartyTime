//
//  TempViewController.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-08-28.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit
import FirebaseAuth

class TempViewController: UIViewController {
    @IBAction func tempButton(_ sender: Any) {
     
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "tempConnec", sender: self)
        } catch {
            Alert.showBasictitle(title: "Error", message: error.localizedDescription, vc: self)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
