//
//  ScreenNavigable.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import UIKit

protocol ScreenNavigable {
    func changeRoot(to view: UIViewController)
}

struct ScreenNavigator {
    private let window: () -> UIWindow?

    init(window: (() -> UIWindow?)? = nil) {
        self.window = window ?? { (UIApplication.shared.delegate?.window)! }
    }
}

extension ScreenNavigator: ScreenNavigable {
    func changeRoot(to view: UIViewController) {
        window()?.rootViewController = view
    }
}
