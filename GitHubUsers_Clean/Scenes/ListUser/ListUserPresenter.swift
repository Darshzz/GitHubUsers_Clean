//
//  ListUserPresenter.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 02/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

protocol ListUsersPresentationLogic
{
  func presentFetchedUsers(response: ListUsers.FetchUsers.Response)
}

class ListUsersPresenter: ListUsersPresentationLogic {
    
    weak var viewController: ListUsersDisplayLogic?
    
    func presentFetchedUsers(response: ListUsers.FetchUsers.Response) {
        var displayedUsers: [ListUsers.FetchUsers.ViewModel.DisplayedUser] = []
        for user in response.users ?? [] {
            let displayUser = ListUsers.FetchUsers.ViewModel.DisplayedUser(userIdentifier: user.id, username: user.login, profileImage: user.avatar_url)
            displayedUsers.append(displayUser)
        }
        let viewModel = ListUsers.FetchUsers.ViewModel(displayedUsers: displayedUsers)
        viewController?.displayFetchedUsers(result: viewModel)
    }
}
