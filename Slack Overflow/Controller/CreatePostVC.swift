//
//  CreatePostVC.swift
//  Slack Overflow
//
//  Created by Alex Wong on 12/5/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        sendButton.bindToKeyboard()
    }

    // MARK: - Actions
    
    @IBAction func closePostVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendText(_ sender: Any) {
        if textView.text != nil && textView.text != "Say something here..." {
            sendButton.isEnabled = false
            DataService.instance.uploadPost(withMessage: textView.text!, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (isComplete) in
                if isComplete {
                    self.sendButton.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendButton.isEnabled = true
                    print("There was an error!")
                }
            })
        }
    }
}

extension CreatePostVC : UITextViewDelegate {
    
    //clear text view when editing
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
}
















