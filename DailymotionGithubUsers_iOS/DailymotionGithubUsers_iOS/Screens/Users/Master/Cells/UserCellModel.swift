//
//  UserCellModel.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import DailymotionGithubUsers_UI

final class UserCellModel: CellViewModel {
    let title: String

    init(title: String, onCellClicked: @escaping () -> Void) {
        self.title = title
        super.init(reuseIdentifier: NSStringFromClass(UserTableViewCell.self),
                   onCellClicked: onCellClicked)
    }
}
