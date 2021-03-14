//
//  LaunchRootView.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import UIKit
import DailymotionGithubUsers_UI

class LaunchRootView: NiblessView {
    // MARK: - Subviews

    private weak var activityIndicator: UIActivityIndicatorView?
    private weak var tableView: UITableView?
    
    override func constructHierarchy() {
        addActivityIndicator()
    }
    
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
            activityIndicator.leadingAnchor.constraint(equalTo: leadingAnchor),
            activityIndicator.trailingAnchor.constraint(equalTo: trailingAnchor),
            activityIndicator.topAnchor.constraint(equalTo: topAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Adding the Subviews

private extension LaunchRootView {
    func addActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.color = AppDesign.current.activityIndicatorColor
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        self.activityIndicator = activityIndicator
    }
    
    func addTableView() {
        let tableView = UITableView(frame: .zero)
        addSubview(tableView)
        self.tableView = tableView
    }
}
