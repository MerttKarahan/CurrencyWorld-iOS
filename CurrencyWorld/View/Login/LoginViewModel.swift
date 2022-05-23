//
//  LoginViewModel.swift
//  CurrencyWorld
//
//  Created by emn on 18.05.2022.
//

import Foundation
import FirebaseAuth


class LoginViewModel {
        
    func register(email: String?, password: String?, finish: @escaping ((String?) -> Void)) {
        if let email = email, let password = password {
            Auth.auth().createUser(withEmail: email, password: password) { auth, error in
                if let error = error {
                    finish(error.localizedDescription)
                } else {
                    finish(nil)
                }
            }
        } else {
            finish("Please enter Email/Password")
        }
    }
    
    func login(email: String?, password:String?, finish: @escaping ((String?) -> Void)) {
        
        if let email = email, let password = password {
            Auth.auth().signIn(withEmail: email, password: password) { auth, error in
                if let error = error {
                    finish(error.localizedDescription)
                } else {
                    finish(nil)
                }
            }
        } else {
            finish("Please enter a Email/Password")
        }
    }
}
