//
//  ScreenNavigationType.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 15/03/2021.
//

import UIKit

public enum ScreenNavigationType {
    case switchRoot(embedInNavigationController: Bool = false)
    case show(from: UIViewController? = nil, embedInNavigationController: Bool = false)
    case present(_ presentation: ViewPresentation)
}
