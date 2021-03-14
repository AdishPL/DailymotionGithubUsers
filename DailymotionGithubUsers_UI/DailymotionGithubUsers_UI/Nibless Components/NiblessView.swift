//
//  NiblessView.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import UIKit

open class NiblessView: UIView {
    private var hierarchyNotReady = true

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable,
    message: "Loading this view from a nib is unsupported in favor of initializer dependency injection."
    )
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    }
    
    open override func didMoveToWindow() {
        super.didMoveToWindow()
        guard hierarchyNotReady else {
            return
        }
        
        style()
        constructHierarchy()
        activateConstraints()
        
        hierarchyNotReady = false
    }
    
    open func style() {
        backgroundColor = AppDesign.current.appBackgroundColor
    }
    
    open func constructHierarchy() { }
    open func activateConstraints() { }
}
