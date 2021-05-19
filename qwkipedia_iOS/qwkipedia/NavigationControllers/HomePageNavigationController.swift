//
//  HomePageNavigationController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/17/21.
//

import UIKit

class HomePageNavigationController: UINavigationController {

    @IBOutlet weak var customNavigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        self.navigationBar.titleTextAttributes = [.foregroundColor: QwkColors.textColor,
                                                  .font: UIFont(name: "Timmana", size: 24.0)!]
        
    }
}
