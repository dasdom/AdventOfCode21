//  Created by Dominik Hauser on 04.12.21.
//  Copyright © 2021 dasdom. All rights reserved.
//

import Foundation

struct DayFour: DayProtocol {
  var url: URL?

  init(url: URL? = nil) {
    self.url = url ?? Bundle.main.url(forResource: "input04", withExtension: "txt")
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

  private func boards(parts: [String]) -> [[[String]]] {
    var boards: [[[String]]] = []
    for part in parts {
      let boardLines = part.components(separatedBy: "\n")
      var board: [[String]] = []
      for line in boardLines {
        let row = line
          .components(separatedBy: CharacterSet.whitespaces)
          .filter({ false == $0.isEmpty })
        board.append(row)
      }
      boards.append(board)
    }
    return boards
  }

  private func partOne(input: String) -> Int {

    var parts = input.components(separatedBy: "\n\n")
    let numbersToDraw = parts.removeFirst().components(separatedBy: ",")

    var boards = boards(parts: parts)

    for number in numbersToDraw {
      for (boardIndex, var board) in boards.enumerated() {
        var sumNotMatched = 0
        var columnSum: [Int] = Array(repeating: 0, count: 5)
        var foundMatchedRow = false
        for (rowIndex, var row) in board.enumerated() {
          if row.isEmpty {
            continue
          }
          for (elementIndex, element) in row.enumerated() {
            if element == number {
              row[elementIndex] = "-\(row[elementIndex])"
              board[rowIndex] = row
              boards[boardIndex] = board
            }
          }
          var allNegative = true
          for (elementIndex, element) in row.enumerated() {
            if false == element.hasPrefix("-") {
              columnSum[elementIndex] = columnSum[elementIndex] + 1
              allNegative = false
              if let intElement = Int(element) {
                sumNotMatched += intElement
              }
            }
          }
          if allNegative {
            foundMatchedRow = true
          }
        }
        if columnSum.contains(0) || foundMatchedRow {
          if let intNumber = Int(number) {
            return sumNotMatched * intNumber
          }
        }
      }
    }
    return 0
  }

  private func partTwo(input: String) -> Int {

    var parts = input.components(separatedBy: "\n\n")
    let numbersToDraw = parts.removeFirst().components(separatedBy: ",")

    var boards = boards(parts: parts)
    var remainingIndices = Array(0..<boards.count)

    for number in numbersToDraw {
      for (boardIndex, var board) in boards.enumerated() {
        if false == remainingIndices.contains(boardIndex) {
          continue
        }
        var sumNotMatched = 0
        var columnSum: [Int] = Array(repeating: 0, count: 5)
        var foundMatchedRow = false
        for (rowIndex, var row) in board.enumerated() {
          if row.isEmpty {
            continue
          }
          for (elementIndex, element) in row.enumerated() {
            if element == number {
              row[elementIndex] = "-\(row[elementIndex])"
              board[rowIndex] = row
              boards[boardIndex] = board
            }
          }
          var allNegative = true
          for (elementIndex, element) in row.enumerated() {
            if false == element.hasPrefix("-") {
              columnSum[elementIndex] = columnSum[elementIndex] + 1
              allNegative = false
              if let intElement = Int(element) {
                sumNotMatched += intElement
              }
            }
          }
          if allNegative {
            foundMatchedRow = true
          }
        }
        if columnSum.contains(0) || foundMatchedRow {
          if remainingIndices.count > 1 {
            remainingIndices.removeAll(where: { $0 == boardIndex })
          } else if let intNumber = Int(number) {
            return sumNotMatched * intNumber
          }
        }
      }
    }
    return 0
  }
}
