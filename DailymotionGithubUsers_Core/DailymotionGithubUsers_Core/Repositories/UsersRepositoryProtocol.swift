//
//  UsersRepositoryProtocol.swift
//  DailymotionGithubUsers_Core
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import Foundation

public protocol UsersRepositoryProtocol {
    func retrieveUsers(_ completionHandler: @escaping ([User]?) -> Void)
}
