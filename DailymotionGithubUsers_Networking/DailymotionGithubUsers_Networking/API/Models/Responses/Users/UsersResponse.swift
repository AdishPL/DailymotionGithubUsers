//
//  UsersResponse.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

struct UsersResponse {
    let list: [UserResponse]
}

extension UsersResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case list
    }
    
    init(from decoder: Decoder) throws {
        if let dailymotionStructure = try? decoder.container(keyedBy: CodingKeys.self) {
            list = try dailymotionStructure.decode([UserResponse].self, forKey: .list)
        } else if let githubStructure = try? decoder.singleValueContainer() {
            list = try githubStructure.decode([UserResponse].self)
        } else {
            throw APIError.decoding
        }
    }
}
