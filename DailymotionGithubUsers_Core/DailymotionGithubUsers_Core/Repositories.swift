//
//  Repositories.swift
//  DailymotionGithubUsers_Core
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import Foundation

struct Repositories {
    let ephemeral: EphemeralRepositories
}

// MARK: - Ephemeral

struct EphemeralRepositories {
    let usersRepository: UsersRepositoryProtocol
}
