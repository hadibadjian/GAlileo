//  Copyright © 2016 HB. All rights reserved.

class MainTableViewController: UITableViewController {

  let menuTableViewCellId = "MenuTableViewCell"
  let addTableViewCellId = "AddReminderTableViewCell"
  let reminderViewControllerId = "ReminderViewController"

  var reminderStorage: AddReminderStorage = AddReminderStorage()

  override func tableView(
    tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
      return 2
  }

  override func tableView(
    tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell: UITableViewCell?

      switch indexPath.row {
      case 0:
        cell = tableView.dequeueReusableCellWithIdentifier(menuTableViewCellId)

        if let cell = cell {
          cell.textLabel?.text = "John"
          cell.detailTextLabel?.text = "Doe"
        }
      case 1:
        cell = tableView.dequeueReusableCellWithIdentifier(addTableViewCellId)
      default:
        cell = nil
      }

      return cell!
  }

  override func tableView(
    tableView: UITableView,
    didSelectRowAtIndexPath indexPath: NSIndexPath) {
/*
      if indexPath.row == 1 {
        let viewController = storyboard?.instantiateViewControllerWithIdentifier("ReminderViewController")
        if let viewController = viewController as? ModalReminderViewController {
          viewController.delegate = self

          presentViewController(viewController, animated: true, completion: nil)
        }
      }
*/

      tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let viewController = segue.destinationViewController as? ModalReminderViewController {
      viewController.delegate = reminderStorage
    }
  }

}

import UIKit
