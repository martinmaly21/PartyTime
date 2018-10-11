//
//  Register7ViewController.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-08-29.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit

class Register6ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var tf1: HoshiTextField!
    @IBOutlet weak var tf2: HoshiTextField!
    @IBOutlet weak var tf3: HoshiTextField!
    @IBOutlet weak var tf4: HoshiTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tf1.delegate = self
        tf2.delegate = self
        tf3.delegate = self
        tf4.delegate = self
        
        
        tf1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        tf2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        tf3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        tf4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        if  text?.count == 1 {
            switch textField{
            case tf1:
                tf2.becomeFirstResponder()
            case tf2:
                tf3.becomeFirstResponder()
            case tf3:
                tf4.becomeFirstResponder()
            case tf4:
                tf4.resignFirstResponder()
            default:
                break
            }
        }
        if  text?.count == 0 {
            switch textField{
            case tf1:
                tf1.becomeFirstResponder()
            case tf2:
                tf1.becomeFirstResponder()
            case tf3:
                tf2.becomeFirstResponder()
            case tf4:
                tf3.becomeFirstResponder()
            default:
                break
            }
        }
        else{
            
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

}
