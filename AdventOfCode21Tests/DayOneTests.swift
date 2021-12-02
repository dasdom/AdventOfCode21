//  Created by Dominik Hauser on 01.12.21.
//  Copyright © 2021 dasdom. All rights reserved.
//

import XCTest
@testable import AdventOfCode21

class DayOneTests: XCTestCase {

  func test_resultOne_whenTestInputIsUsed_shouldReturnSeven() throws {
    let inputURL = try XCTUnwrap(Bundle.init(for: DayOneTests.self).url(forResource: "testInput01", withExtension: "txt"))
    let sut = DayOne(url: inputURL)

    let result = sut.result(part: .one)

    XCTAssertEqual(result, 7)
  }

  func test_resultTwo_whenTestInputIsUsed_shouldReturnSeven() throws {
    let inputURL = try XCTUnwrap(Bundle.init(for: DayOneTests.self).url(forResource: "testInput01", withExtension: "txt"))
    let sut = DayOne(url: inputURL)

    let result = sut.result(part: .two)

    XCTAssertEqual(result, 5)
  }
}
