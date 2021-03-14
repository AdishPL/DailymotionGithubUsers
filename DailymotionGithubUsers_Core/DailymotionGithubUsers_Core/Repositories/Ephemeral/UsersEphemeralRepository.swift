//
//  UsersEphemeralRepository.swift
//  DailymotionGithubUsers_Core
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import Foundation
import DailymotionGithubUsers_Networking

struct UsersEphemeralRepository: UsersRepositoryProtocol {
    private let usersService: UsersService
    
    init(usersService: UsersService = .init()) {
        self.usersService = usersService
    }
    
    public func retrieveUsers(_ completionHandler: @escaping ([User]?) -> Void) {
        usersService.fetchAllThirdPartyUsers { result in
            let usersResponse = try? result.get()
            completionHandler(usersResponse?.compactMap(User.init))
        }
    }
}
