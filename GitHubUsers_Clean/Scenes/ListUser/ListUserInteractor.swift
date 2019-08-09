//
//  ListUserInteractor.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 02/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

protocol ListUsersBusinessLogic
{
  var dataStore: ListUsersDataStoreLogic { get }
    func fetchUsers(request: ListUsers.FetchUsers.Request)
}

class ListUsersInteractor: ListUsersBusinessLogic
{
  var presenter: ListUsersPresentationLogic?
  let usersWorker = ListUsersWorker(network: NetworkManager())
  var dataStore: ListUsersDataStoreLogic
    
    init(dataStore: ListUsersDataStoreLogic) {
        self.dataStore = dataStore
    }
    
  // MARK: - Fetch orders
  func fetchUsers(request: ListUsers.FetchUsers.Request)
  {
    usersWorker.fetchUsers { (users) in
        self.dataStore.users = users
        let response = ListUsers.FetchUsers.Response(users: users)
        self.presenter?.presentFetchedUsers(response: response)
    }
  }
}
