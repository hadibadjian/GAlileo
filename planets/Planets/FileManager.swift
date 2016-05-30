//  Copyright © 2016 HB. All rights reserved.

class FileManager {
  /**
   Check if the file exists at `Document` path

   - parameter name: File name
   - parameter type: File type / extension

   - returns: `true` if the file exists, `false` otherwise
   */
  func fileExists(name: String?, ofType type: String?) -> Bool {

    guard let path = filePath(name, ofType: type).path else { return false }
    return NSFileManager.defaultManager().fileExistsAtPath(path)
  }

  /**
   Return content of the given file at `Document` path

   - parameter name: File name
   - parameter type: File type / extension

   - returns: Data object of the file, `nil` if does not exist
   */
  func contentOfFile(name: String, ofType type: String?) -> NSData? {
    guard let path = filePath(name, ofType: type).path else { return nil }
    return NSFileManager.defaultManager().contentsAtPath(path)
  }

  /**
   Copy file from the bundle to `Document` folder

   - parameter name: File name
   - parameter type: File type / extension

   - returns: `true` if successful, `false` if failed
   */
  func copyFromBundle(name: String?, ofType type: String?) -> Bool {
    let planetsDataPath = NSBundle.mainBundle().pathForResource(name, ofType: type)
    let planetsData = NSData(contentsOfURL: NSURL(fileURLWithPath: planetsDataPath!))

    guard let destinationPath = filePath(name, ofType: type).path else { return false }

    return NSFileManager.defaultManager().createFileAtPath(
      destinationPath,
      contents: planetsData,
      attributes: nil)
  }

  // MARK: Private

  private func filePath(name: String?, ofType type: String?) -> NSURL {
    let documentsDir = NSFileManager.defaultManager().URLsForDirectory(
        .DocumentDirectory,
        inDomains: .AllDomainsMask)[0]

    // NSFileManager.defaultManager().changeCurrentDirectoryPath(filePath)

    var filePath = documentsDir.URLByAppendingPathComponent(name ?? "")

    if let type = type { filePath = filePath.URLByAppendingPathExtension(type) }

    return filePath
  }
}

import Foundation
