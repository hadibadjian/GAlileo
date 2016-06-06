//  Copyright © 2016 HB. All rights reserved.

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!

  private var planets: [PlanetEntity]?

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    setTitle()
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
        cell.icon = UIImage(named: planets?[indexPath.row].icon ?? "Earth")
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
      if let planet = sender as? PlanetEntity {
        detailVC.planet = planet
      }
    }
  }

  // MARK: Planets

  private func setTitle() {
    NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString")

    let infoPlistPath = NSBundle.mainBundle().pathForResource("Info", ofType: "plist")
    let plist = NSDictionary(contentsOfFile: infoPlistPath!)

    title = "Planets v" + String(plist!["CFBundleShortVersionString"]!)
  }

  private func initialisePlanets() {
    planets = []

    // swiftlint:disable force_cast
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let fetchRequest = NSFetchRequest(entityName: "PlanetEntity")

    fetchRequest.sortDescriptors?.append(NSSortDescriptor(key: "title", ascending: true))

    do {
      if let storedPlanets =
        try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as? [PlanetEntity] {
          planets?.appendContentsOf(storedPlanets)
      }
    } catch {
      print("Something very bad went wrong")
    }
  }

}
