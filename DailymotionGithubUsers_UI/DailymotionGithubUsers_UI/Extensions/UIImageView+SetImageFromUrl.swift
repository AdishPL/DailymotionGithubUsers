//
//  UIImageView+SetImageFromUrl.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import UIKit

public extension UIImageView {
    func setImageFrom(url: URL, completion: (() -> Void)? = nil) {
        let progressHud = UIActivityIndicatorView(style: .white)
        progressHud.color = AppDesign.current.activityIndicatorColor
        progressHud.center = center
        progressHud.startAnimating()
        addSubview(progressHud)
        
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                progressHud.removeFromSuperview()
                if let data = imageData, let image = UIImage(data: data) {
                    self.image = image
                    self.layoutIfNeeded()
                }
                completion?()
            }
        }
    }
}

