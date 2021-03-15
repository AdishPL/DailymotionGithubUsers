//
//  Viewer.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 15/03/2021.
//

import UIKit

public protocol Viewable: ViewShowable {
    var _presenter: Presentable! { get set }

    func dismiss(completion: (() -> Void)?)
    func localize()
}

extension Viewable {
    public func dismiss(completion: (() -> Void)?) {
        dismiss(animated: true, completion: completion)
    }
}

open class Viewer: UIViewController, Viewable {
    public var _presenter: Presentable!

    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return AppDesign.current.statusBarStyle
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        makeConstraints()

        _presenter.viewHasLoaded()
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        _presenter.viewIsAboutToDisappear()
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _presenter.viewIsAboutToAppear()
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _presenter.viewHasAppeared()
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        _presenter.viewHasDisappeared()
    }

    @objc
    open func localize() {}
    open func addSubviews() {}
    open func makeConstraints() {}
}
