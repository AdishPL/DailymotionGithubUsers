//
//  HTTPError.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

public enum HTTPError: Int, Error {
    case badRequest = 400
    case unauthenticated = 401
    case forbidden = 403
    case notFound = 404
    case internalError = 500
    case undefined
}
