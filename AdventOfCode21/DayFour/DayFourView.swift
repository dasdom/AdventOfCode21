//  Created by Dominik Hauser on 03.12.21.
//  Copyright © 2021 dasdom. All rights reserved.
//

import SwiftUI

struct DayFourView: View {
  @State var partOne: String = "0"
  @State var partTwo: String = "0"

  var body: some View {
    VStack {
      Button {
        let result1 = DayFour().result(part: .one)
        partOne = String(result1)

        let result2 = DayFour().result(part: .two)
        partTwo = String(result2)
      } label: {
        Text("Day 04")
      }
      VStack {
        Text("1: \(partOne)")
        Text("2: \(partTwo)")
      }
    }
  }
}
