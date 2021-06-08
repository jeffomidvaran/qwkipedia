//
//  AddNewTopicViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/31/21.
//

import UIKit

class AddNewTopicViewController: UIViewController {

    @IBOutlet weak var addNewTopicButtonObject: UIButton!
    @IBOutlet weak var addNewYouTubeVideoButtonObject: UIButton!
    @IBOutlet weak var addNewImageButtonObject: UIButton!
    @IBOutlet weak var addNewLinkButtonObject: UIButton!
    
    @IBOutlet weak var checkButtonObject: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNewTopicButtonObject.tintColor = QwkColors.buttonColor
        addNewYouTubeVideoButtonObject.tintColor = QwkColors.buttonColor
        addNewImageButtonObject.tintColor = QwkColors.buttonColor
        addNewLinkButtonObject.tintColor = QwkColors.buttonColor
    }
    
    @IBAction func saveToDataBaseButtonAction(_ sender: Any) {
        print("values saved to database")
    }
    
}
