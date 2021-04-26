//
//  UITextViewExtensions.swift
//  qwkipedia
//
//  Created by Anahita Abadian on 4/26/21.
//

import Foundation
import UIKit

extension UITextView:UITextViewDelegate {
    public func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = .darkGray
        }
    }
    public func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Tap here to enter a short bio..."
            textView.textColor = UIColor.lightGray
            textView.font = UIFont.boldSystemFont(ofSize: 16)
        }
    }
}

