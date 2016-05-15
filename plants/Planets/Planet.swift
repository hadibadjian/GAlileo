//  Copyright © 2016 HB. All rights reserved.

class Planet {
  var title: String?
  var desc: String?
  var icon: UIImage?
  var favorite: Bool = false

  init(title: String?, desc: String?, icon: UIImage?) {
    self.title = title
    self.desc = desc
    self.icon = icon
  }
}

import UIKit
