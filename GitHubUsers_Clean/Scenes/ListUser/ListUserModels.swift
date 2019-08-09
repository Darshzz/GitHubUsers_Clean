//
//  ListUserModels.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 02/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

enum ListUsers
{
  // MARK: Use cases
  
  enum FetchUsers
  {
    struct Request
    {
    }
    struct Response
    {
      var users: [UserDetail]?
    }
    struct ViewModel
    {
      struct DisplayedUser
      {
        var userIdentifier: Int
        var username: String
        var profileImage: String
      }
      var displayedUsers: [DisplayedUser]
    }
  }
}
