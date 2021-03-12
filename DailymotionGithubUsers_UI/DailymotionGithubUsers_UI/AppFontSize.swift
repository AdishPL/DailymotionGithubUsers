//
//  AppFontSize.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import UIKit

public enum AppFontSize {
    /// 12.0
    case small
    /// 16.0
    case normal
    /// 20.0
    case large
    /// 28.0
    case huge
    /// 44.0
    case extraHuge
    case custom(_: CGFloat)

    public var pointSize: CGFloat {
        switch self {
        case .small:
            return 12.0
        case .normal:
            return 16.0
        case .large:
            return 20.0
        case .huge:
            return 28.0
        case .extraHuge:
            return 44.0
        case .custom(let size):
            return size
        }
    }
}
