//
//  Core.swift
//  DailymotionGithubUsers_Core
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import Foundation

public class Core {
    // MARK: - Public Properties

    public static let shared = Core()
    
    public var usersRepository: UsersRepositoryProtocol {
        return repositories.ephemeral.usersRepository
    }

    // MARK: - Storage

    private let repositories: Repositories

    // MARK: - Initializer

    private init() {
        repositories = .init(ephemeral: .init(usersRepository: UsersEphemeralRepository()))
    }
}
