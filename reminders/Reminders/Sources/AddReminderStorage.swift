//  Copyright © 2016 HB. All rights reserved.

class AddReminderStorage: AddReminderDelegate {

  // MARK: - AddReminderDelegate

  func didReceiveReminder(reminder: Reminder) {
    print(reminder.title)
  }

}

import Foundation
