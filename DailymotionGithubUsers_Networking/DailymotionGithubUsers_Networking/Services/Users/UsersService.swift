//
//  UsersService.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import Foundation

public struct UsersService {
    private let dailymotionAPIClient: APIClientProtocol
    private let githubAPIClient: APIClientProtocol
        
    public init() {
        self.init(dailymotionAPIClient: APIClient(requestBuilder: URLRequestBuilder(baseEndpointInURL: ThirdPartyService.dailymotion.baseUrl)),
                  githubAPIClient: APIClient(requestBuilder: URLRequestBuilder(baseEndpointInURL: ThirdPartyService.github.baseUrl)))
    }
    
    init(dailymotionAPIClient: APIClientProtocol,
         githubAPIClient: APIClientProtocol) {
        self.dailymotionAPIClient = dailymotionAPIClient
        self.githubAPIClient = githubAPIClient
    }
    
    public func fetchDailymotionUsers(_ completionHandler: @escaping ResultCallback<[UserResponse]>) {
        dailymotionAPIClient.makeRequest(GetUsersRequest(fields: [.avatarUrl, .username])) { result in
            completionHandler(result.map { $0.list })
        }
    }
    
    public func fetchGithubUsers(_ completionHandler: @escaping ResultCallback<[UserResponse]>) {
        githubAPIClient.makeRequest(GetUsersRequest()) { result in
            completionHandler(result.map { $0.list })
        }
    }
    
    public func fetchAllThirdPartyUsers(_ completionHandler: @escaping ResultCallback<[UserResponse]>) {
        let fetchingDispatchGroup = DispatchGroup()
        var fetchingResults = [Result<[UserResponse], Error>]()
        
        [fetchGithubUsers,
         fetchDailymotionUsers].forEach { closure in
            fetchingDispatchGroup.enter()

            closure { result in
                fetchingResults.append(result)
                fetchingDispatchGroup.leave()
            }
         }
        
        fetchingDispatchGroup.notify(queue: .global()) {
            let reducedFetchingResults = fetchingResults.reduce(.success([UserResponse]())) { resultOperation($0, $1, +) }
            completionHandler(reducedFetchingResults)
        }
    }
    
    func resultOperation<T, E: Error>(_ lhs: Result<T, E>,
                                      _ rhs: Result<T, E>,
                                      _ operation: ((T, T) -> T)) -> Result<T, E> {
        lhs.flatMap { (lhsValue) -> Result<T, E> in
            rhs.map { (rhsValue) -> T in
                return operation(lhsValue, rhsValue)
            }
        }
    }
}
