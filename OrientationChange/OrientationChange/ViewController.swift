//
//  ViewController.swift
//  OrientationChange
//
//  Created by HB on 11/05/2016.
//  Copyright © 2016 HB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var stackView: UIStackView!

  override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
    coordinator.animateAlongsideTransition({ (UIViewControllerTransitionCoordinatorContext) -> Void in

      let orientation = UIApplication.sharedApplication().statusBarOrientation
      switch orientation {
      case .Portrait:
        self.stackView.axis = .Vertical
      default:
        self.stackView.axis = .Horizontal
      }

      }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
    })

    super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
  }

}

