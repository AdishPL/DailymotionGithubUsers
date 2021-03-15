//
//  UserDetailRootView.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import UIKit
import DailymotionGithubUsers_UI

final class UserDetailRootView: NiblessView {
    // MARK: - Properties

    private weak var scrollView: UIScrollView?
    private weak var stackView: UIStackView?
    private weak var contentView: UIStackView?
    
    private weak var photoImageView: UIImageView?
    private weak var titleLabel: UILabel?
    private weak var subtitleLabel: UILabel?
    
    // MARK: - Setup layout

    override func constructHierarchy() {
        addStackView()
        addScrollableStackView()
        addPhotoImageView()
        contentView?.addSeparator(with: .tiny, color: AppDesign.current.separatorColor)
        addTitleLabel()
        contentView?.addSeparator(with: .default, color: AppDesign.current.separatorColor)
        addSubtitleLabel()
    }
    
    // MARK: - Making Constraints
    
    override func activateConstraints() {
        guard
            let `stackView` = stackView,
            let `photoImageView` = photoImageView,
            let `contentView` = contentView
        else {
            return
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            photoImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.4),
            photoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    // MARK: - Assign model
    
    func assign(username: String,
                userDestination: String?,
                userPhotoUrl: URL) {
        photoImageView?.setImageFrom(url: userPhotoUrl)
        titleLabel?.text = username
        subtitleLabel?.text = userDestination
    }
}

// MARK: - Adding the Subviews

private extension UserDetailRootView {
    func addStackView() {
        let stackView = UIStackView.buildStackView(.vertical, alignment: .fill)
        addSubview(stackView)
        self.stackView = stackView
    }
    
    func addScrollableStackView() {
        let horizontalInset = AppLayoutMargin.huge.value
        let verticalInset = AppLayoutMargin.large.value
        let contentInset = UIEdgeInsets(top: verticalInset, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
        let scrollableView = UIScrollView.buildScrollableStackView(contentInset: contentInset, clipsToBounds: true)

        self.stackView?.addArrangedSubview(scrollableView.scrollView)
        self.contentView = scrollableView.stackView
        self.scrollView = scrollableView.scrollView
    }
    
    func addPhotoImageView() {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        contentView?.addArrangedSubview(imageView)
        self.photoImageView = imageView
    }
    
    func addTitleLabel() {
        let label = UILabel(frame: .zero)
        label.textColor = AppDesign.current.primaryTextColor
        label.font = AppDesign.current.font(for: .largeTitle)
        label.numberOfLines = 0
        contentView?.addArrangedSubview(label)
        titleLabel = label
    }
    
    func addSubtitleLabel() {
        let label = UILabel(frame: .zero)
        label.textColor = AppDesign.current.secondaryTextColor
        label.font = AppDesign.current.font(for: .body)
        label.numberOfLines = 0
        contentView?.addArrangedSubview(label)
        subtitleLabel = label
    }
}
