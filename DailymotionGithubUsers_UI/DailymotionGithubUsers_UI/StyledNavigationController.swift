//
//  StyledNavigationController.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import UIKit

public class StyledNavigationController: UINavigationController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.style()
    }

    public func addCloseButton() {
        viewControllers.first?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "close", in: DailymotionGithubUsers_UIBundle, compatibleWith: nil),
                                                                                  style: .plain,
                                                                                  target: self,
                                                                                  action: #selector(close))
    }

    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
}
