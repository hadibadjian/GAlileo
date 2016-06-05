//  Copyright © 2016 HB. All rights reserved.

class DetailViewController: UIViewController {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var iconImage: UIImageView!
  @IBOutlet weak var descriptionTextView: UITextView!
  @IBOutlet weak var favoriteBarButtonItem: UIBarButtonItem!

  var planet: PlanetEntity?

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)

    title = planet?.title

    titleLabel.text = planet?.title
    descriptionTextView.text = planet?.desc
    iconImage.image = UIImage(named: planet?.icon ?? "Earth")
    setFavoriteState()
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
