//
//  Information+CoreDataProperties.swift
//  FinalProject
//
//  Created by MacStudent on 2020-01-20.
//  Copyright © 2020 MacStudent. All rights reserved.
//
//

import Foundation
import CoreData


extension Information {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Information> {
        return NSFetchRequest<Information>(entityName: "Information")
        
        
    }

    @NSManaged public var name: String?
    @NSManaged public var gender: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var country: String?
    @NSManaged public var image: Data?
    @NSManaged public var dob: Date
    @NSManaged public var photoID: NSNumber?

}
