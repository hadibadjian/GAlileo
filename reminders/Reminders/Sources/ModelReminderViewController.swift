//  Copyright © 2016 HB. All rights reserved.

protocol AddReminderDelegate {
  func didReceiveReminder(reminder: Reminder)
}

class ModalReminderViewController: UIViewController {

  var delegate: AddReminderDelegate?

  @IBAction func addButtonPressed(sender: AnyObject) {

    var reminder = Reminder()
    reminder.title = "Hadi"
    reminder.tasks = []
    delegate?.didReceiveReminder(reminder)

    dismissViewControllerAnimated(true, completion: nil)
  }

}

import UIKit
