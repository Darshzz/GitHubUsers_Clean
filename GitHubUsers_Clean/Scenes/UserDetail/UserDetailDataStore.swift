//
//  UserDetailDataStore.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 05/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

protocol UserDetailDataStoreLogic
{
  var userDetail: UserDetail! { get set }
  var messages: [Message]? { get set }
}

class UserDetailDataStore: UserDetailDataStoreLogic {
    
    var messages: [Message]? = []
    var userDetail: UserDetail!
    
}
