//
//  LaunchPresenter.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import Foundation

final class LaunchPresenter: Presenter, LaunchPresentable {
    init(view: LaunchViewable,
         router: LaunchRouterable) {
        super.init(view, router)
    }
}

extension LaunchPresenter {
    var view: LaunchViewable? {
        return _view as? LaunchViewable
    }
    var router: LaunchRouterable {
        return _router as! LaunchRouterable
    }
}
