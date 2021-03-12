//
//  LightAppPalette.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import UIKit

public struct LightAppPalette: DesignPaletteProtocol {
    public var activityIndicatorColor: UIColor = .cobalt
    public var appBackgroundColor: UIColor = .white
    public var navigationBarBackgroundColor: UIColor = .ci
    public var navigationBarTextColor: UIColor = .white
    public var primaryNavigationColor: UIColor = .lightCobalt
    public var statusBarStyle: UIStatusBarStyle = .lightContent

    public var separatorColor: UIColor = .whiteSmoke
    
    public var primaryTextColor: UIColor = .black
    public var secondaryTextColor: UIColor = .mirage
    public var primaryHeadlineColor: UIColor = .black

    public var defaultLight1: UIColor = .defaultLight1
    public var defaultLight2: UIColor = .defaultLight2
    public var destructive: UIColor = .destructive
    public var destructiveDark: UIColor = .destructiveDark
    public var main: UIColor = .main
    public var positive: UIColor = .positive
    public var positiveDark: UIColor = .positiveDark

    // MARK: -

    public func font(for style: AppTextStyle, ofSize size: AppFontSize) -> UIFont? {
        switch style {
        case .largeTitle, .title1, .imageLabel, .listTitle:
            return .buildBoldMontserrat(ofSize: size)
        case .title2, .title3, .button2, .listValue:
            return .buildSemiBoldOpenSans(ofSize: size)
        case .body, .tabBar, .listLabel:
            return .buildOpenSans(ofSize: size)
        case .activityIndicator, .button1:
            return .buildBoldOpenSans(ofSize: size)
        }
    }

    public enum FontTypography {
        case normal, bold, semibold
    }

    public func font(size: AppFontSize = .normal, typography: FontTypography = .normal) -> UIFont? {
        switch typography {
        case .normal:
            return .buildOpenSans(ofSize: size)
        case .bold:
            return .buildBoldOpenSans(ofSize: size)
        case .semibold:
            return .buildSemiBoldOpenSans(ofSize: size)
        }
    }

    public func fontSize(for style: AppTextStyle) -> AppFontSize {
        switch style {
        case .largeTitle:
            return .huge
        case .title1, .listTitle:
            return .large
        case .title2:
            return .custom(18)
        case .activityIndicator, .title3, .body, .button1, .button2, .imageLabel, .listLabel, .listValue:
            return .normal
        case .tabBar:
            return .custom(12.0)
        }
    }
}
