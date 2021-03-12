//
//  APIError.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

public enum APIError: Error, Equatable {
    case incorrect(resource: String)
    case encoding
    case decoding
    case noData
    case server(error: String)
}
