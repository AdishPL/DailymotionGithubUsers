//
//  Presenter.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import UIKit

protocol Presentable: AnyObject {
    var _view: Viewable! { get set }
    var _router: Routable! { get set }

    func bind()
    func passData(_ data: Any)
    func localize()

    func viewHasLoaded()
    func viewIsAboutToDisappear()
    func viewIsAboutToAppear()
    func viewHasAppeared()
    func viewHasDisappeared()
}

open class Presenter: Presentable {
    weak var _view: Viewable!
    var _router: Routable!

    init(_ view: Viewable, _ router: Routable) {
        _view = view
        _view._presenter = self
        _router = router
        _router._presenter = self
    }

    open func bind() {
    }

    open func passData(_ data: Any) {}

    @objc
    open func localize() {
        _view.localize()
    }

    open func viewHasLoaded() {
        localize()
    }
    open func viewIsAboutToDisappear() {}
    open func viewIsAboutToAppear() {}
    open func viewHasAppeared() {}
    open func viewHasDisappeared() {}
}
