//
//  UIView+Extensions.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import UIKit

public final class SeparatorView: UIView {
    public init(with size: AppLayoutMargin, backgroudColor: UIColor) {
        super.init(frame: .zero)
        heightAnchor.constraint(equalToConstant: size.value).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
