//
//  NextScreen.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 15/03/2021.
//

import Foundation

public final class NextScreen {
    let module: ViperModule
    var data: Any?
    let navigationType: ScreenNavigationType

    public init(_ module: ViperModule, data: Any? = nil, navigationType: ScreenNavigationType) {
        self.module = module
        self.data = data
        self.navigationType = navigationType
    }
}
