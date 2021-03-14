//
//  UserTableViewCell.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import UIKit
import DailymotionGithubUsers_UI

final class UserTableViewCell: UITableViewCell {
    // MARK: - Properties

    private var stackView: UIStackView = .buildStackView(.vertical, spacing: .large)
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = AppDesign.current.primaryTextColor
        label.font = AppDesign.current.font(for: .listTitle)
        label.numberOfLines = 0
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = AppDesign.current.secondaryTextColor
        label.font = AppDesign.current.font(for: .listValue)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions

    private func setupView() {
        selectionStyle = .none
        
        [photoImageView, stackView].forEach(contentView.addSubview)
 
        [titleLabel, subtitleLabel].forEach(stackView.addArrangedSubview)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        layoutPhotoImageView()
        layoutStackView()
        
        photoImageView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    
    private func layoutPhotoImageView() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: AppLayoutMargin.large.value),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: AppLayoutMargin.semiLarge.value),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -AppLayoutMargin.large.value),
            photoImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.1),
            photoImageView.widthAnchor.constraint(equalTo: photoImageView.heightAnchor)
        ])
    }
    
    private func layoutStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: photoImageView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: AppLayoutMargin.semiLarge.value),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -AppLayoutMargin.semiLarge.value)
        ])
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        imageView?.image = nil
        super.prepareForReuse()
    }
}

// -----------------------------------------------------------------------------
// MARK: - ConfigurableCell Extension
// -----------------------------------------------------------------------------
extension UserTableViewCell: ConfigurableCell {
    func configure(with model: CellViewModel) {
        guard let model = model as? UserCellModel else { return }
        titleLabel.text = model.user.username
        subtitleLabel.text = "From: " + (model.user.thirdPartyService?.uppercasedFirst ?? "")
        photoImageView.setImageFrom(url: model.user.photoUrl)
    }
}
