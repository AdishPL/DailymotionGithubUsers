//
//  String+Extensions.swift
//  DailymotionGithubUsers_Core
//
//  Created by Adrian Kaczmarek on 15/03/2021.
//

import Foundation

public extension String {
    var first: String {
        return String(prefix(1))
    }
    
    var uppercasedFirst: String {
        return first.uppercased() + String(dropFirst())
    }
}
