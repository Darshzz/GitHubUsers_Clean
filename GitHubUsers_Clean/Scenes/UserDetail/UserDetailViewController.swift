//
//  UserDetailViewController.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 05/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

protocol UserDetailDisplayLogic: class
{
    var displayedMessages: [ShowMessages.GetMessages.ViewModel.DisplayedMessage] { get set }
    func displayUserDetail(viewModel: ShowUserDetail.GetUserDetail.ViewModel)
    func displayMessages(viewModel: ShowMessages.GetMessages.ViewModel)
}

class UserDetailViewController: UIViewController, UserDetailDisplayLogic {
    
    // MARK: Propertise
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var constraintTableView_H: NSLayoutConstraint!
    
    var displayedMessages: [ShowMessages.GetMessages.ViewModel.DisplayedMessage] = []
    var interactor: (UserDetailBusinessLogic & UserChatMessages)?
    var router: (NSObjectProtocol & UserDetailRoutingLogic & UserDetailDataPassing)?

    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
      super.init(coder: aDecoder)
      setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getUserDetail()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShown), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

    @objc func keyboardDidShown(_ notification:Notification) {

        let info = notification.userInfo!
        let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        constraintTableView_H.constant = keyboardSize + 10
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        constraintTableView_H.constant = 0
    }
    
    // MARK: Setup
    
    private func setup()
    {
      let viewController = self
      let dataStore = UserDetailDataStore()
      let interactor = UserDetailInteractor(dataStore: dataStore)
      let presenter = UserDetailPresenter()
      let router = UserDetailRouter()
      viewController.interactor = interactor
      viewController.router = router
      interactor.presenter = presenter
      presenter.viewController = viewController
      router.viewController = viewController
      router.dataStore = dataStore
    }

    func getUserDetail()
    {
        interactor?.getUserDetail(request: ShowUserDetail.GetUserDetail.Request())
    }
    
    // MARK: UserDetailDisplayLogic Delegate
    func displayUserDetail(viewModel: ShowUserDetail.GetUserDetail.ViewModel) {
        self.navigationItem.title = viewModel.displayedUserDetail.username
    }
    
    func displayMessages(viewModel: ShowMessages.GetMessages.ViewModel) {
        displayedMessages = viewModel.displayedMessages
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.scrollToBottom()
        }
    }
    
    func scrollToBottom() {
        guard self.displayedMessages.count > 0 else { return }
        let indexPath = IndexPath(row: self.displayedMessages.count-1, section: 0)
        self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    // MARK: Button Actions
    @IBAction func btnSendMessage_Action(_ sender: Any) {
        
        guard !txtField.text!.isEmpty else { return }
        interactor?.createMessage(message: Message(isMe: true, text: txtField.text ?? ""))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.incomingMessage()
        }
    }
    
    func incomingMessage() {
        let text = "\(txtField.text ?? "") \(txtField.text ?? "")"
        interactor?.createMessage(message: Message(isMe: false, text: text))
        txtField.text = ""
    }
}


// MARK: - Table view data source
extension UserDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedMessages.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let message = displayedMessages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCellView", for: indexPath) as! ChatCellView
        
        cell.configure(message)
        return cell
    }
}

