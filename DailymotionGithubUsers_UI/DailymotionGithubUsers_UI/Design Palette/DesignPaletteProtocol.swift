//
//  DesignPaletteProtocol.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import UIKit

public protocol DesignPaletteProtocol {
    var activityIndicatorColor: UIColor { get }
    var appBackgroundColor: UIColor { get }
    var navigationBarBackgroundColor: UIColor { get }
    var navigationBarTextColor: UIColor { get }
    var primaryNavigationColor: UIColor { get }
    var statusBarStyle: UIStatusBarStyle { get }

    var separatorColor: UIColor { get }

    var primaryHeadlineColor: UIColor { get }
    var primaryTextColor: UIColor { get }
    var secondaryTextColor: UIColor { get }

    var defaultLight1: UIColor { get }
    var defaultLight2: UIColor { get }
    var destructive: UIColor { get }
    var destructiveDark: UIColor { get }
    var main: UIColor { get }
    var positive: UIColor { get }
    var positiveDark: UIColor { get }

    func font(for style: AppTextStyle, ofSize size: AppFontSize) -> UIFont?
    func fontSize(for style: AppTextStyle) -> AppFontSize
}

extension DesignPaletteProtocol {
    public func font(for style: AppTextStyle) -> UIFont? {
        return font(for: style, ofSize: fontSize(for: style))
    }
}
