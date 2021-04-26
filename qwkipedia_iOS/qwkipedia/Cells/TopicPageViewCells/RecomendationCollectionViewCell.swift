//
//  RecomendationCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/26/21.
//

import UIKit

class RecomendationCollectionViewCell: UICollectionViewCell {
    public static let identifier = "ExternalLinkCell"
     
    fileprivate let label: UILabel = {
        let l = UILabel()
        l.text = "Empty"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
  
    fileprivate let textView: UITextView = {
        let tv = UITextView()
        tv.text = "Empty"
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    fileprivate let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false 
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.addSubview(textView)
        contentView.addSubview(imageView)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: imageView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textView.topAnchor.constraint(equalTo: label.bottomAnchor),
            textView.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        
    }

    func setData(title: String, shortDescription: String, imageData: UIImage) {
        label.text = title
        textView.text = shortDescription
        imageView.image = imageData
    }

    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
}
