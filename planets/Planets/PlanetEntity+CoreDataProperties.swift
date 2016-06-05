//
//  PlanetEntity+CoreDataProperties.swift
//  Planets
//
//  Created by HB on 06/06/2016.
//  Copyright © 2016 HB. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension PlanetEntity {

    @NSManaged var title: String?
    @NSManaged var desc: String?
    @NSManaged var icon: String?
    @NSManaged var favorite: NSNumber?

}
