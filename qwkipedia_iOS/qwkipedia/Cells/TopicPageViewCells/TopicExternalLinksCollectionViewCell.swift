//
//  TopicExternalLinksCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicExternalLinksCollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    public static let identifier = "topicPageExternalLinksCell"

    
    
    var numberOfCells = 0 {
        didSet {
            if (numberOfCells > 3) {
                fatalError("Max number of cells is set to be 3 (change later)")
            }
        }
    }
    
    let moreButton: UIButton = {
        let b = UIButton()
        let rightArrow = UIImage(systemName: "arrow.right")
        b.setImage(rightArrow, for: .normal)
        b.tintColor = QwkColors.buttonColor
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()
    
    let urlStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 1.0
        sv.distribution = .fillEqually
        return sv
    }()
    
    let urlView1: UrlStackViewCell = {
        let v = UrlStackViewCell()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let urlView2: UrlStackViewCell = {
        let v = UrlStackViewCell()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let urlView3: UrlStackViewCell = {
        let v = UrlStackViewCell()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()

    let label1: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "one"
        l.textColor = QwkColors.buttonColor
        return l
    }()
    
    let label2: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "two"
        l.textColor = QwkColors.buttonColor
        return l
    }()
    
    
    let label3: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "three"
        l.textColor = QwkColors.buttonColor
        return l
    }()
    
    let urlImage1: UIImageView = {
        let iv = UIImageView()
        let globeImage = UIImage(systemName: "globe")
        iv.image = globeImage
        iv.tintColor = QwkColors.buttonColor
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let urlImage2: UIImageView = {
        let iv = UIImageView()
        let globeImage = UIImage(systemName: "globe")
        iv.image = globeImage
        iv.tintColor = QwkColors.buttonColor
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let urlImage3: UIImageView = {
        let iv = UIImageView()
        let globeImage = UIImage(systemName: "globe")
        iv.image = globeImage
        iv.tintColor = QwkColors.buttonColor
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let sizeOfConstantAroundGlobe: CGFloat = 12.0

        if(DummyData.urls.count > 0){
            urlStackView.addArrangedSubview(urlView1)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(url1Clicked(_:)))
            tapGesture.delegate = self
            urlView1.addGestureRecognizer(tapGesture)
            urlView1.addSubview(label1)
            urlView1.addSubview(urlImage1)
    
            
            NSLayoutConstraint.activate([
                urlImage1.leadingAnchor.constraint(equalTo: urlView1.leadingAnchor, constant: sizeOfConstantAroundGlobe),
                urlImage1.topAnchor.constraint(equalTo: urlView1.topAnchor, constant: sizeOfConstantAroundGlobe),
                urlImage1.bottomAnchor.constraint(equalTo: urlView1.bottomAnchor, constant: -sizeOfConstantAroundGlobe),
                urlImage1.heightAnchor.constraint(equalTo: urlImage1.widthAnchor),
                
                label1.leadingAnchor.constraint(equalTo: urlImage1.trailingAnchor, constant: sizeOfConstantAroundGlobe),
                label1.centerYAnchor.constraint(equalTo: urlView1.centerYAnchor),
            ])
        }
        if(DummyData.urls.count > 1){
            urlStackView.addArrangedSubview(urlView2)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(url2Clicked(_:)))
            tapGesture.delegate = self
            urlView2.addGestureRecognizer(tapGesture)
            urlView2.addSubview(label2)
            urlView2.addSubview(urlImage2)

            NSLayoutConstraint.activate([
                urlImage2.leadingAnchor.constraint(equalTo: urlView2.leadingAnchor, constant: sizeOfConstantAroundGlobe),
                urlImage2.topAnchor.constraint(equalTo:     urlView2.topAnchor, constant: sizeOfConstantAroundGlobe),
                urlImage2.bottomAnchor.constraint(equalTo:  urlView2.bottomAnchor, constant: -sizeOfConstantAroundGlobe),
                urlImage2.heightAnchor.constraint(equalTo:  urlImage2.widthAnchor),
                
                label2.leadingAnchor.constraint(equalTo: urlImage2.trailingAnchor, constant: sizeOfConstantAroundGlobe),
                label2.centerYAnchor.constraint(equalTo: urlView2.centerYAnchor),
            ])
        }
        if(DummyData.urls.count > 2){
            urlStackView.addArrangedSubview(urlView3)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(url3Clicked(_:)))
            tapGesture.delegate = self
            urlView3.addGestureRecognizer(tapGesture)
            urlView3.addSubview(label3)
            urlView3.addSubview(urlImage3)

            NSLayoutConstraint.activate([
                urlImage3.leadingAnchor.constraint(equalTo: urlView3.leadingAnchor, constant: sizeOfConstantAroundGlobe),
                urlImage3.topAnchor.constraint(equalTo:     urlView3.topAnchor, constant: sizeOfConstantAroundGlobe),
                urlImage3.bottomAnchor.constraint(equalTo:  urlView3.bottomAnchor, constant: -sizeOfConstantAroundGlobe),
                urlImage3.heightAnchor.constraint(equalTo: urlImage3.widthAnchor),
                
                label3.leadingAnchor.constraint(equalTo: urlImage3.trailingAnchor, constant: sizeOfConstantAroundGlobe),
                label3.centerYAnchor.constraint(equalTo: urlView3.centerYAnchor),
            ])
        }
        
        contentView.addSubview(urlStackView)
        contentView.addSubview(moreButton)
        
//        contentView.addBottomBorderWithColor(color: QwkColors.outlineColor, width: 0.5)
//        contentView.addShadow(offset: CGSize.init(width: 0, height: 3), color: QwkColors.outlineColor, radius: 2.0, opacity: 0.5)
        
        NSLayoutConstraint.activate( [
            urlStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            urlStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            urlStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            urlStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
    }
    
    var urlViewButtonTapAction : ((String)->())?

    @objc func url1Clicked(_ sender: UITapGestureRecognizer) {
        urlViewButtonTapAction!(urlView1.url)
    }
    
    @objc func url2Clicked(_ sender: UITapGestureRecognizer) {
        urlViewButtonTapAction!(urlView2.url)
    }
    
    @objc func url3Clicked(_ sender: UITapGestureRecognizer) {
        urlViewButtonTapAction!(urlView3.url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
}






