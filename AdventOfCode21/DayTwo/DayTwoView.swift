//  Created by Dominik Hauser on 02.12.21.
//  Copyright © 2021 dasdom. All rights reserved.
//

import SwiftUI

struct DayTwoView: View {
  @State var partOne: String = "0"
  @State var partTwo: String = "0"

  var body: some View {
    VStack {
      Button {
        let result1 = DayTwo().result(part: .one)
        partOne = String(result1)

        let result2 = DayTwo().result(part: .two)
        partTwo = String(result2)
      } label: {
        Text("Day 02")
      }
      VStack {
        Text("1: \(partOne)")
        Text("2: \(partTwo)")
      }
    }
  }
}

struct DayTwoView_Previews: PreviewProvider {
    static var previews: some View {
        DayTwoView()
    }
}
