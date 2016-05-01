//  Copyright © 2016 HB. All rights reserved.

class TaskTableViewCell: UITableViewCell {

  var completed = false

  @IBAction func radioButtonPressed(sender: AnyObject) {
    if let button = sender as? UIButton {
      button.setImage(
        UIImage(named: completed ? "radio-off" : "radio-on"),
        forState: .Normal)
      completed = !completed
    }
  }
}

import UIKit
