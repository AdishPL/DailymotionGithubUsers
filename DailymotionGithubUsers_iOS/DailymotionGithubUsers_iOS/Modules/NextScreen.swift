//
//  NextScreen.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import Foundation

final class NextScreen {
    let module: ViperModule
    var data: Any?
    let navigationType: ScreenNavigationType

    init(_ module: ViperModule, data: Any? = nil, navigationType: ScreenNavigationType) {
        self.module = module
        self.data = data
        self.navigationType = navigationType
    }
}
