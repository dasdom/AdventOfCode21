//  Created by Dominik Hauser on 01.12.21.
//  Copyright © 2021 dasdom. All rights reserved.
//

import XCTest
@testable import AdventOfCode21

class Day01Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  func test_resultOne_whenTestInputIsUsed_shouldReturnSeven() throws {
    let inputURL = try XCTUnwrap(Bundle.init(for: Day01Tests.self).url(forResource: "testInput01", withExtension: "txt"))
    let sut = DayOne(url: inputURL)

    let result = sut.result(part: .one)

    XCTAssertEqual(result, 7)
  }

  func test_resultTwo_whenTestInputIsUsed_shouldReturnSeven() throws {
    let inputURL = try XCTUnwrap(Bundle.init(for: Day01Tests.self).url(forResource: "testInput01", withExtension: "txt"))
    let sut = DayOne(url: inputURL)

    let result = sut.result(part: .two)

    XCTAssertEqual(result, 5)
  }
}
