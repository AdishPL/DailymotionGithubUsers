//
//  ResponseError.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

/// Example response error which API returns on any internal error
public struct ResponseError: Error, Decodable {
    let result: Bool
    let errorMessage: String
}
