//
//  MorePageViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/2/21.
//

import UIKit

class MorePageViewController: UIViewController {
 
    var type: TopicCellType = .qwkDescription
    
    @IBOutlet weak var label: UILabel!
    var value = "empty"
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = value
        
    }
    
    
}
