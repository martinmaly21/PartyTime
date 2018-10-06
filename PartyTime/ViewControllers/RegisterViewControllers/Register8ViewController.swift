//
//  Register8ViewController.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-10-05.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit

class Register8ViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    var imagePicker: UIImagePickerController!
    
    @IBOutlet weak var funnyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        makeImageViewRound()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseImage(_ sender: Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func makeImageViewRound() {
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2
        self.profileImageView.clipsToBounds = true
    }
    
    
}

extension Register8ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.profileImageView.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
        funnyLabel.text = "Looking good!"
    }
    
}
