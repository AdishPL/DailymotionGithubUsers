//
//  URL+APIRequest.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

extension URL {
    private func prepareComponents<T: APIRequest>(from request: T) -> URLComponents? {
        guard let queryItems = URL(string: request.resourceName, relativeTo: self),
              let components = URLComponents(url: queryItems, resolvingAgainstBaseURL: true) else {
            return nil
        }

        return components
    }
    
    func buildRelative<T: APIRequest>(from request: T) -> URL? {
        return prepareComponents(from: request)?.url
    }
}
