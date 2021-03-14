//
//  UsersMasterContract.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import DailymotionGithubUsers_UI

protocol UsersMasterViewable: Viewable {
    var presenter: UsersMasterPresentable { get }
    
    func load(_ dataSource: [CellViewModel])
}

protocol UsersMasterPresentable: Presentable {
    var view: UsersMasterViewable? { get }
    var router: UsersMasterRouterable { get }
}

protocol UsersMasterRouterable: Routable {
    
}
