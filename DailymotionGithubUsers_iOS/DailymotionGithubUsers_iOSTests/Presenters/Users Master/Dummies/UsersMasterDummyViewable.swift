//
//  UsersMasterDummyViewable.swift
//  DailymotionGithubUsers_iOSTests
//
//  Created by Adrian Kaczmarek on 15/03/2021.
//

@testable import DailymotionGithubUsers_iOS
@testable import DailymotionGithubUsers_UI

class UsersMasterDummyViewable: Viewer, UsersMasterViewable {
    var onDataSourceLoaded: (() -> Void)?
    func load(_ dataSource: [CellViewModel]) {
        onDataSourceLoaded?()
    }
    
    var didShowLoader: ((Bool) -> Void)?
    func showLoader(_ enabled: Bool) {
        didShowLoader?(enabled)
    }
    
    var presenter: UsersMasterPresentable {
        return _presenter as! UsersMasterPresentable
    }
}
