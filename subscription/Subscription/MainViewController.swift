//  Copyright © 2016 HB. All rights reserved.

class MainViewController: UIViewController {

  @IBOutlet weak var subscriptionImage: UIImageView!
  @IBOutlet weak var subscriptionEntries: UIStackView!

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    NSNotificationCenter.defaultCenter().addObserverForName(
      "SubscriptionEnabled",
      object: nil,
      queue: nil) { (notification) in
        if let userInfo = notification.userInfo, enabled = userInfo["enabled"] as? Bool {
          self.subscriptionEntries.hidden = !enabled
          self.subscriptionImage.hidden = !enabled
        }
    }

  }
}

import UIKit
