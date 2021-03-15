//
//  Module.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 15/03/2021.
//

import Foundation

public enum VprComponent: String {
    case viewController
    case presenter
    case router
}

public struct Module {
    public private(set) var view: Viewable?
    public private(set) var presenter: Presentable?
    public private(set) var router: Routable?
    
    public init(view: Viewable? = nil, presenter: Presentable? = nil, router: Routable? = nil) {
        self.view = view
        self.presenter = presenter
        self.router = router
    }
}
