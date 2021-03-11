//
//  APIResponse.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

enum APIResponse<Response: Decodable>: Decodable {
    case error(ResponseError)
    case data(Response)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let data = try? container.decode(Response.self) {
            self = .data(data)
        } else if let error = try? container.decode(ResponseError.self) {
            self = .error(error)
        } else {
            throw APIError.decoding
        }
    }
}
