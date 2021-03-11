//
//  HTTPHeader.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

struct HTTPHeader {
    let key: String
    let value: String
}

extension HTTPHeader {
    static func contentType(contentType: HTTPHeader.ContentType) -> Self {
        HTTPHeader(key: "Content-Type", value: contentType.type)
    }
    
    static func authorization(_ authorization: HTTPHeader.Authorization) -> Self {
        HTTPHeader(key: "Authorization", value: authorization.type)
    }
}
