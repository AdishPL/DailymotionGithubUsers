//
//  UsersMasterRootView.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import UIKit
import DailymotionGithubUsers_UI

class UsersMasterRootView: NiblessView {
    // MARK: - Private Properties

    private weak var activityIndicator: UIActivityIndicatorView?
    private weak var tableView: UITableView?
    private let tableViewAdapter = TableViewAdapter()
    
    // MARK: - Adding the Subviews

    override func constructHierarchy() {
        addTableView()
        addActivityIndicator()
    }
    
    // MARK: - Making Constraints
    
    override func activateConstraints() {
        guard
            let `activityIndicator` = activityIndicator,
            let `tableView` = tableView
        else {
            return
        }
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Update data source
    
    func loadDataSource(_ dataSource: [CellViewModel]) {
        tableViewAdapter.load(dataSource)
    }
    
    // MARK: - Displaying loader
    
    func toggleLoaderVisibility() {
        activityIndicator?.isHidden.toggle()
    }
}

// MARK: - Adding the Subviews

private extension UsersMasterRootView {
    func addActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.color = AppDesign.current.activityIndicatorColor
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.isHidden = true
        self.activityIndicator = activityIndicator
    }
    
    func addTableView() {
        let tableView = UITableView.buildTableView(style: .plain, clipsToBounds: true, separatorStyle: .singleLine)
        addSubview(tableView)
        tableViewAdapter.set(tableView)
        tableViewAdapter.removeScrollIndicator()
        self.tableView = tableView
    }
}
