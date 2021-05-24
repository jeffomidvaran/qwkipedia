//
//  DataStructForRetrievingDataFromServer.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/19/21.
//

import Foundation
import UIKit

struct QwkDataFromServer {
    var authorImage: UIImage?
    var authorFirstName: String
    var authorLastName: String
    var qwkDescriptionText: String?
    var qwkImage: UIImage?
    var videoURL: String?
    var sortedTopExternalLinks: [QwkExternalLink]?
    var singleExternalLink: QwkExternalLink?
    var voteSum: Int = 0
}


struct QwkExternalLink {
    var url: String?
    var title: String?
}
