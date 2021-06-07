//
//  EditExternalLinkViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/18/21.
//

import UIKit
import WebKit
import SwiftSoup


class EditExternalLinkViewController: UIViewController {
    
    @IBOutlet weak var urlTextEntryField: UITextField!
    @IBOutlet weak var titleEntryTextField: UITextField!
    @IBOutlet weak var invalidURLLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var trashButtonObject: UIBarButtonItem!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var forwardButtonObject: UIBarButtonItem!
    @IBOutlet weak var backButtonObject: UIBarButtonItem!
    @IBOutlet weak var reloadButtonObject: UIBarButtonItem!
    var currentRecievedURL: String?
    var currentRecivedWebsiteTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trashButtonObject.tintColor = QwkColors.buttonColor
        forwardButtonObject.tintColor = QwkColors.buttonColor
        backButtonObject.tintColor = QwkColors.buttonColor
        reloadButtonObject.tintColor = QwkColors.buttonColor
        webView.layer.cornerRadius = 5.0
        webView.layer.masksToBounds = true
        webView.layer.borderColor = QwkColors.outlineColor.cgColor
        webView.layer.borderWidth = 0.5
        
        urlTextEntryField.delegate = self
        titleEntryTextField.delegate = self
        webView.navigationDelegate = self
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        
        if(currentRecievedURL == nil) {
            webView.isHidden = true
        }else {
            webView.isHidden = false
        }
        
        
        invalidURLLabel.isHidden = true
        invalidURLLabel.textColor = QwkColors.deletebuttonColor
//        let currentUrl = URL(string: "http://www.google.com")!
//        webView.load(URLRequest(url: currentUrl))
        webView.allowsBackForwardNavigationGestures = true

    }
    
    @IBAction func trashButtonAction(_ sender: Any) {
        webView.isHidden = true
        invalidURLLabel.isHidden = true
        currentRecivedWebsiteTitle = ""
        currentRecievedURL = ""
        urlTextEntryField.text = ""
        titleEntryTextField.text = ""
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func forwardButtonAction(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    
    @IBAction func relaodButtonAction(_ sender: Any) {
        webView.reload()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.dismiss(animated: true, completion: nil)
        webView.stopLoading()
        webView = nil
    }
    
    fileprivate func showActivityIndicator(show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        }
    }
}

extension EditExternalLinkViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.showActivityIndicator(show: false)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // Set the indicator everytime webView started loading
//        self.setActivityIndicator()
        self.showActivityIndicator(show: true)
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.showActivityIndicator(show: false)
    }
}


extension EditExternalLinkViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if(textField == urlTextEntryField) {
            print("the url entry field")
            currentRecievedURL = urlTextEntryField.text
        
            do {
                let url = URL(string: currentRecievedURL!)
                if(url == nil) {
                    throw MyError.runtimeError("invalid URL")
                }
                let request = URLRequest(url: url!)
                webView.load(request)
                guard let myURL = url else {
                    print("Error: \(String(describing: url)) doesn't seem to be a valid URL")
                    return false
                }
                let html = try String(contentsOf: myURL, encoding: .utf8)
                let doc: Document = try SwiftSoup.parseBodyFragment(html)
                let headerTitle = try doc.title()
                titleEntryTextField.text = headerTitle
                currentRecivedWebsiteTitle = headerTitle
                invalidURLLabel.isHidden = true
                webView.isHidden = false
            } catch Exception.Error(let type, let message) {
                print("Message: \(message) \(type)")
            } catch {
                print("error")
                invalidURLLabel.isHidden = false
            }
            urlTextEntryField.resignFirstResponder()
        } else if(textField == titleEntryTextField) {
            print("the title entry field")
            currentRecivedWebsiteTitle = titleEntryTextField.text ?? "empty"
        }
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("done button pressed")
        resignFirstResponder()
    }
}

enum MyError: Error {
    case runtimeError(String)
}

/*
 https://www.petfinder.com/pet-adoption/dog-adoption/puppies-for-adoption/
 https://www.petfinder.com/pet-adoption/dog-adoption/puppies-for-adoption/
 https://www.petfinder.com/pet-adoption/dog-adoption/puppies-for-adoption/
 https://www.petfinder.com/pet-adoption/dog-adoption/puppies-for-adoption/
 https://www.petfinder.com/pet-adoption/dog-adoption/puppies-for-adoption/
 */
