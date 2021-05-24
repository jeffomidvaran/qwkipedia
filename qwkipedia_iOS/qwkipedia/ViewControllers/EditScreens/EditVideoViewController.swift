//
//  EditVideoViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/18/21.
//

import UIKit
import youtube_ios_player_helper

class EditVideoViewController: UIViewController {

    @IBOutlet weak var urlEntryTextField: UITextField!
    @IBOutlet weak var videoViewContainer: YTPlayerView!
    @IBOutlet weak var trashButtonObject: UIBarButtonItem!
    var currentVideoURL: String? {
        didSet {
            handleVideo()
        }
    }
    
    func handleVideo() {
        if let unwrappedVideoLink = currentVideoURL {
            if let _ = videoViewContainer {
                videoViewContainer.isHidden = false
                let videoID = unwrappedVideoLink.deletingPrefix("https://www.youtube.com/watch?v=")
                videoViewContainer.load(withVideoId: videoID)
            }
        } else {
            if let _ = videoViewContainer {
                videoViewContainer.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlEntryTextField.delegate = self
        trashButtonObject.tintColor = QwkColors.buttonColor
        handleVideo()
        urlEntryTextField.becomeFirstResponder()
    }
    
    @IBAction func trashButtonAction(_ sender: Any) {
        currentVideoURL = ""
        videoViewContainer.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // MARK: DATA update database here (get url from currentVideoURL)
        urlEntryTextField.resignFirstResponder()
    }
}


extension EditVideoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        currentVideoURL = urlEntryTextField.text
        urlEntryTextField.text = ""
        handleVideo()
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        currentVideoURL = urlEntryTextField.text
        urlEntryTextField.text = ""
        handleVideo()
    }
}



//     https://www.youtube.com/watch?v=7Gfu51_TgIA
