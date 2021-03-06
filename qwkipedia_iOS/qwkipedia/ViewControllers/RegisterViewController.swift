//
//  ViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/7/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var NameTextfield: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
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
        //email & password fields populated for quick testing
        emailTextfield.text = "emma@email.com"
        passwordTextfield.text = "1234a!"
        NameTextfield.text = "Emma Brown"
        
        errorLabel.alpha = 0 //Hiding the error label
        createButton.backgroundColor = QwkColors.buttonColor
        
        loginButton.setTitleColor(QwkColors.buttonColor, for: .normal)
        
    }
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if NameTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        // Check if the password is secure
        let cleanedPassword = passwordTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 6 characters, contains a special character and a number."
        }
        
        return nil
    }
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    @IBAction func createPressed(_ sender: UIButton) {
        
        let error = validateFields()
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            // Create cleaned versions of the data
            let name = NameTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //create the user
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                // Check for errors
                if error != nil {
                    
                    // There was an error creating the user
                    self.showError("Error creating user")
                } else {
                    //user was created successfully
                    let db = Firestore.firestore()
                    //var ref: DocumentReference? = nil
                    db.collection("users").document(email.lowercased()).setData(["name":name,"email":email, "bio":"", "qwktributionCount":0]) { (error) in
                        print("user saved successfully, here is their id:")
                        //print(ref?.documentID ?? "")
                        //db.collection("users").document((ref?.documentID)!).updateData(["uid":(ref?.documentID)!])
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                }
                    
                    //transition to Home page
                    let defaults = UserDefaults.standard
                    defaults.set(name, forKey: "Name")
                    self.performSegue(withIdentifier: Constants.SegueNameConstants.createtoInterstSegue, sender: self)
            }
        }
    }
    
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == Constants.SegueNameConstants.createtoInterstSegue {
            let controller = segue.destination as! SetProfileViewController
            controller.name = NameTextfield.text! 

    }
    
}
}
