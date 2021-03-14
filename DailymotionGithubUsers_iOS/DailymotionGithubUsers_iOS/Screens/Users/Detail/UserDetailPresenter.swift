//
//  UserDetailPresenter.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import Foundation
import DailymotionGithubUsers_Core

final class UserDetailPresenter: Presenter, UserDetailPresentable {
    // MARK: - Private Properties

    private var setupData: User?

    // MARK: - Initialization

    init(view: UserDetailViewable,
         router: UserDetailRouterable) {
        super.init(view, router)
    }
    
    // MARK: - Binding
    
    override func bind() {
        super.bind()
        guard let model = setupData else { return }
        view?.setupView(with: model)
    }

    func setup(with data: Any? = nil) {
        guard let data = data as? User else { return }
        setupData = data
    }
}

// swiftlint:disable all
extension UserDetailPresenter {
    var view: UserDetailViewable? {
        return _view as? UserDetailViewable
    }
    var router: UserDetailRouterable {
        return _router as! UserDetailRouterable
    }
}
// swiftlint:enable all
