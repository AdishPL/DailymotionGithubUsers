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
        return prepareComponents(from: request)?.url
    }
}
