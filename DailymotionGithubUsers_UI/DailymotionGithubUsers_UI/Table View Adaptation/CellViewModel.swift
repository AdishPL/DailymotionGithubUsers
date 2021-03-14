//
//  CellViewModel.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import Foundation
import UIKit

public protocol CellViewModelProtocol: AnyObject {
    var cellClass: AnyClass? { get }
    var reuseIndentifier: String { get }
    var onCellClicked: (() -> Void)? { get set }
}

open class CellViewModel: CellViewModelProtocol {
    public var reuseIndentifier: String = ""
    public var cellClass: AnyClass? { return NSClassFromString(reuseIndentifier) }
    public var onCellClicked: (() -> Void)?

    public init(reuseIdentifier: String,
                onCellClicked: (() -> Void)? = nil) {
        self.reuseIndentifier = reuseIdentifier
        self.onCellClicked = onCellClicked
    }
}
