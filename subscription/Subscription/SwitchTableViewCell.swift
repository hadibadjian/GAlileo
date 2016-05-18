//  Copyright © 2016 HB. All rights reserved.

protocol SwitchTableViewCellDelagete {
  func didChangeState(enable: Bool)
}

class SwitchTableViewCell: UITableViewCell {

  var delegate: SwitchTableViewCellDelagete?

  @IBOutlet dynamic weak var enabledSwitch: UISwitch!
  @IBOutlet weak var titleLabel: UILabel!

  @IBAction func enabled(sender: AnyObject) {
    delegate?.didChangeState(enabledSwitch.on)
  }
}

import UIKit
