//
//  HTTPHeader+ContentType.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

extension HTTPHeader {
    struct ContentType {
        let type: String
        
        init(_ type: String) {
            self.type = type
        }
    }
}

extension HTTPHeader.ContentType {
    static let applicationJson = HTTPHeader.ContentType("application/json")
}
