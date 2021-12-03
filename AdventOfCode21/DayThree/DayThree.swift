//  Created by Dominik Hauser on 03.12.21.
//  Copyright © 2021 dasdom. All rights reserved.
//

import Foundation

struct DayThree: DayProtocol {
  var url: URL?

  init(url: URL? = nil) {
    self.url = url ?? Bundle.main.url(forResource: "input03", withExtension: "txt")
  }

  func result(part: Part) -> Int {
    guard let url = url else {
      return 0
    }
    do {
      let inputString = try String(contentsOf: url)
      switch part {
        case .one:
          let result = partOne(input: inputString)
          print("result: \(result)")
          return result
        case .two:
          let result = partTwo(input: inputString)
          print("result: \(result)")
          return result
      }
    } catch {
      return 0
    }
  }

  private func partOne(input: String) -> Int {
    let lines = input.components(separatedBy: "\n")

    var sums: [Int] = []
    for line in lines {
      for (index, character) in line.reversed().enumerated() {
        let change: Int
        if character == "0" {
          change = -1
        } else {
          change = 1
        }
        if sums.count > index {
          sums[index] = sums[index] + change
        } else {
          sums.append(change)
        }
      }
    }

    var gammaString = ""
    var epsilonString = ""
    for digit in sums.reversed() {
      if digit > 0 {
        gammaString.append("1")
        epsilonString.append("0")
      } else {
        gammaString.append("0")
        epsilonString.append("1")
      }
    }

    let gamma = Int(gammaString, radix: 2)!
    let epsilon = Int(epsilonString, radix: 2)!

    return gamma * epsilon
  }

  private func partTwo(input: String) -> Int {

    let lines = input.components(separatedBy: "\n").filter({ false == $0.isEmpty })

    guard let firstLine = lines.first else {
      return 0
    }

    var filteredOxyLines = lines
    var filteredCo2Lines = lines

    for position in firstLine.indices {
      let sumOxy = sum(in: filteredOxyLines, position: position)
      let mostCommonDigit = sumOxy < 0 ? "0" : "1"

      let sumCo2 = sum(in: filteredCo2Lines, position: position)
      let leastCommonDigit = sumCo2 >= 0 ? "0" : "1"

      if filteredOxyLines.count > 1 {
        filteredOxyLines = filter(lines: filteredOxyLines, position: position, digit: Character(mostCommonDigit))
      }

      if filteredCo2Lines.count > 1 {
        filteredCo2Lines = filter(lines: filteredCo2Lines, position: position, digit: Character(leastCommonDigit))
      }
    }

    let oxygenString = filteredOxyLines.first!
    let oxygen = Int(oxygenString, radix: 2)!

    let co2String = filteredCo2Lines.first!
    let co2 = Int(co2String, radix: 2)!

    return oxygen * co2
  }

  private func sum(in lines: [String], position: String.Index) -> Int {
    let sum = lines.reduce(0) { partialResult, next in
      let digitCharacter = next[position]
      if digitCharacter == "0" {
        return partialResult - 1
      } else {
        return partialResult + 1
      }
    }
    return sum
  }

  private func filter(lines: [String], position: String.Index, digit: Character) -> [String] {
    return lines.filter { line in
      return line[position] == digit
    }
  }
}
