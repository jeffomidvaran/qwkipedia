//
//  Constants.swift
//  qwkipedia
//
//  Created by Anahita Abadian on 4/18/21.
//

import Foundation

struct Constants {
    struct SegueNameConstants {
        static let createtoInterstSegue = "CreateToSetInterests"
        static let logintoCreateSegue = "LoginToCreate"
        static let createtologinSegue = "CreateToLogin"
        
    }

    struct Identifiers {
        static let messageCellIdentifier = "MessageTableViewCell"
        static let interestCellIdentifier = "SelectInterestsCollectionCell"
    }
    
    struct FStore {
        static let usersCollection = "users"
        static let username = "name"
        static let userid = "uid"
        static let email = "email"
        
        static let messagesCollection = "messages"
        static let senderField = "senderName"
        static let senderEmail = "senderEmail"
        static let bodyField = "body"
        static let dateField = "date"
        
        static let userDataCollection = "userPersonalData"
    }
}
