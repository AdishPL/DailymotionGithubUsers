//
//  User.swift
//  DailymotionGithubUsers_Core
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import Foundation
import DailymotionGithubUsers_Networking

public struct User {
    public let username: String
    public let photoUrl: URL
    public let thirdPartyService: String?
}

extension User {
    init(from response: UserResponse) {
        self.username = response.username
        self.photoUrl = response.photoUrl
        thirdPartyService = response.service.rawValue
    }
}
