//
//  UserListViewController.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 02/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit
import Kingfisher

protocol ListUsersDisplayLogic: class
{
  func displayFetchedUsers(result: ListUsers.FetchUsers.ViewModel)
}

class ListUserViewController: UIViewController, ListUsersDisplayLogic {

    // MARK: Propertise
    @IBOutlet weak var tableView: UITableView!

    var interactor: ListUsersBusinessLogic?
    var router: (NSObjectProtocol & ListUserRoutingLogic & ListUserDataPassing)?
    var displayedUsers: [ListUsers.FetchUsers.ViewModel.DisplayedUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "ListVC_Title".localize()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    
        setup()
        fetchUsers()
    }
    
    private func setup()
    {
      let viewController = self
      let dataStore = ListUserDataStore()
      let interactor = ListUsersInteractor(dataStore: dataStore)
      let presenter = ListUsersPresenter()
      let router = ListUsersRouter()
      viewController.interactor = interactor
      viewController.router = router
      interactor.presenter = presenter
      presenter.viewController = viewController
      router.viewController = viewController
      router.dataStore = dataStore
    }
    
    func fetchUsers()
    {
      interactor?.fetchUsers(request: ListUsers.FetchUsers.Request())
    }
    
    func displayFetchedUsers(result: ListUsers.FetchUsers.ViewModel) {
        displayedUsers = result.displayedUsers
        DispatchQueue.main.async {
            self.tableView.reloadData()            
        }
    }
}

// MARK: - Table view data source
extension ListUserViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedUsers.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let user = displayedUsers[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: "UserCell")
        if cell == nil {
          cell = UITableViewCell(style: .value1, reuseIdentifier: "UserCell")
          cell?.accessoryType = .disclosureIndicator
          cell?.selectionStyle = .none
        }
        
        cell?.textLabel?.text = "@\(user.username)"
        let resizingProcessor = ResizingImageProcessor(referenceSize: CGSize(width: 70, height: 70))
        cell?.imageView?.kf.setImage(with: URL(string: user.profileImage)!, placeholder: UIImage(named: "user"), options: [.processor(resizingProcessor)], progressBlock: nil, completionHandler: nil)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToChatWindow()
    }
}
