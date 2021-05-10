//
//  SuggestionCellCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/9/21.
//

import UIKit

class SuggestionCellCollectionViewCell: UICollectionViewCell {
    public static let identifier = "SuggestionCellCollectionViewCellId"

    let profilePic: UIImageView = {
        let pp = UIImageView()
        pp.translatesAutoresizingMaskIntoConstraints = false
        pp.image = #imageLiteral(resourceName: "janeDoe")
        pp.contentMode = .scaleToFill
        pp.layer.masksToBounds = false
        pp.layer.cornerRadius = 25/2
        pp.clipsToBounds = true
        return pp 
    }()    
    
    let suggestorName: UILabel = {
        let l = UILabel()
        l.text = "Jane Doe"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l 
    }()    

    let qwkDescriptionView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.text = "I would suggest adding a part about how cool the puppy's howls are!!!"
        return tv
    } ()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell() {
        self.addSubview(profilePic) 
        self.addSubview(suggestorName) 
        self.addSubview(qwkDescriptionView)
        
        NSLayoutConstraint.activate([
            profilePic.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            profilePic.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            profilePic.widthAnchor.constraint(equalToConstant: 25),
            profilePic.heightAnchor.constraint(equalToConstant: 25),
            suggestorName.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 8),
            suggestorName.centerYAnchor.constraint(equalTo: profilePic.centerYAnchor),
            
            qwkDescriptionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            qwkDescriptionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            qwkDescriptionView.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 8),
            qwkDescriptionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
        

    }


    
}
    
    
