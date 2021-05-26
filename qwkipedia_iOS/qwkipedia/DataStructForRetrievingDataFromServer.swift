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
    var authorFirstName: String?
    var itemID : String?
    //var authorLastName: String?
    var authorEmail: String?
    var qwkDescriptionText: String?
    var qwkImage: UIImage?
    var videoURL: String?
    var sortedTopExternalLinks: [QwkExternalLink]?
    var singleExternalLink: QwkExternalLink?
    var voteCount: Int?
}


struct QwkExternalLink {
    var url: String?
    var title: String?
}

