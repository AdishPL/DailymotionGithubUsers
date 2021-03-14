//
//  UsersMasterContract.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import DailymotionGithubUsers_UI
import DailymotionGithubUsers_Core

protocol UsersMasterViewable: Viewable {
    var presenter: UsersMasterPresentable { get }
    
    func load(_ dataSource: [CellViewModel])
    func showLoader(_ enabled: Bool)
}

protocol UsersMasterPresentable: Presentable {
    var view: UsersMasterViewable? { get }
    var router: UsersMasterRouterable { get }
}

protocol UsersMasterRouterable: Routable {
    func navigateToUserDetail(_ user: User)
}
