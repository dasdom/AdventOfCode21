//  Created by Dominik Hauser on 04.12.21.
//  Copyright © 2021 dasdom. All rights reserved.
//

import XCTest
@testable import AdventOfCode21

class DayFourTests: XCTestCase {

  func test_resultOne_whenTestInputIsUsed_shouldReturnResult() throws {
    let inputURL = try XCTUnwrap(Bundle.init(for: DayOneTests.self).url(forResource: "testInput04", withExtension: "txt"))
    let sut = DayFour(url: inputURL)

    let result = sut.result(part: .one)

    XCTAssertEqual(result, 4512)
  }

  func test_resultTwo_whenTestInputIsUsed_shouldReturnResult() throws {
    let inputURL = try XCTUnwrap(Bundle.init(for: DayOneTests.self).url(forResource: "testInput04", withExtension: "txt"))
    let sut = DayFour(url: inputURL)

    let result = sut.result(part: .two)

    XCTAssertEqual(result, 1924)
  }
}
