//
//  UserDetailContract.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import Foundation
import DailymotionGithubUsers_Core
import DailymotionGithubUsers_UI

protocol UserDetailViewable: Viewable {
    var presenter: UserDetailPresentable { get }
    
    func setupView(with model: User)
}

protocol UserDetailPresentable: Presentable {
    var view: UserDetailViewable? { get }
    var router: UserDetailRouterable { get }
}

protocol UserDetailRouterable: Routable {
    
}
