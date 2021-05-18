//
//  SelectInterestsCollectionViewCell.swift
//  qwkipedia
//
//  Created by Anahita Abadian on 5/12/21.
//

import UIKit

class SelectInterestsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var containorView: UIView!
    
    @IBOutlet weak var checkMarkImage: UIImageView!
    
    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.layer.masksToBounds = true
        self.imageView.isUserInteractionEnabled = true
        self.checkMarkImage.isHidden = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.setCircularImageView()
    }

    func setCircularImageView() {
        self.imageView.layer.cornerRadius = CGFloat(roundf(Float(self.imageView.frame.size.width / 2.0)))
    }
    
    //Function  for select and deselect checkmark.
      public func toggleSelected ()
      {
        //If image is selected.
        if (isSelected)
        {
            //show checkmark image
            self.checkMarkImage.isHidden = false
            self.imageView.alpha = 0.7
            isSelected = false
        }

        else
        {
            //Hide check mark image.
            self.checkMarkImage.isHidden = true
            self.imageView.alpha = 1
            isSelected = true
        }
      }
}
