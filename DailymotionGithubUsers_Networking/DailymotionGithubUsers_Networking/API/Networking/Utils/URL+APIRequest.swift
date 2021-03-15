//
//  URL+APIRequest.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

extension URL {
    private func prepareComponents<T: APIRequest>(from request: T) -> URLComponents? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            return nil
        }
        components.path = "\(self.path)/\(request.resourceName)"

        return components
    }
    
    func buildRelative<T: APIRequest>(from request: T) -> URL? {
        guard var components = prepareComponents(from: request) else {
            return nil
        }

        if let params = request.queryParams?.sorted(by: { $0.0 > $1.0 }) {
            components.queryItems = params.compactMap { (key, value) in
                return URLQueryItem(name: key, value: value.joined(separator: ","))
            }
        }
        
        return components.url
    }
}
