//
//  HTTPHeader+Authorization.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

extension HTTPHeader {
    struct Authorization {
        let type: String
        
        init(_ type: String) {
            self.type = type
        }
    }
}

extension HTTPHeader.Authorization {
    static func basic(_ basicToken: String) -> Self {
        HTTPHeader.Authorization("Basic \(basicToken)")
    }
    
    static func bearer(_ bearerToken: String) -> Self {
        HTTPHeader.Authorization("Bearer \(bearerToken)")
    }
}
