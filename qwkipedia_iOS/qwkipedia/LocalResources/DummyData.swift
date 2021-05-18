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

    static let videoURL: String = "https://www.youtube.com/watch?v=B1CPE6WWsAQ"
    static let image: UIImage = #imageLiteral(resourceName: "Image")
    
    static let expertSummary = "A puppy is a juvenile dog. Some puppies can weigh 1–1.5 kg (1-3 lb), while larger ones can weigh up to 7–11 kg (15-23 lb). All healthy puppies grow quickly after birth. A puppy's coat color may change as the puppy grows older, as is commonly seen in breeds such as the Yorkshire Terrier. Puppy refers specifically to young dogs,[1] while pup may be used for other animals such as wolves, seals, giraffes, guinea pigs, rats or sharks.[2].Born after an average of 63 days of gestation, puppies emerge in an amnion that is bitten off and eaten by the mother dog.[3] Puppies begin to nurse almost immediately. If the litter exceeds six puppies, particularly if one or more are obvious runts, human intervention in hand-feeding the stronger puppies is necessary to ensure that the runts get proper nourishment and attention from the mother. As they reach one month of age, puppies are gradually weaned and begin to eat solid food. The mother may regurgitate partially digested food for the puppies or might let them eat some of her solid food.[4] The mother usually refuses to nurse at this stage, though she might let them occasionally nurse for comfort.At first, puppies spend the large majority of their time sleeping and the rest feeding. They instinctively pile together into a heap, and become distressed if separated from physical contact with their littermates, by even a short distance.[5] Puppies are born with a fully functional sense of smell. They are unable to open their eyes. During their first two weeks, a puppy's senses all develop rapidly. During this stage the nose is the primary sense organ used by puppies to find their mother's teats, and to locate their littermates, if they become separated by a short distance. Puppies open their eyes about nine to eleven days following birth. At first, their retinas are poorly developed and their vision is poor. Puppies are not able to see as well as adult dogs. In addition, puppies' ears remain sealed until about thirteen to seventeen days after birth, after which they respond more actively to sounds. Between two and four weeks old, puppies usually begin to growl, bite, wag their tails, and bark.[6] Puppies develop very quickly during their first three months, particularly after their eyes and ears open and they are no longer completely dependent on their mother. Their coordination and strength improve, they spar with their littermates, and begin to explore the world outside the nest. They play wrestling, chase, dominance, and tug-of-war games."
    
    static let urls = [
        ["PetFinder.com", "https://www.petfinder.com/pet-adoption/dog-adoption/puppies-for-adoption/"],
        ["TheSprucePets.com", "https://www.thesprucepets.com/puppies-4162145"],
        ["ThePuppySpot.com", "https://www.puppyspot.com"],
    ]
    
    static let recomendations: [TempItem] = [
        TempItem(name: "Puppy", image: #imageLiteral(resourceName: "Image"), description: ""),
        TempItem(name: "Intellijel Rubicon", image: #imageLiteral(resourceName: "synth.jpg"), description: ""),
        TempItem(name: "Lakers", image: #imageLiteral(resourceName: "lakers"), description: ""),
        TempItem(name: "Cocker Spaniel", image: #imageLiteral(resourceName: "Image"), description: "")
    ]

    static let topicRecomendations: [TempItem] = [
        TempItem(name: "Dalmatian", image: #imageLiteral(resourceName: "dalmation"), description: "Dog with black and white spots"),
        TempItem(name: "Cocker Spaniel", image: #imageLiteral(resourceName: "Image"), description: "Dog with long ears"),
    ]
    
    static let previewData: [TempItem] = [
            TempItem(name: "Animals",image: #imageLiteral(resourceName: "animals"), description: "Animals (also called Metazoa) are multicellular eukaryotic organisms that form the biological kingdom Animalia. With few exceptions, animals consume organic material, breathe oxygen, are able to move, can reproduce sexually, and grow from a hollow sphere of cells, the blastula, during embryonic development. Over 1.5 million living animal species have been described—of which around 1 million are insects—but it has been estimated there are over 7 million animal species in total. Animals range in length from 8.5 micrometres (0.00033 in) to 33.6 metres (110 ft). They have complex interactions with each other and their environments, forming intricate food webs. The scientific study of animals is known as zoology."),
            TempItem(name: "Apples", image: #imageLiteral(resourceName: "apples"), description: "An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today. Apples have been grown for thousands of years in Asia and Europe and were brought to North America by European colonists. Apples have religious and mythological significance in many cultures, including Norse, Greek, and European Christian tradition." ),
            TempItem(name: "Basketball", image: #imageLiteral(resourceName: "basketball") , description: "Basketball is a team sport in which two teams, most commonly of five players each, opposing one another on a rectangular court, compete with the primary objective of shooting a basketball (approximately 9.4 inches (24 cm) in diameter) through the defender's hoop (a basket 18 inches (46 cm) in diameter mounted 10 feet (3.048 m) high to a backboard at each end of the court) while preventing the opposing team from shooting through their own hoop. A field goal is worth two points, unless made from behind the three-point line, when it is worth three. After a foul, timed play stops and the player fouled or designated to shoot a technical foul is given one, two or three one-point free throws. The team with the most points at the end of the game wins, but if regulation play expires with the score tied, an additional period of play (overtime) is mandated."),
            TempItem(name: "Cats", image: #imageLiteral(resourceName: "cats"), description: "The cat (Felis catus) is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family. A cat can either be a house cat, a farm cat or a feral cat; the latter ranges freely and avoids human contact. Domestic cats are valued by humans for companionship and their ability to hunt rodents. About 60 cat breeds are recognized by various cat registries."),
            TempItem(name: "Guitars",image: #imageLiteral(resourceName: "guitar"), description: "The guitar is a fretted musical instrument that typically has six strings. It is held flat against the player's body and played by strumming or plucking the strings with the dominant hand, while simultaneously pressing the strings against frets with the fingers of the opposite hand. A plectrum or individual finger picks may be used to strike the strings. The sound of the guitar is projected either acoustically, by means of a resonant chamber on the instrument, or amplified by an electronic pickup and an amplifier." ),
            TempItem(name: "Irvine, California", image: #imageLiteral(resourceName: "irvine"), description: "Irvine is a master-planned city in Orange County, California, United States in the Los Angeles metropolitan area. The Irvine Company started developing the area in the 1960s and the city was formally incorporated on December 28, 1971. The 66-square-mile (170 km2) city[12] had a population of 212,375 as of the 2010 census; in 2019, the California Department of Finance estimated the city's population at 287,401, making it the 72nd-most populous city in the United States."),
            TempItem(name: "Intellijel Rubicon", image: #imageLiteral(resourceName: "synth.jpg"), description: "Rubicon2 is a flexible, feature-rich, completely analog oscillator ready to scream or sing to meet the demands of your patch and the desires of your imagination.It features nine simultaneously available waveshape outputs; two sub-oscillators; three variations of a sine wave; a new Tri-State pulse circuit; exponential Frequency Modulation (FM); linear FM; hard and soft (flip) sync; pulse width modulation; CV control of FM index; a new foldable Warp circuit; and the ability to perform perfectly-symmetrical Thru-zero FM with no change in pitch or tracking accuracy."),
            TempItem(name: "Lakers", image: #imageLiteral(resourceName: "lakers"), description: "The Los Angeles Lakers are an American professional basketball team based in Los Angeles. The Lakers compete in the National Basketball Association (NBA) as a member of the league's Western Conference Pacific Division. The Lakers play their home games at Staples Center, an arena shared with the NBA's Los Angeles Clippers, the Los Angeles Sparks of the Women's National Basketball Association, and the Los Angeles Kings of the National Hockey League.[10] The Lakers are one of the most successful teams in the history of the NBA, and have won 17 NBA championships, tied with the Boston Celtics for the most in NBA history."),
            TempItem(name: "Puppy", image: #imageLiteral(resourceName: "puppy") , description: "A puppy is a juvenile dog. Some puppies can weigh 1–1.5 kg (1-3 lb), while larger ones can weigh up to 7–11 kg (15-23 lb). All healthy puppies grow quickly after birth. A puppy's coat color may change as the puppy grows older, as is commonly seen in breeds such as the Yorkshire Terrier. Puppy refers specifically to young dogs,[1] while pup may be used for other animals such as wolves, seals, giraffes, guinea pigs, rats or sharks."),
    ]
}


struct TempItem {
    var name: String
    var image: UIImage?
    var description: String
}
