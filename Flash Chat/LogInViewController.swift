//
//  LoginViewController.swift
//  Flash Chat
//
//  Created by Alex Wong on 9/17/2017.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    // MARK: - IBActions
    @IBAction func logInPressed(_ sender: AnyObject) {

        
        //TODO: Log in the user
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                print(error)
            }
            else {
                // success
                print("Login successful")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
            
        }
        
        
    }
    


    
}  
