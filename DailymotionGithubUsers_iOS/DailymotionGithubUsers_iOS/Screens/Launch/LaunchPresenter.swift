//
//  LaunchPresenter.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import Foundation
import DailymotionGithubUsers_UI

final class LaunchPresenter: Presenter, LaunchPresentable {
    // MARK: - Initializer

    init(view: LaunchViewable,
         router: LaunchRouterable) {
        super.init(view, router)
    }
    
    // MARK: - Binding

    override func bind() {
        super.bind()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [unowned self] in
            self.router.navigateToUsersMasterScreen()
        }
    }
}

// swiftlint:disable all
extension LaunchPresenter {
    var view: LaunchViewable? {
        return _view as? LaunchViewable
    }
    var router: LaunchRouterable {
        return _router as! LaunchRouterable
    }
}
//swiftlint: enable all
