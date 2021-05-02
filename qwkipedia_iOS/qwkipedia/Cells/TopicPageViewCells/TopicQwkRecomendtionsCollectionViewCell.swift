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
    

    fileprivate let titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Qwk Recommendations"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    fileprivate let moreButton: UIButton = {
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(moreButton)
        moreButton.addTarget(self, action: #selector(moreButtonPressed), for: .touchUpInside)

    
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
        contentView.layer.borderWidth = 0.5
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: collectionView.topAnchor),

            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: moreButton.topAnchor, constant: 8),

            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8), 
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8), 

        ])
        
    }
    
    @objc func moreButtonPressed(sender: UIButton!) {
        print("qwk recommendations more pressed")
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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width, height: 80)
    }
    
    
}
