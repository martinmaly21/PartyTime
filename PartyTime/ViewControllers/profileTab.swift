//
//  profileTab.swift
//  
//
//  Created by Ben McKeon on 2018-08-28.
//

import UIKit

class profileTab: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     guard segue.destination is profileTab
     else {return}
     
     }

}
