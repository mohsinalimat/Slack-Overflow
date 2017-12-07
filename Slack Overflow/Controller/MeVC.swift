//
//  MeVC.swift
//  Slack Overflow
//
//  Created by Alex Wong on 12/5/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    
    @IBAction func logoutUser(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        
    }

}
