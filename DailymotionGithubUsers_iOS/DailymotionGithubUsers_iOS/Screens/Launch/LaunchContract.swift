//
//  LaunchContract.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import Foundation

protocol LaunchViewable: Viewable {
    var presenter: LaunchPresentable { get }
}

protocol LaunchPresentable: Presentable {
    var view: LaunchViewable? { get }
    var router: LaunchRouterable { get }
}

protocol LaunchRouterable: Routable {
    
}
