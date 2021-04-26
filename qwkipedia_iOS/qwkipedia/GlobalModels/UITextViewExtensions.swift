//
//  UITextViewExtensions.swift
//  qwkipedia
//
<<<<<<< HEAD
//  Created by Jeff Omidvaran on 4/26/21.
=======
//  Created by Anahita Abadian on 4/26/21.
>>>>>>> 9304ea9788a7331b4ca98424c8382cdb566dc919
//

import Foundation
import UIKit

<<<<<<< HEAD
extension UITextView {
    func centerText() {
        self.textAlignment = .center
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }
}
=======
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

>>>>>>> 9304ea9788a7331b4ca98424c8382cdb566dc919
