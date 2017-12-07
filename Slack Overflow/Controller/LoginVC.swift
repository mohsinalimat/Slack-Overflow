//
//  LoginVC.swift
//  Slack Overflow
//
//  Created by Alex Wong on 12/4/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var emailTextField: InsetTextField!
    @IBOutlet weak var passwordTextField: InsetTextField!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    // MARK: - Actions
    
    @IBAction func closeLoginVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInUser(_ sender: Any) {
        
        if emailTextField.text != nil && passwordTextField.text != nil {
            AuthService.instance.loginUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text!, loginComplete: { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: error?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!, userCreationComplete: { (success, error) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!, loginComplete: { (success, nil) in
                            self.performSegue(withIdentifier: UNWIND, sender: nil)
                            print("Successfully registered user")
                        })
                    } else {
                        print(String(describing: error?.localizedDescription))
                    }
                })
            })
        }
    }
}

extension LoginVC : UITextFieldDelegate {}

















