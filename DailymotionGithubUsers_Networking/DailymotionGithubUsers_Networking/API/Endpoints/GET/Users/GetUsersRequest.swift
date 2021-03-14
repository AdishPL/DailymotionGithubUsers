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
        let usersResource = "users?page=\(page)&"
        
        guard let fields = fields else {
            return usersResource
        }
        
        return usersResource + "fields=" + fields.map { $0.rawValue }.joined(separator: ",")
    }
    
    private let fields: [GetUsersRequest.Fields]?
    private let page: Int
    
    init(fields: [GetUsersRequest.Fields]? = nil,
         page: Int = 1) {
        self.fields = fields
        self.page = page
    }
}

extension GetUsersRequest {
    enum Fields: String, Encodable {
        case avatarUrl = "avatar_360_url"
        case username
    }
}
