//
//  DailymotionGithubUsers_iOS.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import Foundation
import UIKit
 
let DailymotionGithubUsers_iOSBundle = Bundle(for: DailymotionGithubUsers_iOSModule.self)

private class DailymotionGithubUsers_iOSModule {}

public class DailymotionGithubUsers_iOS {
    static let shared: DailymotionGithubUsers_iOS = DailymotionGithubUsers_iOS()
    
    public static func startFlow(on window: UIWindow?) {
        let module = AppModules.launch.build()
        module.router?.show(in: window, embedInNavigationController: false, makeKeyAndVisible: true)
    }
}
