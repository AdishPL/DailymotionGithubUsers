//
//  RequestBuilder.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

protocol RequestBuildable {
    func endpointRequest<T: APIRequest>(from request: T) throws -> URLRequest
    
    var baseEndpointUrl: URL { get }
}

struct URLRequestBuilder: RequestBuildable {
    let baseEndpointUrl: URL
    
    init(baseEndpointInURL: URL) {
        self.baseEndpointUrl = baseEndpointInURL
    }
    
    func endpointRequest<T: APIRequest>(from request: T) throws -> URLRequest {
        guard let endpointUrl = baseEndpointUrl.buildRelative(from: request) else {
            throw(APIError.incorrect(resource: request.resourceName))
        }
        
        return try prepare(request, with: endpointUrl)
    }
    
    private func prepare<T: APIRequest>(_ request: T, with endpointUrl: URL) throws -> URLRequest {
        var endpointRequest = URLRequest(url: endpointUrl)
        try encodeBodyIfNeeded(of: request, to: &endpointRequest)
        authenticateIfNeeded(request, to: &endpointRequest)
        
        endpointRequest.httpMethod = request.httpMethod.rawValue
        
        let contentType: HTTPHeader = .contentType(contentType: .applicationJson)
        endpointRequest.addValue(contentType.value, forHTTPHeaderField: contentType.key)
        return endpointRequest
    }
    
    private func encodeBodyIfNeeded<T: APIRequest>(of request: T, to endpointRequest: inout URLRequest) throws {
        guard request.httpMethod != .get else { return }
        
        do {
            endpointRequest.httpBody = try JSONEncoder().encode(request)
        } catch {
            throw APIError.encoding
        }
    }
    
    private func authenticateIfNeeded<T: APIRequest>(_ request: T, to endpointRequest: inout URLRequest) {
        guard request.isAuthenticated else { return }
        
        let bearerAuthorization: HTTPHeader = .authorization(.bearer("ec7936f4d791727afd92bd41353be349"))
        endpointRequest.addValue(bearerAuthorization.value, forHTTPHeaderField: bearerAuthorization.key)
    }
}
