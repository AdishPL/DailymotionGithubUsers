//
//  FakeAPIClient.swift
//  DailymotionGithubUsers_iOSTests
//
//  Created by Adrian Kaczmarek on 15/03/2021.
//

import Foundation
@testable import DailymotionGithubUsers_Networking

struct FakeAPIClient<Value: Decodable>: APIClientProtocol {
    var mockedResult: Result<Value, Error>
    
    init(with mockedResult: Result<Value, Error>) {
        self.mockedResult = mockedResult
    }
    
    mutating func exchange(mockedResult: Result<Value, Error>) {
        self.mockedResult = mockedResult
    }
    
    func makeRequest<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>) {
        completion(mockedResult as! Result<T.Response, Error>)
    }
}
