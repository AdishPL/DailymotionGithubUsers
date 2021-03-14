//
//  AppViewFactory.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import Foundation

protocol ViewFactory {}

struct AppViewFactory: ViewFactory {
    static func buildLaunchView() -> Module {
        let view: LaunchViewController = AppModules.launch.loadView(bundle: DailymotionGithubUsers_iOSBundle)
        let router = LaunchRouter(screenNavigator: ScreenNavigator())
        let presenter = LaunchPresenter(
            view: view,
            router: router
        )
        view._presenter = presenter

        return Module(view: view, presenter: presenter, router: router)
    }
}
