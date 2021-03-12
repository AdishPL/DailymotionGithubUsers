//
//  ThirdPartyServices.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

public enum ThirdPartyService {
    case dailymotion
    case github
}

extension ThirdPartyService {
    var baseUrl: URL {
        switch self {
        case .dailymotion:
            return URL(string: "https://api.dailymotion.com")!
        case .github:
            return URL(string: "https://api.github.com")!
        }
    }
}
