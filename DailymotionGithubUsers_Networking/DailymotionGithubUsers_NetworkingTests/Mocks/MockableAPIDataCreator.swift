//
//  MockableAPIDataCreator.swift
//  DailymotionGithubUsers_NetworkingTests
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation
@testable import DailymotionGithubUsers_Networking

class DummyAPISessionDataTask: APISessionDataTask {
    var resumeCalled = false
    
    func resume() {
        resumeCalled = true
    }
}

class MockableAPIDataTaskCreator: APIDataTaskCreator {
    enum APIResponseCompletion {
        case success(data: Data)
        case serverError(statusCode: Int)
        case failure(error: Error)
        case empty
    }
    
    var mockedResponse = APIResponseCompletion.empty
    private(set) var sessionDataTask: APISessionDataTask? = nil
    
    init(mockedResponse: APIResponseCompletion) {
        self.mockedResponse = mockedResponse
    }
    
    func createDataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> APISessionDataTask {
        sessionDataTask = DummyAPISessionDataTask()
        
        switch mockedResponse {
        case .success(data: let jsonData):
            completionHandler(jsonData, HTTPURLResponse.makeResponseWith(statusCode: 200), nil)
        case .serverError(statusCode: let badStatusCode):
            completionHandler(nil, HTTPURLResponse.makeResponseWith(statusCode: badStatusCode), nil)
        case .failure(error: let error):
            completionHandler(nil, nil, error)
        default:
            completionHandler(nil, nil, nil)
        }
        
        return sessionDataTask!
    }
}
