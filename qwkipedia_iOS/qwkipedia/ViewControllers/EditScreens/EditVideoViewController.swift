//
//  EditVideoViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/18/21.
//

import UIKit

class EditVideoViewController: UIViewController {

    @IBOutlet weak var urlEntryTextField: UITextField!
    @IBOutlet weak var videoViewContainer: UIView!
    @IBOutlet weak var trashButtonObject: UIButton!
    @IBOutlet weak var imageContainerHeightConstraint: NSLayoutConstraint!
    var currentVideoURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trashButtonObject.tintColor = QwkColors.buttonColor
        
    }
    
    @IBAction func trashButtonAction(_ sender: Any) {
//        currentVideoURL = ""
        // MARK: update database here
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // MARK: update database here
    }
    
}
