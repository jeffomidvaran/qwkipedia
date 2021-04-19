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
    
    @IBAction func signinPressed(_ sender: UIButton) {
        if let email = email.text, let password = password.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    self.performSegue(withIdentifier: K.loginToHomeSegue, sender: self)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
}
