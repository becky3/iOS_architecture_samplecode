//
//  UserDefaultsDataStoreTest.swift
//  CleanGitHubTests
//
//  Created by 加藤寛人 on 2018/09/21.
//  Copyright © 2018年 Peaks. All rights reserved.
//

import XCTest
@testable import CleanGitHub

class UserDefaultsDataStoreTest: XCTestCase {

    var dataStore: UserDefaultsDataStore!

    override func setUp() {
        dataStore = UserDefaultsDataStore(userDefaults: UserDefaults.standard)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSave() {
        let repo: GitHubRepo = .init(id: GitHubRepo.ID(rawValue: "foobar"),
                                     fullName: "barbaz",
                                     description: "desc",
                                     language: "Swift",
                                     stargazersCount: 0)
        dataStore.save(liked: true, for: repo.id) { result in
            if case .success(let isLiked) = result {
                XCTAssertTrue(isLiked == true)
            } else {
                XCTAssertTrue(false, "result must be a success.")
            }
        }
    }
//    func fetch(byNames names: [String], completion: (Result<[Like]>) -> Void)

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
