//
//  TopicExternalLinksCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicExternalLinksCollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    public static let identifier = "topicPageExternalLinksCell"

    var urlViewButtonTapAction : (()->())?
    var numberOfCells = 3 {
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
        l.textColor = QwkColors.highlightColorPurple
        return l
    }()
    
    let label2: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "two"
        l.textColor = QwkColors.highlightColorPurple
        return l
    }()
    
    
    let label3: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "three"
        l.textColor = QwkColors.highlightColorPurple
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if(DummyData.urls.count > 0){
            urlStackView.addArrangedSubview(urlView1)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickView(_:)))
            tapGesture.delegate = self
            urlView1.addGestureRecognizer(tapGesture)
            urlView1.addSubview(label1)
            
            NSLayoutConstraint.activate([
                label1.leadingAnchor.constraint(equalTo: urlView1.leadingAnchor, constant: 8),
                label1.centerYAnchor.constraint(equalTo: urlView1.centerYAnchor),
            ])
        }
        if(DummyData.urls.count > 1){
            urlStackView.addArrangedSubview(urlView2)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickView(_:)))
            tapGesture.delegate = self
            urlView2.addGestureRecognizer(tapGesture)
            urlView2.addSubview(label2)
            NSLayoutConstraint.activate([
                label2.leadingAnchor.constraint(equalTo: urlView2.leadingAnchor, constant: 8),
                label2.centerYAnchor.constraint(equalTo: urlView2.centerYAnchor),
            ])
        }
        if(DummyData.urls.count > 2){
            urlStackView.addArrangedSubview(urlView3)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickView(_:)))
            tapGesture.delegate = self
            urlView3.addGestureRecognizer(tapGesture)
            urlView3.addSubview(label3)
            NSLayoutConstraint.activate([
                label3.leadingAnchor.constraint(equalTo: urlView3.leadingAnchor, constant: 8),
                label3.centerYAnchor.constraint(equalTo: urlView3.centerYAnchor),
            ])
        }
        
        contentView.addSubview(urlStackView)
        contentView.addSubview(moreButton)
        
        contentView.addBottomBorderWithColor(color: QwkColors.outlineColor, width: 0.5)
        contentView.addShadow(offset: CGSize.init(width: 0, height: 3), color: QwkColors.outlineColor, radius: 2.0, opacity: 0.5)

//        contentView.layer.cornerRadius = 10
//        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
//        contentView.layer.borderWidth = 0.5
//        contentView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate( [
            urlStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            urlStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            urlStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            urlStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
        ])
    }
    
    @objc func clickView(_ sender: UIView) {
        print("You clicked on view")
        urlViewButtonTapAction!()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
}


//extension TopicExternalLinksCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return DummyData.urls.count >= 3 ? 3 : DummyData.urls.count
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: TopicExternalLinkTableViewCell.identifier, for: indexPath) as! TopicExternalLinkTableViewCell
//
//        cell.urlLabel.text = DummyData.urls[indexPath[1]][0]
//        cell.urlString = DummyData.urls[indexPath[1]][1]
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("button tapped \(indexPath)")
//        print(DummyData.urls[indexPath[1]][1])
//
//
//    }
//}



