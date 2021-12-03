//  Created by Dominik Hauser on 02.12.21.
//  Copyright © 2021 dasdom. All rights reserved.
//

import Foundation

struct DayTwo: DayProtocol {

  let url: URL?
  let id = 1

  init(url: URL? = nil) {
    self.url = url ?? Bundle.main.url(forResource: "input02", withExtension: "txt")
  }

  func result(part: Part) -> Int {
    guard let url = url else {
      return 0
    }
    do {
      let inputString = try String(contentsOf: url)
      let result = calculate(part: part, input: inputString)
      print("result: \(result)")
      return result
    } catch {
      return 0
    }
  }

  private func calculate(part: Part, input: String) -> Int {

    let lines = input.components(separatedBy: "\n")

    var forward = 0
    var aim = 0
    var depth = 0

    for line in lines {
      let components = line.components(separatedBy: " ")
      guard let last = components.last,
            let lastAsInt = Int(last) else {
              break
            }
      let direction = components.first
      if direction == "forward" {
        forward += lastAsInt
        depth += aim * lastAsInt
      } else if direction == "down" {
        aim += lastAsInt
      } else if direction == "up" {
        aim -= lastAsInt
      }
    }

    switch part {
      case .one:
        return forward * aim
      case .two:
        return forward * depth
    }
  }
}
