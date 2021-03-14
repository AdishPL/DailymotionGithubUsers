//
//  UIStackView+BuildStackView.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import UIKit

public extension UIStackView {
    @discardableResult
    class func buildStackView(_ axis: NSLayoutConstraint.Axis,
                              alignment: UIStackView.Alignment = .fill,
                              distribution: UIStackView.Distribution = .fill,
                              spacing: AppLayoutMargin = .none) -> UIStackView {
        let stackView = UIStackView(frame: .zero)
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.axis = axis
        stackView.spacing = spacing.value
        stackView.isLayoutMarginsRelativeArrangement = true

        return stackView
    }
    
    func addSeparator(with size: AppLayoutMargin = .default, color: UIColor = AppDesign.current.separatorColor) {
        let separatorView = SeparatorView(with: size, backgroudColor: color)
        addArrangedSubview(separatorView)
        
        separatorView.backgroundColor = color
    }
}
