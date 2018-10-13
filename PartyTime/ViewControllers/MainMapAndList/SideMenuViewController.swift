//
//  SideMenuViewController.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-10-10.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var menu: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var uniLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImageView()
        menu.separatorColor = UIColor.gray
        
        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        hideNavBar()
    }
    
    
    
    
    

    func hideNavBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setUpImageView() {
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        
        profileImageView.layer.borderColor = UIColor.lightGray.cgColor
        profileImageView.layer.borderWidth = 3
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.image = UIImage(named: "profilePicTemplate")
    }
    
    //TableView menu stuff is handled below
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

