//
//  LaunchRouter.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import Foundation
import DailymotionGithubUsers_UI

class LaunchRouter: Router, LaunchRouterable {
    func navigateToUsersMasterScreen() {
        let usersMasterScreen = NextScreen(AppModules.Users.usersMaster, navigationType: .switchRoot(embedInNavigationController: true))
        navigate(to: usersMasterScreen)
    }
}
