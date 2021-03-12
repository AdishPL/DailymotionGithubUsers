//
//  ViewPresentation.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import UIKit

struct ViewPresentation {
    let from: UIViewController
    let embedInNavigationController: Bool
    let presentationStyle: UIModalPresentationStyle
    let transitionStyle: UIModalTransitionStyle
    let closeButton: Bool
    let completion: (() -> Void)?

    init(from: UIViewController,
         embedInNavigationController: Bool = false,
         presentationStyle: UIModalPresentationStyle = .overFullScreen,
         transitionStyle: UIModalTransitionStyle = .coverVertical,
         closeButton: Bool = false,
         completion: (() -> Void)? = nil) {
        self.from = from
        self.embedInNavigationController = embedInNavigationController
        self.presentationStyle = presentationStyle
        self.transitionStyle = transitionStyle
        self.closeButton = closeButton
        self.completion = completion
    }
}
