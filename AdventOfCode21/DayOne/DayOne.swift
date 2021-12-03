//  Created by Dominik Hauser on 01.12.21.
//  
//

import Foundation

struct DayOne: DayProtocol {

  let url: URL?
  let id = 1

  init(url: URL? = nil) {
    self.url = url ?? Bundle.main.url(forResource: "input01", withExtension: "txt")
  }

  func result(part: Part) -> Int {
    guard let url = url else {
      return 0
    }
    do {
      let inputString = try String(contentsOf: url)
      switch part {
        case .one:
          return resultOne(input: inputString)
        case .two:
          return resultTwo(input: inputString)
      }
    } catch {
      return 0
    }
  }

  private func resultOne(input: String) -> Int {
    let intValues = input.components(separatedBy: "\n").compactMap { line in
      return Int(line)
    }

    var result = 0
    var previousValue = intValues.first!
    for value in intValues.dropFirst() {
      if previousValue < value {
        result += 1
      }
      previousValue = value
    }

    return result
  }

  private func resultTwo(input: String) -> Int {
    let intValues = input.components(separatedBy: "\n").compactMap { line in
      return Int(line)
    }

    var result = 0
    var previousValue: Int? = nil
    for index in intValues.dropFirst().indices {
      if index+1 > intValues.count-1 {
        break
      }
      let value = intValues[index-1] + intValues[index] + intValues[index+1]
      if let previousValue = previousValue, previousValue < value {
        result += 1
      }
      previousValue = value
    }

    return result
  }
}
