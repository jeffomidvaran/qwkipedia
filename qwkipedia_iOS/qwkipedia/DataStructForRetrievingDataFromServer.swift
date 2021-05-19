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
    var videoURL: URL?
    var externalLink: URL?
    var voteCount: Int = 0
}
