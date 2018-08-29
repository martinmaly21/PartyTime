//
//  HomeCollectionViewController.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-08-27.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit


class HomeCollectionViewController: UICollectionViewController {

    var array: [String] = ["MASSIVE BANGER ON ABERDEEN!", "BIG ASS PARTY ON JOHNSON", "PARTY ON UNIVERSITY - BYOB", "MASSIVE BANGER ON ABERDEEN!", "BIG ASS PARTY ON JOHNSON", "PARTY ON UNIVERSITY - BYOB"]
    
    var backgroundImageArray = ["1", "2", "3", "1", "2", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
