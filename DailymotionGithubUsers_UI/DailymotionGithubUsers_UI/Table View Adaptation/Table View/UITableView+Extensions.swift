//
//  UITableView+Extensions.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import UIKit

extension UITableView {
    // MARK: - Registering and Dequeuing a Header or Footer

    func registerHeaderFooterView(for headerFooter: TableViewHeaderFooterViewModel) {
        register(
            headerFooter.headerFooterClass,
            forHeaderFooterViewReuseIdentifier: headerFooter.reuseIndentifier)
    }

    func dequeueReusableHeaderFooterView(
        with headerFooter: TableViewHeaderFooterViewModel
    ) -> UITableViewHeaderFooterView? {
        return dequeueReusableHeaderFooterView(withIdentifier: headerFooter.reuseIndentifier)
    }

    // MARK: - Registering and Dequeuing a Cell

    func registerCell(for item: CellViewModel) {
        register(item.cellClass, forCellReuseIdentifier: item.reuseIndentifier)
    }

    func dequeueReusableCell(with item: CellViewModel,
                             for indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: item.reuseIndentifier, for: indexPath)
    }
}
