//
//  String+Addition.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 01/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

extension String {
    
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
