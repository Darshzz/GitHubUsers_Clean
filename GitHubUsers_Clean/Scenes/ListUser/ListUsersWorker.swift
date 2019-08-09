//
//  ListUserWorker.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 02/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

class ListUsersWorker
{
    var networkManager: FetcherServiceProtocol!
    
    init(network: FetcherServiceProtocol) {
        self.networkManager = network
    }
    
    func fetchUsers(completionHandler: @escaping (([UserDetail]?) -> ())) {
        networkManager.get(.users) { (result: [UserDetail]?, error) in
            completionHandler(result)
        }
    }
}
