//
//  APIClientTests.swift
//  DailymotionGithubUsers_NetworkingTests
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import XCTest
@testable import DailymotionGithubUsers_Networking

class APIClientTests: XCTestCase {
    let failingJSON = """
        {]
    """
    
    var sut: APIClientProtocol!
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testAPIClientMakesRequestAndResumesAPISessionDataTask() {
        /// Given
        let mockedAPIDataTaskCreator = MockableAPIDataTaskCreator(mockedResponse: .empty)
        sut = APIClient(requestBuilder: .fromLocalhost,
                        dataTaskCreator: mockedAPIDataTaskCreator)
        
        let getUsersRequest = GetUsersRequest()
        
        /// When
        sut.makeRequest(getUsersRequest) { _ in }
        let requestResumeWasCalled = (mockedAPIDataTaskCreator.sessionDataTask as! DummyAPISessionDataTask).resumeCalled
        
        /// Then
        XCTAssertTrue(requestResumeWasCalled)
    }
    
    func testAPIClientNotRetainedAfterMakingRequest() {
        /// Given
        let mockedAPIDataTaskCreator = MockableAPIDataTaskCreator(mockedResponse: .empty)
        sut = APIClient(requestBuilder: .fromLocalhost,
                        dataTaskCreator: mockedAPIDataTaskCreator)
        
        let getUsersRequest = GetUsersRequest()
        
        /// When
        let expectation = XCTestExpectation(description: "Finishes making request")

        sut.makeRequest(getUsersRequest) { _ in expectation.fulfill() }
        sut = nil
        
        /// Then
        wait(for: [expectation], timeout: 0.1)
        XCTAssertNil(sut)
    }
    
    func testAPIClientMakeRequestResultingInMappedResponseFromJSON() {
        /// Given
        let mockedAPIDataTaskCreator = MockableAPIDataTaskCreator(mockedResponse: .success(data: UserResponseJSONs.dailymotionUsersJSONData))
        sut = APIClient(requestBuilder: .fromLocalhost,
                        dataTaskCreator: mockedAPIDataTaskCreator)
        
        let getUsersRequest = GetUsersRequest()
        
        /// When
        let expectation = XCTestExpectation(description: "Finishes making request")
        var capturedResult: Result<GetUsersRequest.Response, Error>? = nil
        
        sut.makeRequest(getUsersRequest) { result in
            capturedResult = result
            expectation.fulfill()
        }
        
        /// Then
        wait(for: [expectation], timeout: 0.1)
        if case .success(let response) = capturedResult {
            XCTAssertEqual(response.list.count, 10)
        } else {
            XCTFail("Should've return success")
        }
    }
    
    func testAPIClientMakeRequestResultingInServerErrorOnMalfunctioningEndpoint() {
        /// Given
        let mockedAPIDataTaskCreator = MockableAPIDataTaskCreator(mockedResponse: .serverError(statusCode: 500))
        sut = APIClient(requestBuilder: .fromLocalhost,
                        dataTaskCreator: mockedAPIDataTaskCreator)
        
        let getUsersRequest = GetUsersRequest()
        
        /// When
        let expectation = XCTestExpectation(description: "Finishes making request")
        var capturedResult: Result<GetUsersRequest.Response, Error>? = nil
        
        sut.makeRequest(getUsersRequest) { result in
            capturedResult = result
            expectation.fulfill()
        }
        
        /// Then
        wait(for: [expectation], timeout: 0.1)
        if case .failure(let error) = capturedResult {
            XCTAssertEqual(error as! HTTPError, .internalError)
        } else {
            XCTFail("Should've return error")
        }
    }
    
    func testAPIClientMakeRequestResultingInErrorOnFailingJSON() {
        /// Given
        let mockedAPIDataTaskCreator = MockableAPIDataTaskCreator(mockedResponse: .success(data: failingJSON.data(using: .utf8)!))
        sut = APIClient(requestBuilder: .fromLocalhost,
                        dataTaskCreator: mockedAPIDataTaskCreator)
        
        let getUsersRequest = GetUsersRequest()
        
        /// When
        let expectation = XCTestExpectation(description: "Finishes making request")
        var capturedResult: Result<GetUsersRequest.Response, Error>? = nil
        
        sut.makeRequest(getUsersRequest) { result in
            capturedResult = result
            expectation.fulfill()
        }
        
        /// Then
        wait(for: [expectation], timeout: 0.1)
        if case .failure(let error) = capturedResult {
            XCTAssertEqual(error as! APIError, APIError.decoding)
        } else {
            XCTFail("Should've return APIError")
        }
    }
}
