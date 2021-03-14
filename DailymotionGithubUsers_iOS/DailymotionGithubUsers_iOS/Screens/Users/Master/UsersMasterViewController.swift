//
//  UsersMasterViewController.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import DailymotionGithubUsers_UI
import UIKit

public final class UsersMasterViewController: Viewer, ViewSpecificController {
    typealias RootView = UsersMasterRootView
        
    // MARK: - Managing the View

    public override func loadView() {
        view = UsersMasterRootView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        presenter.bind()
    }
}

// MARK: - Protocol Implementation

extension UsersMasterViewController: UsersMasterViewable {
    func load(_ dataSource: [CellViewModel]) {
        rootView.loadDataSource(dataSource)
    }
    
    func showLoader(_ enabled: Bool) {
        rootView.toggleLoaderVisibility()
    }
}

// swiftlint:disable all
extension UsersMasterViewController {
    var presenter: UsersMasterPresentable {
        return _presenter as! UsersMasterPresentable
    }
}
//swiftlint: enable all
