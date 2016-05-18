//  Copyright © 2016 HB. All rights reserved.

class MainViewController: UIViewController {

  @IBOutlet weak var subscriptionImage: UIImageView!
  @IBOutlet weak var subscriptionEntities: UIStackView!

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    NSNotificationCenter.defaultCenter().addObserverForName(
      "SubscriptionChanged",
      object: nil,
      queue: nil) { (notification) -> Void in
        if let userInfo = notification.userInfo,
          enabled = userInfo["enabled"] as? Bool {
            self.subscriptionImage.hidden = !enabled
            self.subscriptionEntities.hidden = !enabled
        }
    }
  }



}

import UIKit
