//
//  FirstScreen.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import Foundation
import UIKit
import DailymotionGithubUsers_UI

public class LaunchViewController: Viewer {
    public override func loadView() {
        view = RootView()
    }
}

extension LaunchViewController {
    var presenter: LaunchPresentable {
        return _presenter as! LaunchPresentable
    }
}

extension LaunchViewController: LaunchViewable {}

class RootView: NiblessView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    private func setupLayout() {
        backgroundColor = .red
        
        let label = UILabel()
        label.text = "DERP"
    
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
