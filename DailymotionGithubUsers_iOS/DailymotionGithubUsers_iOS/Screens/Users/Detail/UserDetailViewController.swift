//
//  UserDetailViewController.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import Foundation
import DailymotionGithubUsers_Core

public final class UserDetailViewController: Viewer, ViewSpecificController {
    typealias RootView = UserDetailRootView
        
    // MARK: - Managing the View

    public override func loadView() {
        view = UserDetailRootView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        presenter.bind()
    }
}

// MARK: - Protocol Implementation

extension UserDetailViewController: UserDetailViewable {
    func setupView(with model: User) {
        rootView.assign(username: model.username,
                        userDestination: model.thirdPartyService,
                        userPhotoUrl: model.photoUrl)
    }
}

// swiftlint:disable all
extension UserDetailViewController {
    var presenter: UserDetailPresentable {
        return _presenter as! UserDetailPresentable
    }
}
//swiftlint: enable all
