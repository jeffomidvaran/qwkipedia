//
//  ExternalLinkCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/26/21.
//

import UIKit



class ExternalLinkCollectionViewCell: UICollectionViewCell {
    public static let identifier = "ExternalLinkCell"
    
    fileprivate let urlTextView: UITextView = {
        let tv = UITextView()
        tv.text = "No Link Set"
        tv.isEditable = false
        tv.textAlignment = .center
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(urlTextView)
        
        NSLayoutConstraint.activate([
            urlTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            urlTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            urlTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            urlTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
        ])
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("awake from nib")
    }
    

    
    func setURL(url urlString: String, surname: String) {
        let attributedString = NSMutableAttributedString(string: surname)
        let url = URL(string: urlString)!
        // Set the 'click here' substring to be the link
        attributedString.setAttributes([.link: url], range: NSMakeRange(0, surname.count))
        self.urlTextView.attributedText = attributedString
        self.urlTextView.isUserInteractionEnabled = true
        self.urlTextView.isEditable = false
        self.urlTextView.centerText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
}
