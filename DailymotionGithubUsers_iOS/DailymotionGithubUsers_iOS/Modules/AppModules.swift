//
//  AppModules.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import Foundation
import DailymotionGithubUsers_UI

enum AppModules: String {
    case launch
    
    enum Users: String {
        case usersMaster
        case userDetail
    }
}

extension AppModules: ViperModule {
    func build(data: Any? = nil) -> Module {
        switch self {
        case .launch:
            return AppViewFactory.buildLaunchView()
        }
    }
}

// MARK: - Users

extension AppModules.Users: ViperModule {
    func build(data: Any? = nil) -> Module {
        switch self {
        case .usersMaster:
            return UsersViewFactory.buildUsersMasterView()
        case .userDetail:
            return UsersViewFactory.buildUserDetailView(with: data)
        }
    }
}
