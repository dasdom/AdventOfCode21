//  Created by Dominik Hauser on 03.12.21.
//  Copyright © 2021 dasdom. All rights reserved.
//

import SwiftUI

struct DayThreeView: View {
  @State var partOne: String = "0"
  @State var partTwo: String = "0"

  var body: some View {
    VStack {
      Button {
        let result1 = DayThree().result(part: .one)
        partOne = String(result1)

        let result2 = DayThree().result(part: .two)
        partTwo = String(result2)
      } label: {
        Text("Day 03")
      }
      VStack {
        Text("1: \(partOne)")
        Text("2: \(partTwo)")
      }
    }
  }
}

struct DayThreeView_Previews: PreviewProvider {
    static var previews: some View {
        DayThreeView()
    }
}
