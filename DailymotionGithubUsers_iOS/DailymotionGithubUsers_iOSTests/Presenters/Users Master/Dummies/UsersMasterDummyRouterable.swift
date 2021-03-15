//
//  UsersMasterDummyRouterable.swift
//  DailymotionGithubUsers_iOSTests
//
//  Created by Adrian Kaczmarek on 15/03/2021.
//

@testable import DailymotionGithubUsers_iOS
@testable import DailymotionGithubUsers_UI
@testable import DailymotionGithubUsers_Core

class UsersMasterDummyRouterable: Router, UsersMasterRouterable {
    var navigatedToUserDetail: (User) -> Void = { _ in }
    func navigateToUserDetail(_ user: User) {
        navigatedToUserDetail(user)
    }
}
