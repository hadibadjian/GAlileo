//  Copyright © 2016 HB. All rights reserved.

class AnimalsTableViewController: UITableViewController {

  // MARK: - UIViewController LifeCycle

  override func viewDidLoad() {
    super.viewDidLoad()
    // TODO: Add navigation title
  }

  // MARK: - UITableViewDelegate

  // TODO: Add section title

  // TODO: Add section footer

  override func tableView(
    tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("AnimalsTableViewCellReuseIdentifier")

      // TODO: Modify cell related properties

      return cell!
  }

  // TODO: Deselect row after selection

  // MARK: - UITableViewDataSource

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
}

import UIKit
