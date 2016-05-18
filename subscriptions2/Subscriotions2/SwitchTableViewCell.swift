//  Copyright © 2016 HB. All rights reserved.

class SwitchTableViewCell: UITableViewCell {

  @IBOutlet weak var enabledSwitch: UISwitch!

  var type: String?

  @IBAction func switchPressed(sender: AnyObject) {
    NSNotificationCenter.defaultCenter().postNotificationName(
      type ?? "NON" + "Changed",
      object: nil,
      userInfo: ["enabled": enabledSwitch.on])
  }
}

import UIKit
