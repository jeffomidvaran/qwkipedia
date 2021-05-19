//
//  ExternalLinkWebViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/14/21.
//

import UIKit
import WebKit

class ExternalLinkWebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var bottomNavBar: UIToolbar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var backButtonObject: UIBarButtonItem!
    
    var sentUrlString: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.backgroundColor = .clear    
        webView.allowsLinkPreview = true
        
        bottomNavBar.tintColor = QwkColors.buttonColor
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        
        webView.navigationDelegate = self
        let url = URL(string: sentUrlString ?? "https://www.google.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
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
    
    @IBAction func refreshbuttonAction(_ sender: Any) {
        webView.reload()
    }
    
    fileprivate func showActivityIndicator(show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.dismiss(animated: true, completion: nil)
        webView.stopLoading()
        
        webView = nil
    }
}



extension ExternalLinkWebViewController: WKNavigationDelegate {
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
