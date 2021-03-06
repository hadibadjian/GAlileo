//  Copyright © 2016 HB. All rights reserved.

import UIKit
import CoreData
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(
    application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
      let _ = managedObjectContext
      initStoredPlanets()
      return true
  }

  func applicationDidBecomeActive(application: UIApplication) {
    Alamofire.request(
      .GET,
      "https://raw.githubusercontent.com/hadibadjian/GAlileo/master/planets/Planets/planets.json",
      parameters: nil)
      .validate()
      .responseJSON { response in
        switch response.result {
        case .Success:
          if let planets = response.result.value as? Array<Dictionary<String, String>> {
            // delete data in storage
            let fetchRequest = NSFetchRequest(entityName: "PlanetEntity")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do {
              try self.managedObjectContext.executeRequest(deleteRequest)

              // populate new data
              self.createPlanets(planets)
            } catch {
              print("Failed to delete entites from storage")
            }
          }
        case .Failure(let error):
          print(error)
        }
    }
  }

  func applicationDidEnterBackground(application: UIApplication) {
    saveContext()
  }

  func applicationWillTerminate(application: UIApplication) {
    saveContext()
  }

  // Mark: CoreData Initialization

  lazy var applicationDocumentsDirectory: NSURL = {
    // The directory the application uses to store the Core Data store file.
    let urls = NSFileManager.defaultManager().URLsForDirectory(
      .DocumentDirectory,
      inDomains: .UserDomainMask)
    return urls[urls.count-1]
  }()

  lazy var managedObjectModel: NSManagedObjectModel = {
    // The managed object model for the application. This property is not optional.
    // It is a fatal error for the application not to be able to find and load its model.
    let modelURL = NSBundle.mainBundle().URLForResource("datastore", withExtension: "momd")!
    return NSManagedObjectModel(contentsOfURL: modelURL)!
  }()

  lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
    // The persistent store coordinator for the application. This implementation creates
    // and returns a coordinator, having added the store for the application to it. This
    // property is optional since there are legitimate error conditions that could cause
    // the creation of the store to fail.

    // Create the coordinator and store
    let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
    let url =
    self.applicationDocumentsDirectory.URLByAppendingPathComponent("Planets.sqlite")

    var failureReason = "There was an error creating or loading the application's saved data."

    do {
      print(url)
      try coordinator.addPersistentStoreWithType(
        NSSQLiteStoreType,
        configuration: nil,
        URL: url,
        options: nil)
    } catch {
      // Report any error we got.
      var dict = [String: AnyObject]()
      dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
      dict[NSLocalizedFailureReasonErrorKey] = failureReason

      dict[NSUnderlyingErrorKey] = error as NSError
      let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
      // Replace this with code to handle the error appropriately.
      // abort() causes the application to generate a crash log and terminate. You should not
      // use this function in a shipping application, although it may be useful during development.
      NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
      abort()
    }

    return coordinator
  }()

  lazy var managedObjectContext: NSManagedObjectContext = {
    // Returns the managed object context for the application (which is already bound to the
    // persistent store coordinator for the application.) This property is optional since there
    // are legitimate error conditions that could cause the creation of the context to fail.
    let coordinator = self.persistentStoreCoordinator
    var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
    managedObjectContext.persistentStoreCoordinator = coordinator
    return managedObjectContext
  }()

  // MARK: - Core Data Saving support

  func saveContext () {
    if managedObjectContext.hasChanges {
      do {
        try managedObjectContext.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not
        // use this function in a shipping application, although it may be useful during
        // development.
        let nserror = error as NSError
        NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
        abort()
      }
    }
  }

  // MARK: Data Initialization

  private func initStoredPlanets() {
    let fetchRequest = NSFetchRequest(entityName: "PlanetEntity")

    do {
      if let storedPlanets =
        try managedObjectContext.executeFetchRequest(fetchRequest) as? [PlanetEntity] {
        if storedPlanets.isEmpty { persistPlanets() }
      }
    } catch {
      print("something bad went wrong")
    }
  }

  private func persistPlanets() {
    let fileName = "planets"
    let fileType = "json"

    let fileManager = FileManager()

    if !fileManager.fileExists(fileName, ofType: fileType) {
      fileManager.copyFromBundle(fileName, ofType: fileType)
    }

    do {
      let planetsData = fileManager.contentOfFile(fileName, ofType: fileType)

      let planetsArray =
      try NSJSONSerialization.JSONObjectWithData(planetsData!, options: .AllowFragments) as? NSArray

      createPlanets(planetsArray!)
    } catch {
      print("Something went wrong!")
    }
  }

  private func createPlanets(planets: NSArray) {
    for planet in planets {
      if let planet = planet as? Dictionary<String, String> {
        // swiftlint:disable force_cast
        let planetEntity = NSEntityDescription.insertNewObjectForEntityForName(
          "PlanetEntity",
          inManagedObjectContext: managedObjectContext) as! PlanetEntity
        planetEntity.title = planet["title"]
        planetEntity.desc  = planet["desc"]
        planetEntity.icon  = planet["icon"]
        planetEntity.favorite = false
      }
    }
  }
}
