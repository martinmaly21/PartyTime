//
//  LogInViewController.swift
//  
//
//  Created by Martin Maly on 2018-08-24.
//
import UIKit
import FirebaseAuth
import MBProgressHUD

class LogInViewController: UIViewController {
//I like idea of when both text fields are filled in, or atleast have some text in them, that the button changes from a lighter colour to a darker one. 
    
    
    enum LoginError: Error {
        case incompleteForm
        case incorrectPassword
        case incorrectEmail
        //Maybe no wifi
    }
    
    //TODO: Code for dismissing keyboard and adding return thing.
    
    @IBOutlet weak var emailTextField: HoshiTextField!
    @IBOutlet weak var passwordTextField: HoshiTextField!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        do {
          try login()
            
        } catch LoginError.incompleteForm {
            Alert.showBasictitle(title: "Error", message: "Please fill out both your password and email.", vc: self) }
        catch {
           Alert.showBasictitle(title: "Error", message: "There was an error when attempting to log in.", vc: self)
        }
    }
    
    func login() throws {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteForm
            }
        //Check to make sure password and email were correct.
         //Perform login features

        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "logInToHome", sender: self)
            }
            if error != nil {
            Alert.showBasictitle(title: "Error", message: "User failed to sign in. \(error!.localizedDescription)", vc: self)
            }
        }
    

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
