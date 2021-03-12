//
//  AppLayoutMargin.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import UIKit

public enum AppLayoutMargin {
    /// 0
    case none
    /// 2
    case tiny
    /// 4
    case small
    /// 8
    case `default`
    /// 12
    case medium
    /// 14
    case semiLarge
    /// 16
    case large
    /// 24
    case semiHuge
    /// 32
    case huge
    case custom(CGFloat)

    public var value: CGFloat {
        switch self {
        case .none:
            return 0
        case .tiny:
            return 2
        case .small:
            return 4
        case .default:
            return 8
        case .medium:
            return 12
        case .semiLarge:
            return 14
        case .large:
            return 16
        case .semiHuge:
            return 24
        case .huge:
            return 32
        case .custom(let value):
            return value
        }
    }
}
