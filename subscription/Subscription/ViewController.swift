//  Copyright © 2016 HB. All rights reserved.

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,
  SwitchTableViewCellDelagete {

  @IBOutlet weak var tableView: UITableView!

  private var myContext = 0

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    tableView.delegate = self
    tableView.dataSource = self
    tableView.reloadData()
  }

  // MARK: TableView Delegate & DataSource

  func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(
    tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier(
        "SwitchCellIdentifier",
        forIndexPath: indexPath)

      if let cell = cell as? SwitchTableViewCell {
        cell.titleLabel.text = "Subscription"
        cell.delegate = self
      }

      return cell
  }

  // MARK: Observe

  func didChangeState(enable: Bool) {
    NSNotificationCenter.defaultCenter().postNotificationName(
      "SubscriptionEnabled",
      object: nil,
      userInfo: ["enabled": enable])
  }

}
