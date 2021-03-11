//
//  APIClient+Github.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

extension APIClient {
    static var github = APIClient(requestBuilder: URLRequestBuilder(baseEndpointInURL: URL(string: "https://api.github.com/")!))
}
