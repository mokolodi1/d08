//
//  Article+CoreDataProperties.swift
//  
//
//  Created by Teo FLEMING on 4/14/17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article");
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var image: NSData?
    @NSManaged public var created_date: NSDate?
    @NSManaged public var modified_date: NSDate?

    override public var description: String {
        return "Article \"\(title)\" created on \(created_date) and edited on \(modified_date)"
    }
}
