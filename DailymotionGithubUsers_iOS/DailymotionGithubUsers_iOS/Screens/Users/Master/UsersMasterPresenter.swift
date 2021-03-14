//
//  UsersMasterPresenter.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import Foundation
import DailymotionGithubUsers_UI

final class UsersMasterPresenter: Presenter, UsersMasterPresentable {
    // MARK: - Private Properties

    private var cells: [CellViewModel] = []

    // MARK: - Initialization

    init(view: UsersMasterViewable,
         router: UsersMasterRouterable) {
        super.init(view, router)
    }
    
    // MARK: - Binding

    override func bind() {
        super.bind()
    }
}

// swiftlint:disable all
extension UsersMasterPresenter {
    var view: UsersMasterViewable? {
        return _view as? UsersMasterViewable
    }
    var router: UsersMasterRouterable {
        return _router as! UsersMasterRouterable
    }
}
// swiftlint:enable all
