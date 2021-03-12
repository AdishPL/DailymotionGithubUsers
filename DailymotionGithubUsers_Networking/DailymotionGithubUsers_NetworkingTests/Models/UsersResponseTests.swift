//
//  UsersResponseTests.swift
//  DailymotionGithubUsers_NetworkingTests
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import XCTest
@testable import DailymotionGithubUsers_Networking

class UsersResponseTests: XCTestCase {
    var sut: JSONDecoder!
    
    override func setUp() {
        sut = JSONDecoder()
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDailymotionUsersJSONDecodesToUserResponse() {
        /// Given
        let jsonData = UserResponseJSONs.dailymotionUsersJSONData
        
        /// When
        let userResponse = try! sut.decode(UsersResponse.self, from: jsonData)
        
        /// Then
        XCTAssertEqual(userResponse.list.count, 10)
    }
    
    func testGithubUsersJSONDecodesToUserResponse() {
        /// Given
        let jsonData = UserResponseJSONs.githubUsersJSONData
        
        /// When
        let userResponse = try! sut.decode(UsersResponse.self, from: jsonData)
        
        /// Then
        XCTAssertEqual(userResponse.list.count, 3)
    }
}
