//
//  VoterView.swift
//  VoterView
//
//  Created by Jeff Omidvaran on 5/2/21.
//

import UIKit

class VoterView: UIView {

    
    var voteCount = 0 {
        didSet{
            counterLabel.text = String(voteCount)
        }
    }
    
    var voterColor = QwkColors.buttonColor {
        didSet {
            upVote.tintColor = voterColor
            downVote.tintColor = voterColor
            counterLabel.tintColor = voterColor
        }
    }
    
    fileprivate var upVote: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        let arrowUp = UIImage(systemName: "arrowtriangle.up")
        b.setImage(arrowUp, for: .normal)
        
        return b
    }()
    
    
    fileprivate var downVote: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        let arrowDown = UIImage(systemName: "arrowtriangle.down")
        b.setImage(arrowDown, for: .normal)
        return b
    }()
    
    fileprivate var counterLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        
        l.textAlignment = .center
        return l
    }()
    
    
    fileprivate var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .center
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    private func setUpView() {
        stackView.addArrangedSubview(upVote)
        stackView.addArrangedSubview(counterLabel)
        stackView.addArrangedSubview(downVote)
        upVote.addTarget(self, action: #selector(incrementVoteCounter), for: .touchUpInside)
        downVote.addTarget(self, action: #selector(decrementVoteCounter), for: .touchUpInside)
        initilizeCounter()
        
        self.addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func initilizeCounter() {
        voteCount = 0;
    }
    
    @objc func incrementVoteCounter() {
        voteCount += 1
        let arrowUp = UIImage(systemName: "arrowtriangle.up.fill")
        upVote.setImage(arrowUp, for: .normal)
        
        let arrowDown = UIImage(systemName: "arrowtriangle.down")
        downVote.setImage(arrowDown, for: .normal)
    }
    
    @objc func decrementVoteCounter() {
        voteCount -= 1
        let arrowUp = UIImage(systemName: "arrowtriangle.up")
        upVote.setImage(arrowUp, for: .normal)
        
        let arrowDown = UIImage(systemName: "arrowtriangle.down.fill")
        downVote.setImage(arrowDown, for: .normal)
    }
}
