//
//  ForgotPasswordViewController.swift
//  qwkipedia
//
//  Created by Anahita Abadian on 4/25/21.
//

import UIKit
import Firebase


class ForgotPasswordViewController:UIViewController {
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBAction func resetPasswordPressed(_ sender: UIButton) {
        let auth = Auth.auth()
        
        if let email = emailTextField.text {
            auth.sendPasswordReset(withEmail: email) { (error) in
                if error != nil {
                    //Couldn't reset
                    let alert = Utilities.createAlertController(title: "Error", message: error!.localizedDescription)
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                else {
                    let alert = Utilities.createAlertController(title: "Hurray!", message: "A password reset email has been sent!")
                    self.present(alert, animated: true, completion: nil)
                }
        }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.layer.cornerRadius = 15
    }
}

