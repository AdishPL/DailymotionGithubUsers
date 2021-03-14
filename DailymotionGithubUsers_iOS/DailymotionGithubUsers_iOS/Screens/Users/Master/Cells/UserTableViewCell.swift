//
//  UserTableViewCell.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import UIKit
import DailymotionGithubUsers_UI

final class UserTableViewCell: UITableViewCell {
}

// -----------------------------------------------------------------------------
// MARK: - ConfigurableCell Extension
// -----------------------------------------------------------------------------
extension UserTableViewCell: ConfigurableCell {
    func configure(with model: CellViewModel) {
        guard let model = model as? UserCellModel else { return }
        textLabel?.text = model.title
        detailTextLabel?.text = model.title
        
    }
}
