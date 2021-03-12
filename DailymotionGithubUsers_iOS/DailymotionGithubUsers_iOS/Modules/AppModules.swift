//
//  AppModules.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import Foundation

enum AppModules: String {
    case launch
}

extension AppModules: ViperModule {
    func build(data: Any? = nil) -> Module {
        switch self {
        case .launch:
            return AppViewFactory.buildLaunchView()
        }
    }
}
