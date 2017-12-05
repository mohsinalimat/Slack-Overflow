//
//  AuthService.swift
//  Slack Overflow
//
//  Created by Alex Wong on 12/4/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import Foundation
import Firebase

class AuthService{
    
    static let instance = AuthService()
    
    //register
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete completion: @escaping (_ status : Bool, _ error: Error?) -> ()){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                completion(false, error)
                return
            }
            let userData = ["provider" : user.providerID, "email" : user.email]
            DataService.instance.createDBUser(uid: user.uid, userData: userData)
            completion(true, nil)
        }
    }
    
    //login
    func loginUser(withEmail email: String, andPassword password: String, loginComplete completion: @escaping (_ status : Bool, _ error: Error?) -> ()){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                //if no successful user back
                completion(false, error)
                return
            }
            
            completion(true, nil)
        }
    }
}








