//
//  DiscussionViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/2/21.
//

import UIKit
import Firebase

class DiscussionViewController: UIViewController {
    var topic : String? = ""
    var handle: AuthStateDidChangeListenerHandle?
 
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textView: UIView!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        messageTextField.placeholder = "Join the discussion..."
        textView.layer.backgroundColor = .init(gray: 0.9, alpha: 0.5)
        sendButton.tintColor = QwkColors.buttonColor
        addTopBorder()
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: Constants.Identifiers.messageCellIdentifier)
        loadDiscussion()
       
    }
    func addTopBorder() {
       let thickness: CGFloat = 1.0
       let topBorder = CALayer()
       topBorder.frame = CGRect(x: 0.0, y: 0.0, width: self.textView.frame.size.width, height: thickness)
        topBorder.backgroundColor = QwkColors.outlineColor.cgColor
       textView.layer.addSublayer(topBorder)
 
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
                           let messageTopic = data["topic"]as?String,
                           let messageDate = data["timeStamp"] as? String{
                            let newMessage = Message(sender: messageSender, body: messageBody, topic: messageTopic, date:messageDate)
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
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {  //Storing the message-data in database
        let user = Auth.auth().currentUser
        //var senderName = ""
        
        if let messageBody = messageTextField.text,
           let messageSender = UserDefaults.standard.string(forKey: "Name") {
           if (!messageBody.isEmpty) { //Don't send empty messages
            
                         self.db.collection(Constants.FStore.messagesCollection).addDocument(data:
                                          [ Constants.FStore.senderEmail: user?.email!,
                                            Constants.FStore.senderField: messageSender,
                                            Constants.FStore.bodyField: messageBody,
                                            "topic": self.topic!,
                                            Constants.FStore.dateField: Date().timeIntervalSince1970 ,
                                            "timeStamp" : "June 6th, 2021"
                                              ]) { (error) in
                                    if let e = error {
                                        print("There was an issue saving data, \(e)")
                                    } else {
                                        print("Succesfuly saved data")
                                        DispatchQueue.main.async {
                                        self.messageTextField.text = ""
                                        }
                                    }
                                    
                                }
                                
                            }

   else {
                print("please type a message")
            }
        }
 
    }
}

extension DiscussionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.messageCellIdentifier, for:indexPath) as! MessageCell
        cell.messageLabel.text = messages[indexPath.row].body
        cell.nameLabel.text = messages[indexPath.row].sender
        cell.dateLabel.text = messages[indexPath.row].date
        return cell
    }
    
}
