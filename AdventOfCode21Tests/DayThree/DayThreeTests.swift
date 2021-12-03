//  Created by Dominik Hauser on 03.12.21.
//  Copyright © 2021 dasdom. All rights reserved.
//

import XCTest
@testable import AdventOfCode21

class DayThreeTests: XCTestCase {

  func test_resultOne_whenTestInputIsUsed_shouldReturnResult() throws {
    let inputURL = try XCTUnwrap(Bundle.init(for: DayOneTests.self).url(forResource: "testInput03", withExtension: "txt"))
    let sut = DayThree(url: inputURL)

    let result = sut.result(part: .one)

    XCTAssertEqual(result, 198)
  }

  func test_resultTwo_whenTestInputIsUsed_shouldReturnResult() throws {
    let inputURL = try XCTUnwrap(Bundle.init(for: DayOneTests.self).url(forResource: "testInput03", withExtension: "txt"))
    let sut = DayThree(url: inputURL)

    let result = sut.result(part: .two)

    XCTAssertEqual(result, 230)
  }
}
