//
//  ViewPresentation.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 15/03/2021.
//

import UIKit

public struct ViewPresentation {
    public let from: UIViewController
    public let embedInNavigationController: Bool
    public let presentationStyle: UIModalPresentationStyle
    public let transitionStyle: UIModalTransitionStyle
    public let closeButton: Bool
    public let completion: (() -> Void)?
    
    public init(from: UIViewController,
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
