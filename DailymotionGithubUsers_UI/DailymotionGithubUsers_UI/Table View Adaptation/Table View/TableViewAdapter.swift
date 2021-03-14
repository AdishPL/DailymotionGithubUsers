//
//  TableViewAdapter.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import UIKit

// -----------------------------------------------------------------------------
// MARK: - Header or Footer View Model
// -----------------------------------------------------------------------------

public protocol TableViewHeaderFooterViewModel: AnyObject {
    var headerFooterClass: AnyClass? { get }
    var reuseIndentifier: String { get }
}

public extension TableViewHeaderFooterViewModel {
    var headerFooterClass: AnyClass? { return NSClassFromString(reuseIndentifier) }
}

// -----------------------------------------------------------------------------
// MARK: - Configurable Header or Footer View
// -----------------------------------------------------------------------------

public protocol ConfigurableTableViewHeaderFooterView: UITableViewHeaderFooterView {
    func configure(with model: TableViewHeaderFooterViewModel)
}

// -----------------------------------------------------------------------------
// MARK: - Table View Adapter
// -----------------------------------------------------------------------------

public class TableViewAdapter: NSObject {
    // MARK: - Private Properties

    private weak var tableView: UITableView?
    private var sections: [TableViewSection] = []

    // MARK: - Setting Table View

    public func set(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.dataSource = self
        tableView.delegate = self
    }

    public func removeScrollIndicator() {
        tableView?.showsHorizontalScrollIndicator = false
        tableView?.showsVerticalScrollIndicator = false
    }

    // MARK: - Loading Data

    public func load(_ items: [CellViewModel]) {
        load([.init(items: items)])
    }

    public func load(_ sections: [TableViewSection]) {
        self.sections = sections

        sections.forEach {
            if let header = $0.header {
                tableView?.registerHeaderFooterView(for: header)
            }

            if let footer = $0.footer {
                tableView?.registerHeaderFooterView(for: footer)
            }

            $0.items.forEach { tableView?.registerCell(for: $0) }
        }

        tableView?.reloadData()
    }

    // MARK: - Reloading Items

    public func reloadFirstItem<Item: CellViewModel>(ofType itemType: Item.Type,
                                                     with item: CellViewModel,
                                                     animation: UITableView.RowAnimation) {
        guard let indexPath = firstIndexPath(of: itemType) else { return }
        sections[indexPath.section].items[indexPath.row] = item
        tableView?.registerCell(for: item)
        tableView?.reloadRows(at: [indexPath], with: animation)
    }

    // MARK: - Inserting Items

    public func insert(_ item: CellViewModel,
                       at index: Int = 0,
                       with animation: UITableView.RowAnimation) {
        insert(item, at: .init(row: index, section: 0), with: animation)
    }

    public func insert(_ item: CellViewModel,
                       at indexPath: IndexPath,
                       with animation: UITableView.RowAnimation) {
        guard let section = getSection(indexPath.section),
              (0...section.items.count).contains(indexPath.row) else {
            return
        }
        section.items.insert(item, at: indexPath.row)
        tableView?.registerCell(for: item)
        tableView?.insertRows(at: [indexPath], with: animation)
    }

    // MARK: - Getting Sections and Items

    private func getSection(_ section: Int) -> TableViewSection? {
        return sections.indices.contains(section) ? sections[section] : nil
    }

    private func getItem(at indexPath: IndexPath) -> CellViewModel? {
        guard let items = getSection(indexPath.section)?.items,
              items.indices.contains(indexPath.row) else {
            return nil
        }
        return items[indexPath.row]
    }

    public func firstIndexPath<Item: CellViewModel>(of itemType: Item.Type) -> IndexPath? {
        for section in sections.enumerated() {
            guard let row = (section.element.items.firstIndex { $0 is Item }) else { continue }
            return .init(row: row, section: section.offset)
        }

        return nil
    }

    public func firstIndexPath<Item: CellViewModel>(of item: Item) -> IndexPath? {
        for section in sections.enumerated() {
            guard let row = (section.element.items.firstIndex { $0 === item }) else { continue }
            return .init(row: row, section: section.offset)
        }

        return nil
    }

    public func selectedItems() -> [CellViewModel] {
        guard let tableView = tableView, let selectedRows = tableView.indexPathsForSelectedRows else { return [] }
        return selectedRows.compactMap { getItem(at: $0) }
    }
}

// MARK: - Delegate

extension TableViewAdapter: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getItem(at: indexPath)?.onCellClicked?()
    }

    public func tableView(_ tableView: UITableView,
                          viewForHeaderInSection section: Int) -> UIView? {
        guard let header = getSection(section)?.header else { return nil }
        let view = tableView.dequeueReusableHeaderFooterView(with: header)
        (view as? ConfigurableTableViewHeaderFooterView)?.configure(with: header)
        return view
    }

    public func tableView(_ tableView: UITableView,
                          viewForFooterInSection section: Int) -> UIView? {
        guard let footer = getSection(section)?.footer else { return nil }
        let view = tableView.dequeueReusableHeaderFooterView(with: footer)
        (view as? ConfigurableTableViewHeaderFooterView)?.configure(with: footer)
        return view
    }

    public func tableView(_ tableView: UITableView,
                          heightForHeaderInSection section: Int) -> CGFloat {
        return getSection(section)?.header == nil ? 0 : UITableView.automaticDimension
    }

    public func tableView(_ tableView: UITableView,
                          heightForFooterInSection section: Int) -> CGFloat {
        return getSection(section)?.footer == nil ? 0 : UITableView.automaticDimension
    }

    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

// MARK: - Data Source

extension TableViewAdapter: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getSection(section)?.items.count ?? 0
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = getItem(at: indexPath) else { return .init() }
        let cell = tableView.dequeueReusableCell(with: item, for: indexPath)
        (cell as? ConfigurableCell)?.configure(with: item)
        return cell
    }
}
