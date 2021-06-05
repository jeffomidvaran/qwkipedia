//
//  EditImageViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/18/21.
//

import UIKit

class EditImageViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var trashButtonObject: UIBarButtonItem!
    @IBOutlet weak var addImageButtonObject: UIButton!
    
    var currentImage = #imageLiteral(resourceName: "Image")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trashButtonObject.tintColor = QwkColors.buttonColor
        addImageButtonObject.tintColor = QwkColors.buttonColor
        imageView.image = currentImage
        imageView.isHidden = true
    }
    
    @IBAction func trashButtonAction(_ sender: Any) {
        imageView.isHidden = true
    }
    
    
    @IBAction func addPhotoFromLibraryButton(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }


}

extension EditImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            currentImage = image
            imageView.image = image
            imageView.isHidden = false

        }
        picker.dismiss(animated: true, completion: nil)

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
