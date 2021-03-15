//
//  UsersMasterPresenterTests.swift
//  DailymotionGithubUsers_iOSTests
//
//  Created by Adrian Kaczmarek on 15/03/2021.
//

import XCTest
@testable import DailymotionGithubUsers_iOS
@testable import DailymotionGithubUsers_UI
@testable import DailymotionGithubUsers_Core
@testable import DailymotionGithubUsers_Networking

class UsersMasterPresenterTests: XCTestCase {
    var view: UsersMasterDummyViewable!
    var router: UsersMasterDummyRouterable!
    var sut: UsersMasterPresenter!
    
    override func setUp() {
        view = UsersMasterDummyViewable()
        router = UsersMasterDummyRouterable()
        super.setUp()
    }
    
    override func tearDown() {
        view = nil
        router = nil
        sut = nil
        super.tearDown()
    }
    
    func testBindDataSourceIsMadeOnSuccessfulFetch() {
        /// Given
        let dailymotionMock = FakeAPIClient(with: .success(dailymotionUsersResponse))
        let githubMock = FakeAPIClient(with: .success(githubUsersResponse))
        let repo = UsersEphemeralRepository(usersService: .init(dailymotionAPIClient: dailymotionMock,
                                                                githubAPIClient: githubMock))
        
        sut = UsersMasterPresenter(view: view, router: router, usersRepository: repo)

        /// When
        let expectation = XCTestExpectation(description: "Finishes loading data source")
        sut.bind()
        
        var dataSourceLoaded = false
        view.onDataSourceLoaded = {
            dataSourceLoaded = true
            expectation.fulfill()
        }
        
        /// Then
        wait(for: [expectation], timeout: 0.1)
        XCTAssertTrue(dataSourceLoaded)
    }

    func testDataSourceIsNotLoadedOnFailedFetch() {
        /// Given
        let dailymotionMock = FakeAPIClient<UsersResponse>(with: .failure(ResponseError(result: false, errorMessage: "")))
        let githubMock = FakeAPIClient(with: .success(githubUsersResponse))

        let repo = UsersEphemeralRepository(usersService: .init(dailymotionAPIClient: dailymotionMock,
                                                                githubAPIClient: githubMock))
        
        sut = UsersMasterPresenter(view: view, router: router, usersRepository: repo)
        
        /// When
        let expectation = XCTestExpectation(description: "Doesn't load data source")
        expectation.isInverted = true
        sut.bind()
        
        var dataSourceLoaded = false
        view.onDataSourceLoaded = {
            dataSourceLoaded = true
            expectation.fulfill()
        }
        
        /// Then
        wait(for: [expectation], timeout: 0.1)
        XCTAssertFalse(dataSourceLoaded)
    }
    
    func testPresenterRoutesToSelectedUser() {
        /// Given
        let dailymotionMock = FakeAPIClient(with: .success(dailymotionUsersResponse))
        let githubMock = FakeAPIClient(with: .success(githubUsersResponse))

        let repo = UsersEphemeralRepository(usersService: .init(dailymotionAPIClient: dailymotionMock,
                                                                githubAPIClient: githubMock))
        
        sut = UsersMasterPresenter(view: view, router: router, usersRepository: repo)
        sut.bind()
        
        /// When
        let expectation = XCTestExpectation(description: "Routes to user detail")
        
        var capturedUser: User?
        router.navigatedToUserDetail = { user in
            capturedUser = user
            expectation.fulfill()
        }
        
        let exp = XCTestExpectation(description: "Wait for data source binding")
        _ = XCTWaiter.wait(for: [exp], timeout: 0.1)
        
        sut.cells.first?.onCellClicked?()

        /// Then
        wait(for: [expectation], timeout: 0.2)
        XCTAssertEqual((sut.cells.first as? UserCellModel)?.user.username, capturedUser?.username)
    }
    
    func testBindShowsAndHidesLoader() {
        /// Given
        let dailymotionMock = FakeAPIClient(with: .success(dailymotionUsersResponse))
        let githubMock = FakeAPIClient(with: .success(githubUsersResponse))
        
        let repo = UsersEphemeralRepository(usersService: .init(dailymotionAPIClient: dailymotionMock,
                                                                githubAPIClient: githubMock))
        
        sut = UsersMasterPresenter(view: view, router: router, usersRepository: repo)
        var capturedLoaderVisibility: [Bool] = []
        
        /// When
        view.didShowLoader = { shown in
            capturedLoaderVisibility.append(shown)
        }
        
        sut.bind()
        let expectation = XCTestExpectation(description: "Hides loader after binding")
        let result = XCTWaiter.wait(for: [expectation], timeout: 0.2)
        
        /// Then
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(capturedLoaderVisibility.first!)
            XCTAssertFalse(capturedLoaderVisibility.last!)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}

// MARK: - Helpers
private extension UsersMasterPresenterTests {
    var dailymotionUsersResponse: UsersResponse {
        return
            .init(list: [UserResponse(username: "Test", photoUrl: URL(string: "localhost")!, service: .dailymotion)])
    }
    var githubUsersResponse: UsersResponse {
        return
            .init(list: [
                UserResponse(username: "Test13", photoUrl: URL(string: "localhost")!, service: .github),
                UserResponse(username: "Test113", photoUrl: URL(string: "localhost")!, service: .github)
            ])
    }
}
