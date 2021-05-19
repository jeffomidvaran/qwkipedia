//
//  EditExternalLinkViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/18/21.
//

import UIKit
import WebKit

class EditExternalLinkViewController: UIViewController {
    
    @IBOutlet weak var textEntryField: UITextField!
    @IBOutlet weak var linkContainer: UIView!
    @IBOutlet weak var trashButtonObject: UIButton!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var forwardButtonObject: UIBarButtonItem!
    @IBOutlet weak var backButtonObject: UIBarButtonItem!
    @IBOutlet weak var reloadButtonObject: UIBarButtonItem!
    var currentRecievedURL = ""
    var currentRecivedWebsiteTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        trashButtonObject.tintColor = QwkColors.buttonColor
        forwardButtonObject.tintColor = QwkColors.buttonColor
        backButtonObject.tintColor = QwkColors.buttonColor
        reloadButtonObject.tintColor = QwkColors.buttonColor
    }
    
    @IBAction func trashButtonAction(_ sender: Any) {
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
    }
    
    @IBAction func relaodButtonAction(_ sender: Any) {
    }
    
}
