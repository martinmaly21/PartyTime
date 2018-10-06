//
//  HomeCollectionViewController.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-08-27.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit
import FirebaseAuth


class HomeCollectionViewController: UICollectionViewController {

    var array: [String] = ["234 Johnson St.", "320 Victoria St.", "847 Earl St.", "27 Aberdeen St.", "876 Alfred St.", "765 Division St."]
    
    var backgroundImageArray = ["1", "2", "3", "1", "2", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //This is just to know which user is currently logged in. 
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                print("The current user is  \(user!.email!)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCellForHome
        cell.backGroundImage.image = UIImage(named: backgroundImageArray[indexPath.row])
        
        let Label = cell.viewWithTag(1) as! UILabel
        Label.text = array[indexPath.row]
        return cell
    }
   

}
