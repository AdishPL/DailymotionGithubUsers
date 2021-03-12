//
//  ScreenNavigationType.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import UIKit

enum ScreenNavigationType {
    case switchRoot(embedInNavigationController: Bool = false)
    case show(from: UIViewController? = nil, embedInNavigationController: Bool = false)
    case present(_ presentation: ViewPresentation)
}
