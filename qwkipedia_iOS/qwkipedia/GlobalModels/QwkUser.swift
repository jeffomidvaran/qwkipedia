//
//  QwkUser.swift
//  qwkipedia
//
//  Created by Anahita Abadian on 5/22/21.
//

import Firebase

class QwkUser {
    var uid : String
    var fullname: String
    var profilePictureURL: URL?

    init(snapshot: DocumentSnapshot) {
      self.uid = snapshot.documentID
      let value = snapshot.value(forKey: self.uid) as! [String: Any]
      self.fullname = value["full_name"] as? String ?? ""
      guard let profile_picture = value["profile_picture"] as? String,
        let profilePictureURL = URL(string: profile_picture) else { return }
      self.profilePictureURL = profilePictureURL
}
    init(dictionary: [String: String]) {
      self.uid = dictionary["uid"]!
      self.fullname = dictionary["full_name"] ?? ""
      guard let profile_picture = dictionary["profile_picture"],
      let profilePictureURL = URL(string: profile_picture) else { return }
      self.profilePictureURL = profilePictureURL
    }

    private init(user: User) {
      self.uid = user.uid
      self.fullname = user.displayName ?? ""
      self.profilePictureURL = user.photoURL
    }

    static func currentUser() -> QwkUser {
      return QwkUser(user: Auth.auth().currentUser!)
    }

    func author() -> [String: String] {
      return ["uid": uid, "full_name": fullname, "profile_picture": profilePictureURL?.absoluteString ?? ""]
    }
  }

  extension QwkUser: Equatable {
    static func ==(lhs: QwkUser, rhs: QwkUser) -> Bool {
      return lhs.uid == rhs.uid
    }
    static func ==(lhs: QwkUser, rhs: User) -> Bool {
      return lhs.uid == rhs.uid
    }
  }
