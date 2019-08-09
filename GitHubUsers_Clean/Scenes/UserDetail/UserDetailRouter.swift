//
//  UserDetailRouter.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 05/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

@objc protocol UserDetailRoutingLogic
{
  func routeToEditOrder()
}

protocol UserDetailDataPassing
{
  var dataStore: UserDetailDataStoreLogic? { get }
}

class UserDetailRouter: NSObject, UserDetailRoutingLogic, UserDetailDataPassing {

    weak var viewController: UserDetailDisplayLogic?
    var dataStore: UserDetailDataStoreLogic?

    func routeToEditOrder() {
        
    }    
}
