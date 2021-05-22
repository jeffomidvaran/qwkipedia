//
//  TopicDiscussionCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit
import Firebase

class TopicDiscussionCollectionViewCell: UICollectionViewCell {
    public static let identifier = "topicPageDiscussionCell"

    let db = Firestore.firestore()
    var messages: [Message] = []
    var topic : String? = ""

    fileprivate let myLabel: UILabel = {
        let l = UILabel()
        l.text = "Discussion"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let chatButton: UIButton = {
        let b = UIButton()
        let rightArrow = UIImage(systemName: "arrow.right")
        b.setImage(rightArrow, for: .normal)
        b.tintColor = QwkColors.buttonColor
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        return tv
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: Constants.Identifiers.messageCellIdentifier)
        loadDiscussion()
        
        contentView.addSubview(myLabel)
        contentView.addSubview(chatButton)
        contentView.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8),
            
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            tableView.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: chatButton.topAnchor, constant: -8),
            
            
            chatButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8), 
            chatButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8), 
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
    
    func loadDiscussion() {
        
        db.collection(Constants.FStore.messagesCollection).order(by: Constants.FStore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
                
                self.messages = []
                
                if let e = error {
                     print("There was an issue retrieving data. \(e)")
                } else {
                    if let snapShotDocuments = querySnapshot?.documents {
                    for doc in snapShotDocuments {
                        let data = doc.data()
                        if let messageSender = data[Constants.FStore.senderField] as? String,
                           let messageBody = data[Constants.FStore.bodyField] as? String,
                        let messageTopic = data["topic"]as?String {
                            let newMessage = Message(sender: messageSender, body: messageBody, topic: messageTopic)
                            //show topic-related messages only
                            if (newMessage.topic == self.topic) {
                            self.messages.append(newMessage)
                            }
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                if (self.messages.count>0) {
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)}
                            }
                        }
                    }
                }
            }
        }
    }
    
}


extension TopicDiscussionCollectionViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.messageCellIdentifier, for:indexPath) as! MessageCell
        cell.messageLabel.text = messages[indexPath.row].body
        cell.nameLabel.text = messages[indexPath.row].sender
        //cell.dateLabel.text = messages[indexPath.row].date
        return cell
    }
    
}
