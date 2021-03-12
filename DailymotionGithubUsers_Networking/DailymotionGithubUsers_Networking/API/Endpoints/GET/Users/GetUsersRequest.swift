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
        return "/users"
    }
}
