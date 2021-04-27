

//
//  File.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/26/21.
//  Created by Anahita Abadian on 4/26/21.
//

import Foundation

import UIKit

extension UITextView:UITextViewDelegate {
    func centerText() {
        self.textAlignment = .center
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }

    public func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = .darkGray
        }
    }
    public func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Tap to add a short bio..."
            textView.textColor = UIColor.lightGray
            textView.font = UIFont.boldSystemFont(ofSize: 17)
        }
    }
}
