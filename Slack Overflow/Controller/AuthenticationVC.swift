//
//  AuthenticationVC.swift
//  Slack Overflow
//
//  Created by Alex Wong on 12/4/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class AuthenticationVC: UIViewController {

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    // MARK: - Actions
    
    @IBAction func signInWithFacebook(_ sender: Any) {
        
    }
    
    @IBAction func signInWithGoogle(_ sender: Any) {
        
    }
    
    @IBAction func signInWithEmail(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginVC")
        present(loginVC!, animated: true, completion: nil)
    }

}
