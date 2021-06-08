//
//  MessageCell.swift
//  qwkipedia
//
//  Created by Anahita Abadian on 5/7/21.
//

import UIKit

class MessageCell: UITableViewCell {

    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var messageFrame: UIView!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameLabel.font = .boldSystemFont(ofSize: 14)
        leftImageView.tintColor = QwkColors.buttonColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
