//
//  TopicExternalLinkTableViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/13/21.
//

import UIKit

class TopicExternalLinkTableViewCell: UITableViewCell {

    public static let identifier = "TopicExternalLinkTableViewCell"
    
    var urlString: String = ""
    let urlLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "text not set"
        l.textColor = QwkColors.buttonColor
        return l
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.addSubview(urlLabel)

        NSLayoutConstraint.activate([
            urlLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            urlLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
        ])
    }
}
