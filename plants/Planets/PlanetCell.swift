//  Copyright © 2016 HB. All rights reserved.

class PlanetCell: UITableViewCell, PlanetCellType {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var iconImage: UIImageView!

  var title: String? {
    didSet {
      titleLabel.text = title
    }
  }

  var desc: String? {
    didSet {
      descriptionLabel.text = desc
    }
  }

  var icon: UIImage? {
    didSet {
      iconImage.image = icon
    }
  }

}

import UIKit
