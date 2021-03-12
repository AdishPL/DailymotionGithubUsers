//
//  HTTPURLResponse+Factory.swift
//  DailymotionGithubUsers_NetworkingTests
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

extension HTTPURLResponse {
    static func makeResponseWith(url: URL = .localhost, statusCode: Int,
                                 httpVersion: String? = nil, headerFields: [String : String]? = nil) -> Self {
        return Self(url: url, statusCode: statusCode, httpVersion: httpVersion, headerFields: headerFields)!
    }
}
