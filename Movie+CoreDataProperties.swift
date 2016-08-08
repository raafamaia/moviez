//
//  Movie+CoreDataProperties.swift
//  moviez
//
//  Created by R. Maia on 8/7/16.
//  Copyright © 2016 RM. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var title: String?
    @NSManaged var desc: String?
    @NSManaged var url: String?
    @NSManaged var image: NSData?
    @NSManaged var plot: String?

}
