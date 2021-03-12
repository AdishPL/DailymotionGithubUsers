//
//  ViewShowable.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import UIKit

public protocol ViewShowable where Self: UIViewController {
    func push(_ view: UIViewController)
    func present(_ view: UIViewController)
}

public extension ViewShowable {
    func push(_ view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }

    func present(_ view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
}
