//
//  MoreQwkDescriptionCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/2/21.
//

import UIKit

class MoreQwkDescriptionCollectionViewCell: UICollectionViewCell {

    public static let identifier = "MoreQwkDescriptionViewCellId"
    var isAuthor = false {
        didSet {
            if(isAuthor) {
                reportButton.isHidden = false
                editButton.isHidden = true
            }else {
                reportButton.isHidden = true
                editButton.isHidden = false
            }
        }
    }

    fileprivate let authorLabel: UILabel = {
        let l = UILabel()
        l.text = "John Doe"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    let reportButton: UIButton = {
        let b = UIButton()
        b.setTitle("Report", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()

    let editButton: UIButton = {
        let b = UIButton()
        b.setTitle("︎Edit", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()

    let suggestButton: UIButton = {
        let b = UIButton()
        b.setTitle("︎Suggest", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()

    fileprivate let qwkDescriptionTextView: UITextView = {
        let tv = UITextView()
        tv.text = DummyData.qwkDescription
        tv.isEditable = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    
    let upVote: UIButton = {
        let b = UIButton()
        b.setTitle("⬆︎", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()

    fileprivate let voteCountLabel: UILabel = {
        let l = UILabel()
        l.text = "John Doe"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    let downVote: UIButton = {
        let b = UIButton()
        b.setTitle("︎⬇︎", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(authorLabel)
        contentView.addSubview(reportButton)
        contentView.addSubview(editButton)
        contentView.addSubview(suggestButton)
        contentView.addSubview(qwkDescriptionTextView)

        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
        contentView.layer.borderWidth = 0.5
        
        NSLayoutConstraint.activate([
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            editButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            reportButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            reportButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            suggestButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            suggestButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            qwkDescriptionTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            qwkDescriptionTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8),
            qwkDescriptionTextView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            qwkDescriptionTextView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 8),
            qwkDescriptionTextView.topAnchor.constraint(equalTo: reportButton.bottomAnchor, constant: 8),
            qwkDescriptionTextView.bottomAnchor.constraint(equalTo: suggestButton.topAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
}


