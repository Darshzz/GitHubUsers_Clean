//
//  EndPoint.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 02/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation


enum NetworkEnvironment {
    case staging
}

public enum EndPoint {
    case users
}

extension EndPoint: EndPointType {
   
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .staging: return "https://api.github.com/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .users:
            return "users"
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .users:
            return .request
        }
    }
}


