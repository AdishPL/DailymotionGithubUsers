//
//  UserCellModel.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import DailymotionGithubUsers_UI
import DailymotionGithubUsers_Core

final class UserCellModel: CellViewModel {
    let user: User

    init(user: User, onCellClicked: @escaping () -> Void) {
        self.user = user
        super.init(reuseIdentifier: NSStringFromClass(UserTableViewCell.self),
                   onCellClicked: onCellClicked)
    }
}
