//
//  GetUsersRequest.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

struct GetUsersRequest: GetRequest {
    typealias Response = UsersResponse
        
    var resourceName: String {
        guard let fields = fields else {
            return "/users"
        }
        
        return "/users?fields="
            + fields.map { $0.rawValue }
            .joined(separator: ",")
    }
    
    private let fields: [GetUsersRequest.Fields]?
    
    init(fields: [GetUsersRequest.Fields]? = nil) {
        self.fields = fields
    }
}

extension GetUsersRequest {
    enum Fields: String, Encodable {
        case avatarUrl = "avatar_360_url"
        case username
    }
}
