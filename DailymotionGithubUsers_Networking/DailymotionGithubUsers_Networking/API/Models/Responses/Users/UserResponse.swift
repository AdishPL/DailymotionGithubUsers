//
//  UserResponse.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import Foundation

public struct UserResponse {
    public let username: String
    public let photoUrl: URL
    public let service: ThirdPartyService
}

extension UserResponse: Decodable {
    private enum GithubCodingKeys: String, CodingKey {
        case username = "login" , avatarUrl = "avatar_url"
    }
    
    private enum DailymotionCodingKeys: String, CodingKey {
        case username, avatarUrl = "avatar_360_url"
    }
    
    public init(from decoder: Decoder) throws {
        let dailymotionContainer = try decoder.container(keyedBy: DailymotionCodingKeys.self)
        let githubContainer = try decoder.container(keyedBy: GithubCodingKeys.self)
        
        if let username = try dailymotionContainer.decodeIfPresent(String.self, forKey: .username),
           let photoUrl = try dailymotionContainer.decodeIfPresent(URL.self, forKey: .avatarUrl){
            self.username = username
            self.photoUrl = photoUrl
            service = .dailymotion
        } else if let username = try githubContainer.decodeIfPresent(String.self, forKey: .username),
                  let photoUrl = try githubContainer.decodeIfPresent(URL.self, forKey: .avatarUrl){
            self.username = username
            self.photoUrl = photoUrl
            service = .github
        } else {
            throw APIError.decoding
        }
    }
}
