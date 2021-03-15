//
//  UIScrollView+BuildScrollView.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import UIKit

public extension UIScrollView {
    @discardableResult
    class func buildScrollView(
        contentInset: UIEdgeInsets = .zero,
        keyboardDismissMode: UIScrollView.KeyboardDismissMode = .none
    ) -> UIScrollView {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.alwaysBounceVertical = true
        scrollView.contentInset = contentInset
        scrollView.keyboardDismissMode = keyboardDismissMode
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false

        return scrollView
    }

    @discardableResult
    class func buildScrollableStackView(
        alignment: UIStackView.Alignment = .fill,
        contentInset: UIEdgeInsets = .zero,
        keyboardDismissMode: UIScrollView.KeyboardDismissMode = .none,
        spacing: AppLayoutMargin = .default,
        clipsToBounds: Bool = true
    ) -> (scrollView: UIScrollView, stackView: UIStackView) {
        let contentView = UIStackView.buildStackView(.vertical, alignment: alignment, spacing: spacing)
        let scrollView = buildScrollable(
            contentView,
            contentInset: contentInset,
            keyboardDismissMode: keyboardDismissMode,
            clipsToBounds: clipsToBounds)
        return (scrollView, contentView)
    }

    @discardableResult
    class func buildScrollable(
        _ contentView: UIView,
        contentInset: UIEdgeInsets = .zero,
        keyboardDismissMode: UIScrollView.KeyboardDismissMode = .none,
        clipsToBounds: Bool = true
    ) -> UIScrollView {
        let scrollView = UIScrollView.buildScrollView(keyboardDismissMode: keyboardDismissMode)

        scrollView.addSubview(contentView)
        scrollView.clipsToBounds = clipsToBounds
        
        contentView.translatesAutoresizingMaskIntoConstraints = false

        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -1 * (contentInset.left + contentInset.right)),
                contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: contentInset.left),
                contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: contentInset.right),
                contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: contentInset.top),
                contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -contentInset.bottom)
            ])
        } else {
            NSLayoutConstraint.activate([
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: contentInset.left),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -contentInset.right),
                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: contentInset.top),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -contentInset.bottom)
            ])
        }

        return scrollView
    }
}
