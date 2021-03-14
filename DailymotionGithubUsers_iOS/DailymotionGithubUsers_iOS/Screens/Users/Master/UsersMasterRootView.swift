//
//  UsersMasterRootView.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import UIKit
import DailymotionGithubUsers_UI

class UsersMasterRootView: NiblessView {
    private weak var activityIndicator: UIActivityIndicatorView?
    private weak var tableView: UITableView?
    
    override func style() {
        super.style()
    }
    
    override func constructHierarchy() {
        addActivityIndicator()
    }
    
    override func activateConstraints() {
        guard
            let `activityIndicator` = activityIndicator
        else {
            return
        }
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

private extension UsersMasterRootView {
    func addActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.color = AppDesign.current.activityIndicatorColor
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        self.activityIndicator = activityIndicator
    }
}
