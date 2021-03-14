//
//  UITableView+BuildTableView.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import UIKit

public extension UITableView {
    @discardableResult
    class func buildTableView(
        style: UITableView.Style = .plain,
        clipsToBounds: Bool = true,
        separatorStyle: UITableViewCell.SeparatorStyle = .none,
        allowsMultipleSelectionDuringEditing: Bool = false
    ) -> UITableView {
        let tableView = UITableView(frame: .zero, style: style)
        tableView.backgroundColor = AppDesign.current.appBackgroundColor
        tableView.clipsToBounds = clipsToBounds
        tableView.separatorStyle = separatorStyle
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsMultipleSelectionDuringEditing = allowsMultipleSelectionDuringEditing

        return tableView
    }
}
