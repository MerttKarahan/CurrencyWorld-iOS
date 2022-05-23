//
//  ViewController.swift
//  CurrencyWorld
//
//  Created by emn on 18.05.2022.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    private let viewModel = LoginViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginClicked(_ sender: Any) {
        viewModel.login(email: emailText.text, password: passwordText.text) { errordesc in
            self.segue(error: errordesc)
        }
    }
    
    
    
    @IBAction func registerClicked(_ sender: Any) {
        
        viewModel.register(email: emailText.text, password: passwordText.text) { errordesc in
            self.segue(error: errordesc)
        }
    }
    
    
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func segue(error: String?) {
        if let error = error {
            self.makeAlert(titleInput: "Error", messageInput: error)
        } else {
            self.performSegue(withIdentifier: "toTabBarController", sender: nil)
        }
    }
}

