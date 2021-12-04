//  Created by Dominik Hauser on 01.12.21.
//  
//

import SwiftUI

struct ContentView: View {

  var body: some View {
    HStack {
      DayOneView()
      DayTwoView()
      DayThreeView()
      DayFourView()
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
