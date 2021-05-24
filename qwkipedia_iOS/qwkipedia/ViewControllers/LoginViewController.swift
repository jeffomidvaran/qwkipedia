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
    @IBOutlet weak var animatedText: UITextField!
    
    @IBOutlet weak var SigninButton: UIButton!
    @IBOutlet weak var forgotButton: UIButton!
    @IBOutlet weak var createButton: UIButton!
    
    @IBAction func signinPressed(_ sender: UIButton) {
        let db = Firestore.firestore()
        if let email = email.text, let password = password.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if error != nil {
                    // Couldn't sign in
                    self.errorLabel.text = error!.localizedDescription
                    self.errorLabel.alpha = 1
                }
                else {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarViewController")
                    //Upon Login change the name in userDefaults
                    let docRef = db.collection("users").document(email.lowercased())
                    docRef.getDocument { (document, error) in
                        if let document = document, document.exists {
                            let name = document["name"] as! String
                            let defaults = UserDefaults.standard
                            defaults.set(name, forKey: "Name")
                        } else {
                            print("Document does not exist")
                        }
                    
                        // This is to get the SceneDelegate object from your view controller
                        // then call the change root view controller function to change to main tab bar
                        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                    //self.performSegue(withIdentifier: SegueNameConstants.loginToHomeSegue, sender: self)
                }
            }
        }
    }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Password and email populated for quick testing
        SigninButton.backgroundColor = QwkColors.buttonColor
        createButton.setTitleColor(QwkColors.buttonColor, for: .normal)
        forgotButton.setTitleColor(QwkColors.buttonColor, for: .normal)
    
        email.text = "Alex@gmail.com"
        password.text = "1234a!"
        
        errorLabel.alpha = 0 //Hiding the error label
        animatedText.text = ""
        animatedText.isUserInteractionEnabled = false
        var charIndex = 0.0
        let titleText = "Sign in to continue"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.08 * charIndex, repeats: false) { (timer) in
                self.animatedText.text?.append(letter)
            }
            charIndex += 1
        }
        
    }

    
}
