//
//  UIFont+Factory.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import UIKit

public extension UIFont {
    // MARK: - Montserrat

    static func buildBoldMontserrat(ofSize size: AppFontSize = .normal) -> UIFont? {
        return UIFont(name: "Montserrat-Bold", size: size.pointSize)
    }

    // MARK: - Open Sans

    static func buildOpenSans(ofSize size: AppFontSize = .normal) -> UIFont? {
        return UIFont(name: "OpenSans-Regular", size: size.pointSize)
    }

    static func buildBoldOpenSans(ofSize size: AppFontSize = .normal) -> UIFont? {
        return UIFont(name: "OpenSans-Bold", size: size.pointSize)
    }

    static func buildSemiBoldOpenSans(ofSize size: AppFontSize = .normal) -> UIFont? {
        return UIFont(name: "OpenSans-SemiBold", size: size.pointSize)
    }
}
