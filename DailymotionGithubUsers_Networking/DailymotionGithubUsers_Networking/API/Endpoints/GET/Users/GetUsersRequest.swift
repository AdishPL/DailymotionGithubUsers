//
//  GetUsersRequest.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

struct GetUsersRequest: GetRequest {
    var queryParams: [String : [String]]?
    
    typealias Response = UsersResponse
        
    var resourceName: String {
        return "users"
    }
    
    init(fields: [GetUsersRequest.Fields]? = nil,
         page: Int = 1) {
        let additionalQueryParams: ([String : [String]]?) -> [String : [String]] = { dictionaryFields in
            let pageQueryParams = ["page" : ["\(page)"]]
            
            if let additionalQueryParams = dictionaryFields {
                return additionalQueryParams.merging(pageQueryParams) { (_, new) in new }
            } else {
                return pageQueryParams
            }
        }
        
        if let fields = fields {
            queryParams = additionalQueryParams(["fields": fields.map { $0.rawValue }])
        } else {
            queryParams = additionalQueryParams(nil)
        }
    }
}

extension GetUsersRequest {
    enum Fields: String, Encodable {
        case avatarUrl = "avatar_360_url"
        case username
    }
}
