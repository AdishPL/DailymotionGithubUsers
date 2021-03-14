//
//  UsersViewFactory.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import Foundation
import DailymotionGithubUsers_Core

struct UsersViewFactory: ViewFactory {
    static func buildUsersMasterView() -> Module {
        let view: UsersMasterViewController = AppModules.Users.usersMaster.loadView(bundle: DailymotionGithubUsers_iOSBundle)
        let router = UsersMasterRouter(screenNavigator: ScreenNavigator())
        let presenter = UsersMasterPresenter(
            view: view,
            router: router,
            usersRepository: Core.shared.usersRepository
        )
        view._presenter = presenter

        return Module(view: view, presenter: presenter, router: router)
    }
    
    static func buildUserDetailView(with data: Any? = nil) -> Module {
        let view: UserDetailViewController = AppModules.Users.userDetail.loadView(bundle: DailymotionGithubUsers_iOSBundle)
        let router = UserDetailRouter(screenNavigator: ScreenNavigator())
        let presenter = UserDetailPresenter(
            view: view,
            router: router
        )
        view._presenter = presenter
        presenter.setup(with: data)
        
        return Module(view: view, presenter: presenter, router: router)
    }
}
