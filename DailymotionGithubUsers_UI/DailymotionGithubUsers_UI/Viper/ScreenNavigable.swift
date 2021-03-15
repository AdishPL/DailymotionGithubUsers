//
//  ScreenNavigable.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 15/03/2021.
//

import UIKit

public protocol ScreenNavigable {
    func changeRoot(to view: UIViewController)
}

public struct ScreenNavigator {
    private let window: () -> UIWindow?

    public init(window: (() -> UIWindow?)? = nil) {
        self.window = window ?? { (UIApplication.shared.delegate?.window ?? nil) }
    }
}

extension ScreenNavigator: ScreenNavigable {
    public func changeRoot(to view: UIViewController) {
        window()?.rootViewController = view
    }
}
