//
//  UINavigationBar+Stylization.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import UIKit

public extension UINavigationBar {
    func style() {
        isTranslucent = false

        tintColor = AppDesign.current.navigationBarTextColor
        barTintColor = AppDesign.current.navigationBarBackgroundColor

        var titleTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: AppDesign.current.navigationBarTextColor]

        if let font = AppDesign.current.font(for: .title2) {
            titleTextAttributes[.font] = font
        }

        self.titleTextAttributes = titleTextAttributes

        // Get rid of the bottom line.
        setBackgroundImage(.init(), for: .default)
        shadowImage = .init()
    }
}
