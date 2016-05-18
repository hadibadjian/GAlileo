//  Copyright © 2016 HB. All rights reserved.

class ConfigViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    tableView.delegate = self
    tableView.dataSource = self
    tableView.reloadData()
  }

  func tableView(
    tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(
    tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier(
        "SwitchCellIdentifier",
        forIndexPath: indexPath)

      if let cell = cell as? SwitchTableViewCell {
        switch indexPath.row {
        case 0:
          cell.type = "Subscription"
        case 11:
          cell.type = "AutoUpgrade"
        default:
          cell.type = "Subscription"
        }
      }

      return cell
  }

}

import UIKit
