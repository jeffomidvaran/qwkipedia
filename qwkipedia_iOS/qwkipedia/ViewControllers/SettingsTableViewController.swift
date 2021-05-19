//
//  SettingsViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/10/21.
//

import UIKit
import Firebase


class SettingsTableViewController: UITableViewController {
    @IBOutlet weak var logOutButtonObject: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        logOutButtonObject.tintColor = QwkColors.deletebuttonColor
    }
    
    @IBAction func logOutButtonAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginViewController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
            
            // get the SceneDelegate object from your view controller
            // then call the change root view controller function to change to main tab bar to login again
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginViewController)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}



