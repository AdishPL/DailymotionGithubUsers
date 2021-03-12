//
//  RequestBuilderTests.swift
//  DailymotionGithubUsers_NetworkingTests
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import XCTest
@testable import DailymotionGithubUsers_Networking

class RequestBuilderTests: XCTestCase {
    var sut: URLRequestBuilder!
    
    override func setUp() {
        sut = .init(baseEndpointInURL: .localhost)
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testEndpointRequestCorrectlyBuildsGetUsersRequestWithFields() {
        /// Given
        let getUsersRequest = GetUsersRequest(fields: [.avatarUrl, .username])
        
        /// When
        let request = try! sut.endpointRequest(from: getUsersRequest)
        
        /// Then
        XCTAssertEqual(request.url!.lastPathComponent, "users?fields=avatar_360_url,username")
    }
    
    func testEndpointRequestCorrectlyBuildsGetUsersRequestWithoutFields() {
        /// Given
        let getUsersRequest = GetUsersRequest()
        
        /// When
        let request = try! sut.endpointRequest(from: getUsersRequest)
        
        /// Then
        XCTAssertEqual(request.url!.lastPathComponent, "users")
    }
}
