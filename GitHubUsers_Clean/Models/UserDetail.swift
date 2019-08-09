//
//  UserDetail.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 04/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

struct UserDetail: Decodable {
    
    let id: Int
    let avatar_url: String
    let login: String
    
}
