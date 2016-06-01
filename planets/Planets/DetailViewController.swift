//  Copyright © 2016 HB. All rights reserved.

class DetailViewController: UIViewController {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var iconImage: UIImageView!
  @IBOutlet weak var descriptionTextView: UITextView!
  @IBOutlet weak var favoriteBarButtonItem: UIBarButtonItem!

  var planet: Planet?

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)

    title = planet?.title

    titleLabel.text = planet?.title
    descriptionTextView.text = planet?.desc
    iconImage.image = planet?.icon
    toggleFavorite()
  }

  @IBAction func favoritePressed(sender: AnyObject) {
    planet?.favorite = !(planet?.favorite ?? false)
    toggleFavorite()
  }

  private func toggleFavorite() {
    if let planet = planet {
      favoriteBarButtonItem.tintColor =
        planet.favorite ? UIColor.purpleColor() : UIColor.grayColor()

      let favKey = String(format: formattedPlanetFavKey, planet.title ?? "-")
      NSUserDefaults.standardUserDefaults().setBool(planet.favorite, forKey: favKey)
    }
  }
}

import UIKit
