//  Created by Dominik Hauser on 03.12.21.
//  Copyright © 2021 dasdom. All rights reserved.
//

import Foundation

protocol DayProtocol {
  var url: URL? { get }
  init(url: URL?)
  func result(part: Part) -> Int
}
