//
//  OnlineServicesTest.swift
//  Pursuit-Core-iOS-Episodes-from-OnlineTests
//
//  Created by Eric Davenport on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import XCTest
@testable import Pursuit_Core_iOS_Episodes_from_Online

class OnlineServicesTest: XCTestCase {

  func testFetchShows() {
    let expectedCount = 10
    let exp = XCTestExpectation(description: "Shows Found")
    
    ShowAPIClient.fetchShows(for: "star") { (result) in
      switch result {
      case .failure(let appError):
        XCTFail("appError: \(appError)")
      case .success(let shows):
        exp.fulfill()
        XCTAssertEqual(shows.count, expectedCount)
      }
    }
    wait(for: [exp], timeout: 5.0)
  }
    

}
