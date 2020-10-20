//
//  Agent+CoreDataProperties.swift
//  TestApp
//
//  Created by Константин Лопаткин on 20.10.2020.
//
//

import Foundation
import CoreData


extension Agent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Agent> {
        return NSFetchRequest<Agent>(entityName: "Agent")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var number: String?
    @NSManaged public var imageD: Data?

}

extension Agent : Identifiable {

}
