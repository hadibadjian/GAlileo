//  Copyright © 2016 HB. All rights reserved.

class AnimalsTableViewController: UITableViewController, AddAnimal {

  var animals: [Animal] = []

  // MARK: - UIViewController LifeCycle

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Animals"
  }

  @IBAction func AddButtonPressed(sender: AnyObject) {
    let navController =
    storyboard?.instantiateViewControllerWithIdentifier("AddAnimalViewController")
    if let navController = navController as? UINavigationController {
      if let viewCont = navController.viewControllers.first as? AddAnimalViewController {
        viewCont.delegate = self
      }
      presentViewController(navController, animated: true, completion: nil)
    }
  }

  // MARK: - UITableViewDelegate

  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Cats"
  }

  override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return nil
  }

  override func tableView(
    tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("AnimalsTableViewCellReuseIdentifier")

      let animal = animals[indexPath.row]
      if let cell = cell as? AnimalsTableViewCell {
        cell.nameLabel.text = animal.name
        cell.locationLabel.text = animal.location

        if let category = animal.category {
          switch category {
          case "Cat":
            cell.iconView.image = UIImage(named: "cat")
          case "Dog":
            cell.iconView.image = UIImage(named: "dog")
          case "Reptile":
            cell.iconView.image = UIImage(named: "reptile")
          case "Bird":
            cell.iconView.image = UIImage(named: "bird")
          default:
            cell.iconView.image = nil
          }
        }
      }

      return cell!
  }

  override func tableView(
    tableView: UITableView,
    didSelectRowAtIndexPath indexPath: NSIndexPath) {
      tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }

  // MARK: - UITableViewDataSource

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return animals.count
  }

  // MARK: AddAnimal

  func add(animal: Animal?) {
    guard animal != nil else { return }

    animals.append(animal!)
    tableView.reloadData()
  }
}

import UIKit
