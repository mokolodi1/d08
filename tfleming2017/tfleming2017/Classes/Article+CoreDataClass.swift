//
//  Article+CoreDataClass.swift
//  
//
//  Created by Teo FLEMING on 4/14/17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Article)
public class Article: NSManagedObject {
    override public var description: String {
        return "Article \"\(title)\" created on \(created_date) and edited on \(modified_date)"
    }
}
