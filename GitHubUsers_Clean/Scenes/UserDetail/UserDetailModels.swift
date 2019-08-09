//
//  UserDetailModels.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 05/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

enum ShowUserDetail
{
  // MARK: Use cases
  
  enum GetUserDetail
  {
    struct Request
    {
    }
    struct Response
    {
      var userDetail: UserDetail
    }
    struct ViewModel
    {
      struct DisplayedUserDetail
      {
        var userIdentifier: Int
        var username: String
      }
      var displayedUserDetail: DisplayedUserDetail
    }
  }
}

enum ShowMessages
{
  // MARK: Use cases
  
  enum GetMessages
  {
    struct Request
    {
    }
    struct Response
    {
      var message: [Message]?
    }
    struct ViewModel
    {
      struct DisplayedMessage
      {
        var isMe: Bool
        var textMessage: String
      }
      var displayedMessages: [DisplayedMessage]
    }
  }
}
