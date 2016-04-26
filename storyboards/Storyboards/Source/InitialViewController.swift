//  Copyright © 2016 HB. All rights reserved.

class InitialViewController: UIViewController {

  @IBOutlet weak var purchaseCountLabel: UILabel!

  let winningNumber = 5
  let wonLotterySegueIdentifier = "wonLotterySegue"

  var numberOfPurchases = 0

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Storyboards"
  }

  @IBAction func purchaseTicketButtonPressed(sender: AnyObject) {
    numberOfPurchases += 1
    purchaseCountLabel.text = "You have purchased \(numberOfPurchases) items"
    if numberOfPurchases == 5 {
      self.performSegueWithIdentifier(wonLotterySegueIdentifier, sender: nil)
    }
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == wonLotterySegueIdentifier {
      if let winnerVC = segue.destinationViewController as? WinnerViewController {
        winnerVC.congratsText = "Congratulations Hadi!"
      }
    }
  }
}

import UIKit
