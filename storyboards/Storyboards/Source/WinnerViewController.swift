//  Copyright © 2016 HB. All rights reserved.

class WinnerViewController: UIViewController {

  @IBOutlet weak var congratsLabel: UILabel!

  var congratsText: String?

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Winner!"

    if let text = congratsText {
      congratsLabel.text = text
    }
  }
}

import UIKit
