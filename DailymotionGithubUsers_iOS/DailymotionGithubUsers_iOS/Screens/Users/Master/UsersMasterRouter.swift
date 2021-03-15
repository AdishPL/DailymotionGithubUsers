//
//  UsersMasterRouter.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import Foundation
import DailymotionGithubUsers_Core
import DailymotionGithubUsers_UI

class UsersMasterRouter: Router, UsersMasterRouterable {
    func navigateToUserDetail(_ user: User) {
        let presentation = ViewPresentation(
            from: viewController,
            embedInNavigationController: true,
            presentationStyle: .fullScreen,
            closeButton: true)
        
        let userDetailScreen = NextScreen(AppModules.Users.userDetail, data: user, navigationType: .present(presentation))

        navigate(to: userDetailScreen)
    }
}
