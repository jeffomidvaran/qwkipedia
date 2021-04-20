//
//  LoginViewController.swift
//  qwkipedia
//
//  Created by Anahita Abadian on 4/18/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func signinPressed(_ sender: UIButton) {
        
        if let email = email.text, let password = password.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if error != nil {
                    // Couldn't sign in
                    self.errorLabel.text = error!.localizedDescription
                    self.errorLabel.alpha = 1
                }
                else {
                    self.performSegue(withIdentifier: K.loginToHomeSegue, sender: self)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        errorLabel.alpha = 0 //Hiding the error label
    }

    
}
