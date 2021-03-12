//
//  UsersServiceTests.swift
//  DailymotionGithubUsers_NetworkingTests
//
//  Created by Adrian Kaczmarek on 12/03/2021.
//

import XCTest
@testable import DailymotionGithubUsers_Networking

class UsersServiceTests: XCTestCase {
    var sut: UsersService!
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFetchAllThirdPartyUsersCompletes() {
        /// Given
        let dailymotionMockedResponse = MockableAPIDataTaskCreator(mockedResponse: .success(data: UserResponseJSONs.dailymotionUsersJSONData))
        let dailymotionMockedAPIClient = APIClient(requestBuilder: .fromLocalhost,
                                                   dataTaskCreator: dailymotionMockedResponse)
        
        let githubMockedResponse = MockableAPIDataTaskCreator(mockedResponse: .success(data: UserResponseJSONs.githubUsersJSONData))
        let githubMockedAPIClient = APIClient(requestBuilder: .fromLocalhost,
                                              dataTaskCreator: githubMockedResponse)
        
        sut = .init(dailymotionAPIClient: dailymotionMockedAPIClient,
                    githubAPIClient: githubMockedAPIClient)
        /// When
        let expectation = XCTestExpectation(description: "Finishes making requests")
        var capturedResult: Result<[UserResponse], Error>? = nil
        sut.fetchAllThirdPartyUsers { result in
            capturedResult = result
            expectation.fulfill()
        }
        
        /// Then
        wait(for: [expectation], timeout: 0.1)
        XCTAssertEqual(try! capturedResult!.get().count, 13)
    }
    
    func testFetchAllThirdPartyUsersFailsDueToInternalServerError() {
        /// Given
        let dailymotionMockedResponse = MockableAPIDataTaskCreator(mockedResponse: .serverError(statusCode: 500))
        let dailymotionMockedAPIClient = APIClient(requestBuilder: .fromLocalhost,
                                                   dataTaskCreator: dailymotionMockedResponse)
        
        let githubMockedResponse = MockableAPIDataTaskCreator(mockedResponse: .success(data: UserResponseJSONs.githubUsersJSONData))
        let githubMockedAPIClient = APIClient(requestBuilder: .fromLocalhost,
                                              dataTaskCreator: githubMockedResponse)
        
        sut = .init(dailymotionAPIClient: dailymotionMockedAPIClient,
                    githubAPIClient: githubMockedAPIClient)
        /// When
        let expectation = XCTestExpectation(description: "Finishes making requests")
        var capturedResult: Result<[UserResponse], Error>? = nil
        sut.fetchAllThirdPartyUsers { result in
            capturedResult = result
            expectation.fulfill()
        }
        
        /// Then
        wait(for: [expectation], timeout: 0.1)
        if case .failure(let capturedError) = capturedResult {
            XCTAssertEqual(capturedError as! HTTPError, .internalError)
        } else {
            XCTFail("Should've capture internalError")
        }
    }
}
