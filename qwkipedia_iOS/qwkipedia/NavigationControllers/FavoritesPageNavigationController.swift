//
//  FavoritesPageNavigationController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/17/21.
//

import UIKit

class FavoritesPageNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.titleTextAttributes = [.foregroundColor: QwkColors.textColor,
                                                  .font: UIFont(name: "Timmana", size: 25.0)!]
    }

}
