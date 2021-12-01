//  Created by Dominik Hauser on 01.12.21.
//  
//

import SwiftUI

struct ContentView: View {

  @State var dayOneOne: String = "0"
  @State var dayOneTwo: String = "0"

  var body: some View {
    VStack {
      Button {
        let result1 = DayOne().result(part: .one)
        dayOneOne = String(result1)

        let result2 = DayOne().result(part: .two)
        dayOneTwo = String(result2)
      } label: {
        Text("Day 01")
      }
      VStack {
        Text("1: \(dayOneOne)")
        Text("2: \(dayOneTwo)")
      }
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
