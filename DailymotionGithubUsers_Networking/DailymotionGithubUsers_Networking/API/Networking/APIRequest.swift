//
//  APIRequest.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

protocol APIRequest: Encodable {
    associatedtype Response: Decodable

    /// Endpoint for this request (the last part of the URL)
    var resourceName: String { get }

    /// Need of authorization header (logged in requests)
    var isAuthenticated: Bool { get }

    /// HTTP Method used for request
    var httpMethod: HTTPMethod { get }
}

extension APIRequest {
    var isAuthenticated: Bool {
        return false
    }
}

protocol GetRequest: APIRequest { }
extension GetRequest {
    var httpMethod: HTTPMethod {
        return .get
    }
}

protocol PostRequest: APIRequest { }
extension PostRequest {
    var httpMethod: HTTPMethod {
        return .post
    }
}

protocol PutRequest: APIRequest { }
extension PutRequest {
    var httpMethod: HTTPMethod {
        return .put
    }
}

protocol PatchRequest: APIRequest {}
extension PatchRequest {
    var httpMethod: HTTPMethod {
        return .patch
    }
}

protocol DeleteRequest: APIRequest {}
extension DeleteRequest {
    var httpMethod: HTTPMethod {
        return .delete
    }
}
