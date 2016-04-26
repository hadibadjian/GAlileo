//  Copyright © 2016 HB. All rights reserved.

class AnimalsTableViewController: UITableViewController {

  // MARK: - UIViewController LifeCycle

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Animals"
  }

  // MARK: - UITableViewDelegate

  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Cats"
  }

  override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return nil
  }

  override func tableView(
    tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("AnimalsTableViewCellReuseIdentifier")

      if let cell = cell as? AnimalsTableViewCell {
        cell.nameLabel.text = "Cheetah"
      }

      return cell!
  }

  override func tableView(
    tableView: UITableView,
    didSelectRowAtIndexPath indexPath: NSIndexPath) {
      tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }

  // MARK: - UITableViewDataSource

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
}

import UIKit
