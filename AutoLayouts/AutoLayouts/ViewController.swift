//
//  ViewController.swift
//  AutoLayouts
//
//  Created by HB on 11/05/2016.
//  Copyright © 2016 HB. All rights reserved.
//

class ViewController: UIViewController {

  @IBOutlet weak var label1: UILabel!
  @IBOutlet weak var label2: UILabel!
  @IBOutlet weak var label3: UILabel!


  @IBOutlet weak var topConstraint: NSLayoutConstraint!
  @IBOutlet weak var leadingConstraint: NSLayoutConstraint!

  override func viewDidLoad() {
    super.viewDidLoad()

    // setupConstraints()
    label1.hidden = true
    label2.hidden = true
    label3.hidden = true
  }

  @IBAction func buttonPressed(sender: AnyObject) {
    let origX = CGFloat(arc4random_uniform(UInt32(view.frame.size.width / 2)))
    let origY = CGFloat(arc4random_uniform(UInt32(view.frame.size.height / 2)))
    topConstraint.constant = origX
    leadingConstraint.constant = origY

//    topConstraint.active = !topConstraint.active
  }

  func setupConstraints() {
    label1.translatesAutoresizingMaskIntoConstraints = false
    label2.translatesAutoresizingMaskIntoConstraints = false
    label3.translatesAutoresizingMaskIntoConstraints = false

    let views = ["label1": label1, "label2": label2, "label3": label3]
    let metrics = ["margin": 50]
    let horizontalFormat = "[label1]-(margin)-[label2]-[label3]|"
    let verticalFormat1   = "V:|-50-[label1]"
    let verticalFormat2   = "V:|-50-[label2]"
    let verticalFormat3   = "V:|-50-[label3]"


    let hContraints = NSLayoutConstraint.constraintsWithVisualFormat(
      horizontalFormat,
      options: .AlignAllTop,
      metrics: metrics,
      views: views)

    let vContraints1 = NSLayoutConstraint.constraintsWithVisualFormat(
      verticalFormat1,
      options: .AlignAllRight,
      metrics: nil,
      views: views)

    let vContraints2 = NSLayoutConstraint.constraintsWithVisualFormat(
      verticalFormat2,
      options: .AlignAllRight,
      metrics: nil,
      views: views)

    let vContraints3 = NSLayoutConstraint.constraintsWithVisualFormat(
      verticalFormat3,
      options: .AlignAllRight,
      metrics: nil,
      views: views)

    NSLayoutConstraint.activateConstraints(hContraints)
    NSLayoutConstraint.activateConstraints(vContraints1)
    NSLayoutConstraint.activateConstraints(vContraints2)
    NSLayoutConstraint.activateConstraints(vContraints3)
  }

}

import UIKit
import Foundation
