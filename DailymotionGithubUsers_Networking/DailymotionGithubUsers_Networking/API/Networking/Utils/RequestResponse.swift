//
//  RequestResponse.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

/// Generic structure concatenating `URLSessionDataTask` values
struct RequestResponse {
    let data: Data?
    let urlResponse: URLResponse?
    let error: Error?
    
    init(_ data: Data?, _ response: URLResponse?, _ error: Error?) {
        self.data = data
        self.urlResponse = response
        self.error = error
    }
}
