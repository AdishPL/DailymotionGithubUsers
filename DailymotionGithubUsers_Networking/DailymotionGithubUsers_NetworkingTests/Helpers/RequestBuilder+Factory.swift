//
//  RequestBuilder+Factory.swift
//  DailymotionGithubUsers_NetworkingTests
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation
@testable import DailymotionGithubUsers_Networking

extension URLRequestBuilder {
    static let fromLocalhost = Self(baseEndpointInURL: .localhost)
}
