//
//  ConfigurableCell.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import Foundation

public protocol ConfigurableCell: AnyObject {
    func configure(with model: CellViewModel)
}
