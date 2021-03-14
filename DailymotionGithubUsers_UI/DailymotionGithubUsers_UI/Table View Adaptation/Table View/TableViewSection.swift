//
//  TableViewSection.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import Foundation

public class TableViewSection {
    // MARK: - Public Properties

    public var header: TableViewHeaderFooterViewModel?
    public var footer: TableViewHeaderFooterViewModel?

    public var items: [CellViewModel]

    // MARK: - Initialization

    public init(header: TableViewHeaderFooterViewModel? = nil,
                footer: TableViewHeaderFooterViewModel? = nil,
                items: [CellViewModel]) {
        self.header = header
        self.footer = footer

        self.items = items
    }

    // MARK: - Getting Elements of Specific Type

    /// Also considers header and footer.
    public func elements<T>(of type: T.Type) -> [T] {
        var elements: [T] = []

        if let header = header as? T {
            elements.append(header)
        }

        if let footer = footer as? T {
            elements.append(footer)
        }

        elements += items.compactMap { $0 as? T }

        return elements
    }
}
