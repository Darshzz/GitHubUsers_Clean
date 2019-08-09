//
//  ListUserDataStore.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 05/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

protocol ListUsersDataStoreLogic
{
  var users: [UserDetail]? { get set }
}

class ListUserDataStore: ListUsersDataStoreLogic {
    
    var users: [UserDetail]?
}
