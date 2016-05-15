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
    planets = [
      Planet(
        title: "Earth",
        desc: "Earth, our home planet, is the only planet in our solar system known to harbor " +
          "life - life that is incredibly diverse. All the things we need to survive exist under " +
        "a thin layer of atmosphere that separates us from the cold, airless void of space.",
        icon: UIImage(named: "Earth")),
      Planet(
        title: "Jupiter",
        desc: "Jupiter, the most massive planet in our solar system -- with dozens of moons and " +
          "an enormous magnetic field -- forms a kind of miniature solar system. Jupiter does " +
          "resemble a star in composition, but it did not grow big enough to ignite. The planet's" +
          " swirling cloud stripes are punctuated by massive storms such as the Great Red Spot, " +
        "which has raged for hundreds of years.",
        icon: UIImage(named: "Jupiter")),
      Planet(
        title: "Mars",
        desc: "Mars is a cold desert world. It is half the diameter of Earth and has the same " +
          "amount of dry land. Like Earth, Mars has seasons, polar ice caps, volcanoes, canyons " +
          "and weather, but its atmosphere is too thin for liquid water to exist for long on the" +
          " surface. There are signs of ancient floods on Mars, but evidence for water now " +
        "exists mainly in icy soil and thin clouds.",
        icon: UIImage(named: "Mars")),
      Planet(
        title: "Mercury",
        desc: "Mercury's eccentric orbit takes the small planet as close as 47 million km " +
          "(29 million miles) and as far as 70 million km (43 million miles) from the sun. If " +
          "one could stand on the scorching surface of Mercury when it is at its closest point " +
          "to the sun, the sun would appear more than three times as large as it does when " +
        "viewed from Earth.",
        icon: UIImage(named: "Mercury")),
      Planet(
        title: "Moon",
        desc: "Our moon makes Earth a more livable planet by moderating our home planet's " +
          "wobble on its axis, leading to a relatively stable climate, and creating a rhythm that" +
          " has guided humans for thousands of years. The moon was likely formed after a " +
          "Mars-sized body collided with Earth and the debris formed into the most prominent " +
        "feature in our night sky.",
        icon: UIImage(named: "Moon")),
      Planet(
        title: "Neptune",
        desc: "Dark, cold and whipped by supersonic winds, Neptune is the last of the hydrogen" +
          " and helium gas giants in our solar system. More than 30 times as far from the sun as" +
          " Earth, the planet takes almost 165 Earth years to orbit our sun. In 2011 Neptune " +
          "completed its first orbit since its discovery in 1846. \"We see (Neptune) as Columbus" +
        " saw America from the coast of Spain. Its movements have been felt,\"",
        icon: UIImage(named: "Neptune")),
      Planet(
        title: "Pluto",
        desc: "Discovered in 1930, Pluto was long considered our solar system's ninth planet. " +
          "But after the discovery of similar intriguing worlds deeper in the distant Kuiper Belt" +
          " icy Pluto was reclassified as a dwarf planet. Findings by NASA's New Horizons in 2015" +
          " revealed for the first time how that Pluto is a complex and mysterious world. " +
          "Information about Pluto and its largest moon,Charon,provide insight into the collision" +
        " believed to have formed the dwarf planet and moons we see today.",
        icon: UIImage(named: "Pluto")),
      Planet(
        title: "Saturn",
        desc: "Adorned with thousands of beautiful ringlets, Saturn is unique among the planets." +
          " All four gas giant planets have rings -- made of chunks of ice and rock -- but none " +
          "are as spectacular or as complicated as Saturn's. Like the other gas giants, Saturn is" +
        " mostly a massive ball of hydrogen and helium.",
        icon: UIImage(named: "Saturn")),
      Planet(
        title: "Uranus",
        desc: "Uranus is the only giant planet whose equator is nearly at right angles to its" +
          " orbit. A collision with an Earth-sized object may explain the unique tilt. Nearly a " +
          "twin in size to Neptune, Uranus has more methane in its mainly hydrogen and helium " +
        "atmosphere than Jupiter or Saturn. Methane gives Uranus its blue tint.",
        icon: UIImage(named: "Uranus")),
      Planet(
        title: "Venus",
        desc: "Similar in structure and size to Earth, Venus' thick, toxic atmosphere traps " +
          "heat in a runaway greenhouse effect. A permanent layer of clouds traps heat, creating" +
          " surface temperatures hot enough to melt lead. Glimpses below the clouds reveal " +
          "volcanoes and deformed mountains. Venus spins slowly in the opposite direction of " +
        "most planets.",
        icon: UIImage(named: "Venus"))
    ]
  }

}
