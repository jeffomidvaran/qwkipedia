//
//  TopicQwkRecomendtionsCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicQwkRecomendtionsCollectionViewCell: UICollectionViewCell {
    public static let identifier = "topicPageQwkRecomnedationsCell"

    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(RecomendationCollectionViewCell.self, forCellWithReuseIdentifier: RecomendationCollectionViewCell.identifier)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = QwkColors.backgroundColor
        contentView.addSubview(collectionView)
    
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
        contentView.layer.borderWidth = 0.5
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
    
}

extension TopicQwkRecomendtionsCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DummyData.topicRecomendations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecomendationCollectionViewCell.identifier , for: indexPath) as! RecomendationCollectionViewCell
        
        cell.setData(title: DummyData.topicRecomendations[indexPath[1]].name,
                     shortDescription: DummyData.topicRecomendations[indexPath[1]].description,
                     imageData: DummyData.topicRecomendations[indexPath[1]].image ?? #imageLiteral(resourceName: "logo"))
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = QwkColors.outlineColor.cgColor
        cell.layer.borderWidth = 0.5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width, height: 50)
    }
    
    
}
