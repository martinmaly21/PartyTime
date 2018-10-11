//
//  SideMenuViewController.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-10-10.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }



}
