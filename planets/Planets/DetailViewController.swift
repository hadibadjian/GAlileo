//  Copyright © 2016 HB. All rights reserved.

class DetailViewController: UIViewController {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var iconImage: UIImageView!
  @IBOutlet weak var descriptionTextView: UITextView!
  @IBOutlet weak var favoriteBarButtonItem: UIBarButtonItem!

  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  var planet: PlanetEntity?

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)

    title = planet?.title

    titleLabel.text = planet?.title
    descriptionTextView.text = planet?.desc
    iconImage.image = UIImage(named: planet?.icon ?? "Earth")
    setFavoriteState()

    activityIndicator.hidden = false
    activityIndicator.startAnimating()
    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC)))
    dispatch_after(delayTime, dispatch_get_main_queue()) { () -> Void in
      self.activityIndicator.stopAnimating()
      self.activityIndicator.hidden = true
    }
  }

  @IBAction func favoritePressed(sender: AnyObject) {
    if let planet = planet, favorite = planet.favorite as? Bool {
      planet.favorite = NSNumber(bool: !favorite)
    }
    setFavoriteState()
  }

  private func setFavoriteState() {
    if let favorite = planet?.favorite as? Bool {
      favoriteBarButtonItem.tintColor =
        favorite ? UIColor.purpleColor() : UIColor.grayColor()
    }
  }
}

import UIKit
