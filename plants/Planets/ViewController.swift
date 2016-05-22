//  Copyright © 2016 HB. All rights reserved.

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!

  private var planets: [Planet]?

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    initialisePlanets()

    tableView.dataSource = self
    tableView.delegate = self
    tableView.reloadData()
  }

  // MARK: TableView Delegate & DataSource

  func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return nil
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let planets = planets else { return 0 }
    return planets.count
  }

  func tableView(
    tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("PlanetCellIdentifier")

      if var cell = cell as? PlanetCellType {
        cell.title = planets?[indexPath.row].title
        cell.desc = planets?[indexPath.row].desc
        cell.icon = planets?[indexPath.row].icon
      }

      return cell!
  }

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    performSegueWithIdentifier("showDetailViewControllerSegue", sender: planets?[indexPath.row])
  }

  // MARK: Segue

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let detailVC = segue.destinationViewController as? DetailViewController {
      if let planet = sender as? Planet {
        detailVC.planet = planet
      }
    }
  }

  // MARK: Planets

  func initialisePlanets() {
    planets = []

    let planetsDataPath = NSBundle.mainBundle().pathForResource("planets", ofType: "json")
    let planetsData = NSData(contentsOfURL: NSURL(fileURLWithPath: planetsDataPath!))

    do {
      let planetsArray =
      try NSJSONSerialization.JSONObjectWithData(planetsData!, options: .AllowFragments) as? NSArray

      for planet in planetsArray! {
        if let planet = planet as? Dictionary<String, String> {
          let p = Planet(
            title: planet["title"],
            desc: planet["desc"],
            icon: UIImage(named: planet["icon"]!))
          planets?.append(p)
        }
      }
    } catch {
      print("Something went wrong!")
    }
  }

}
