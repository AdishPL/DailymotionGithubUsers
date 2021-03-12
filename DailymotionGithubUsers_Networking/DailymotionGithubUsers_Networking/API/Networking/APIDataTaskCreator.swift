//
//  APIDataTaskCreator.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

protocol APISessionDataTask {
    func resume()
}

extension URLSessionDataTask: APISessionDataTask {}

protocol APIDataTaskCreator {
    func createDataTask(with request: URLRequest,
                        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> APISessionDataTask
}

extension URLSession: APIDataTaskCreator {
    func createDataTask(with request: URLRequest,
                        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> APISessionDataTask {
        return dataTask(with: request, completionHandler: completionHandler)
    }
}
