//
//  DummyData.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/23/21.
//

import Foundation
import UIKit


struct DummyData {
    static let title = "Puppy"
    static let qwkDescription = "A puppy is a juvenile dog. Some puppies can weigh 1–1.5 kg (1-3 lb), while larger ones can weigh up to 7–11 kg (15-23 lb). All healthy puppies grow quickly after birth. A puppy's coat color may change as the puppy grows older, as is commonly seen in breeds such as the Yorkshire Terrier. Puppy refers specifically to young dogs,[1] while pup may be used for other animals such as wolves, seals, giraffes, guinea pigs, rats or sharks.[2].Born after an average of 63 days of gestation, puppies emerge in an amnion that is bitten off and eaten by the mother dog.[3]"
    
//    Puppies begin to nurse almost immediately. If the litter exceeds six puppies, particularly if one or more are obvious runts, human intervention in hand-feeding the stronger puppies is necessary to ensure that the runts get proper nourishment and attention from the mother. As they reach one month of age, puppies are gradually weaned and begin to eat solid food. The mother may regurgitate partially digested food for the puppies or might let them eat some of her solid food.[4] The mother usually refuses to nurse at this stage, though she might let them occasionally nurse for comfort.At first, puppies spend the large majority of their time sleeping and the rest feeding. They instinctively pile together into a heap, and become distressed if separated from physical contact with their littermates, by even a short distance.[5] Puppies are born with a fully functional sense of smell. They are unable to open their eyes. During their first two weeks, a puppy's senses all develop rapidly. During this stage the nose is the primary sense organ used by puppies to find their mother's teats, and to locate their littermates, if they become separated by a short distance. Puppies open their eyes about nine to eleven days following birth. At first, their retinas are poorly developed and their vision is poor. Puppies are not able to see as well as adult dogs. In addition, puppies' ears remain sealed until about thirteen to seventeen days after birth, after which they respond more actively to sounds. Between two and four weeks old, puppies usually begin to growl, bite, wag their tails, and bark.[6] Puppies develop very quickly during their first three months, particularly after their eyes and ears open and they are no longer completely dependent on their mother. Their coordination and strength improve, they spar with their littermates, and begin to explore the world outside the nest. They play wrestling, chase, dominance, and tug-of-war games."

    static let videoURL: String = "https://www.youtube.com/watch?v=B1CPE6WWsAQ"
    static let image: UIImage = #imageLiteral(resourceName: "Image")
    
    static let expertSummary = "A puppy is a juvenile dog. Some puppies can weigh 1–1.5 kg (1-3 lb), while larger ones can weigh up to 7–11 kg (15-23 lb). All healthy puppies grow quickly after birth. A puppy's coat color may change as the puppy grows older, as is commonly seen in breeds such as the Yorkshire Terrier. Puppy refers specifically to young dogs,[1] while pup may be used for other animals such as wolves, seals, giraffes, guinea pigs, rats or sharks.[2].Born after an average of 63 days of gestation, puppies emerge in an amnion that is bitten off and eaten by the mother dog.[3] Puppies begin to nurse almost immediately. If the litter exceeds six puppies, particularly if one or more are obvious runts, human intervention in hand-feeding the stronger puppies is necessary to ensure that the runts get proper nourishment and attention from the mother. As they reach one month of age, puppies are gradually weaned and begin to eat solid food. The mother may regurgitate partially digested food for the puppies or might let them eat some of her solid food.[4] The mother usually refuses to nurse at this stage, though she might let them occasionally nurse for comfort.At first, puppies spend the large majority of their time sleeping and the rest feeding. They instinctively pile together into a heap, and become distressed if separated from physical contact with their littermates, by even a short distance.[5] Puppies are born with a fully functional sense of smell. They are unable to open their eyes. During their first two weeks, a puppy's senses all develop rapidly. During this stage the nose is the primary sense organ used by puppies to find their mother's teats, and to locate their littermates, if they become separated by a short distance. Puppies open their eyes about nine to eleven days following birth. At first, their retinas are poorly developed and their vision is poor. Puppies are not able to see as well as adult dogs. In addition, puppies' ears remain sealed until about thirteen to seventeen days after birth, after which they respond more actively to sounds. Between two and four weeks old, puppies usually begin to growl, bite, wag their tails, and bark.[6] Puppies develop very quickly during their first three months, particularly after their eyes and ears open and they are no longer completely dependent on their mother. Their coordination and strength improve, they spar with their littermates, and begin to explore the world outside the nest. They play wrestling, chase, dominance, and tug-of-war games."
    
    static let links = [
        "https://www.petfinder.com/pet-adoption/dog-adoption/puppies-for-adoption/",
        "https://en.wikipedia.org/wiki/Puppy",
        "https://www.thesprucepets.com/puppies-4162145"
    ]
    
    static let recomendations: [TempItem] = [
        TempItem(name: "puppy", image: #imageLiteral(resourceName: "Image")),
        TempItem(name: "Intellijel Rubicon", image: #imageLiteral(resourceName: "synth.jpg")),
        TempItem(name: "Lakers", image: #imageLiteral(resourceName: "lakers")),
    ]
}


struct TempItem {
    var name: String
    var image: UIImage?
}
