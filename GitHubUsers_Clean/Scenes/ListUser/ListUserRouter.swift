//
//  ListUserRouter.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 02/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

@objc protocol ListUserRoutingLogic
{
  func routeToChatWindow()
}

protocol ListUserDataPassing
{
  var dataStore: ListUsersDataStoreLogic? { get }
}

class ListUsersRouter: NSObject, ListUserDataPassing, ListUserRoutingLogic {
    
    weak var viewController: ListUserViewController?
    var dataStore: ListUsersDataStoreLogic?

    func routeToChatWindow() {
        
        let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToUserDetail(source: dataStore!, destination: &destinationDS)
        navigateToUserDetail(source: viewController!, destination: destinationVC)
    }
    
    // MARK: Navigation
     
     func navigateToUserDetail(source: ListUserViewController, destination: UserDetailViewController)
     {
       source.show(destination, sender: nil)
     }
    
    func passDataToUserDetail(source: ListUsersDataStoreLogic, destination: inout UserDetailDataStoreLogic)
    {
      let selectedRow = viewController?.tableView.indexPathForSelectedRow?.row
      destination.userDetail = source.users?[selectedRow!]
    }
}
