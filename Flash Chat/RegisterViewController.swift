//
//  RegisterViewController.swift
//  Flash Chat
//
//  Created by Alex Wong on 9/17/2017.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of things to free up memory
    }
    
    // MARK: - IBActions
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        // Register a user to Firebase
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                print(error)
            }
            else {
                // success
                print("Registration successful")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        

        
        
    } 
    
    
}
