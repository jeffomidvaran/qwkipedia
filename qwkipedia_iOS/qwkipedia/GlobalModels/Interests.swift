//
//  Interests.swift
//  qwkipedia
//
//  Created by Anahita Abadian on 5/14/21.
//

import UIKit

struct interests {
    var title: String
    var image:UIImage?
}
struct InterestChoices {
    static let interestsToChoose:[interests] = [
        
        interests(title: "Tech", image: #imageLiteral(resourceName: "Tech")),
        interests(title: "Sports", image: #imageLiteral(resourceName: "Sports")),
        interests(title: "Art", image: #imageLiteral(resourceName: "Art")),
        interests(title: "Music", image: #imageLiteral(resourceName: "Music")),
        interests(title: "Biology", image: #imageLiteral(resourceName: "Biology")),
        interests(title: "Animals", image: #imageLiteral(resourceName: "Image")),
        interests(title: "Design", image: #imageLiteral(resourceName: "Design")),
        interests(title: "Books", image: #imageLiteral(resourceName: "books")),
        interests(title: "Math", image: #imageLiteral(resourceName: "Math")),
        interests(title: "Physics", image: #imageLiteral(resourceName: "Physics")),
        interests(title: "Plants", image: #imageLiteral(resourceName: "plants")),        
        interests(title: "Philosophy", image: #imageLiteral(resourceName: "Phil"))
    
    ]

}
