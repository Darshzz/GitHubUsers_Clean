//
//  SuccessResponse.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 02/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

struct SuccessResponse: Decodable {
    let success: Bool
    let error_code: String
    let error_message: String
}
