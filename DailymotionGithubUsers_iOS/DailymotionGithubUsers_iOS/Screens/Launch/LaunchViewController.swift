//
//  FirstScreen.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import Foundation
import UIKit
import DailymotionGithubUsers_UI

public final class LaunchViewController: Viewer, ViewSpecificController {
    typealias RootView = LaunchRootView
    
    public override func loadView() {
        view = LaunchRootView()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        presenter.bind()
    }
}

extension LaunchViewController {
    var presenter: LaunchPresentable {
        return _presenter as! LaunchPresentable
    }
}

extension LaunchViewController: LaunchViewable {}
