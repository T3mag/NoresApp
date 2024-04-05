//
//  Note+CoreDataProperties.swift
//  HomeWork2Sem
//
//  Created by Артур Миннушин on 28.03.2024.
//
//

import Foundation
import CoreData

extension Note {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var date: Date?
    @NSManaged public var name: String?
    @NSManaged public var note: String?
    @NSManaged public var id: Int16

}

extension Note: Identifiable {
}
