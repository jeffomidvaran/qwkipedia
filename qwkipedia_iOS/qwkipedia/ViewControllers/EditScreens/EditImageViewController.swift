//
//  EditImageViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/18/21.
//

import UIKit

class EditImageViewController: UIViewController {

    @IBOutlet weak var textEntryObject: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var trashButtonObject: UIButton!
    var currentImage = #imageLiteral(resourceName: "Image")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trashButtonObject.tintColor = QwkColors.buttonColor
        imageView.image = currentImage
    }
    @IBAction func trashButtonAction(_ sender: Any) {
    }
}
