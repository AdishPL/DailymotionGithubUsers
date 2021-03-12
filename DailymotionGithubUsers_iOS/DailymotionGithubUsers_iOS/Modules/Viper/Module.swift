//
//  Module.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import Foundation

enum VprComponent: String {
    case viewController
    case presenter
    case router
}

struct Module {
    private (set) var view: Viewable?
    private (set) var presenter: Presentable?
    private (set) var router: Routable?
}
