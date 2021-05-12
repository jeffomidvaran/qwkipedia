//
//  TopicExternalLinksCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicExternalLinksCollectionViewCell: UICollectionViewCell {
    public static let identifier = "topicPageExternalLinksCell"

    fileprivate let collectionView: UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ExternalLinkCollectionViewCell.self, forCellWithReuseIdentifier: ExternalLinkCollectionViewCell.identifier)
        return cv
    }() 


    let moreButton: UIButton = {
        let b = UIButton()
        b.setTitle("More", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = QwkColors.backgroundColor

        
        contentView.addSubview(collectionView)
        contentView.addSubview(moreButton)
        
//        contentView.layer.cornerRadius = 10
//        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
//        contentView.layer.borderWidth = 0.5

        NSLayoutConstraint.activate( [
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: moreButton.topAnchor, constant: 0),

            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
        ])
    }
     
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
}

extension TopicExternalLinksCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DummyData.urls.count >= 3 ? 3 : DummyData.urls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExternalLinkCollectionViewCell.identifier , for: indexPath) as! ExternalLinkCollectionViewCell
        if(indexPath[1] < 3){
            cell.setURL(url: DummyData.urls[indexPath[1]][1], surname: DummyData.urls[indexPath[1]][0])
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width, height: 30)
    }
}
    
