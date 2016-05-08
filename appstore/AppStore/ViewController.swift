//  Copyright © 2016 HB. All rights reserved.

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var appIcon: UIImageView!

  override func viewDidLoad() {
    let layer = appIcon.layer
    layer.masksToBounds = true
    layer.cornerRadius = 30.0
  }
}
