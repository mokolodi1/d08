//
//  ArticleManager.swift
//  d08
//
//  Created by Teo FLEMING on 4/14/17.
//  Copyright © 2017 Teo Fleming. All rights reserved.
//

import Foundation
import CoreData

class ArticleManager {
    
    let context: NSManagedObjectContext
    
    init() {
        let container = NSPersistentContainer(name: "Article")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            
            print("Loaded articles from persistent stores")
        })
        
        context = container.viewContext
    }
    
    func newArticle(title: String, content: String, language: String) -> Article {
        let entityDescription = NSEntityDescription.entity(forEntityName: "Article", in: context)
        let newArticle = NSManagedObject(entity: entityDescription!, insertInto: context)
        
        newArticle.setValue(title, forKey: "title")
        newArticle.setValue(content, forKey: "content")
        newArticle.setValue(language, forKey: "language")
        newArticle.setValue(Date(), forKey: "created_date")
        newArticle.setValue(Date(), forKey: "modified_date")
        
        return newArticle as! Article
    }
    
    func getAllArticles() -> [Article] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        
        do {
            return try context.fetch(request) as! [Article]
        } catch {
            print("Failed to fetch articles:", error)
            
            return []
        }
    }
    
    func getArticles(containingString str: String) -> [Article] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        request.predicate = NSPredicate(format: "%K CONTAINS[cd] %@", "content", str)
        
        do {
            return try context.fetch(request) as! [Article]
        } catch {
            print("Failed to fetch articles:", error)
            
            return []
        }
    }
    
    func getArticles(withLang lang: String) -> [Article] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        request.predicate = NSPredicate(format: "language == %@", lang)
        
        do {
            return try context.fetch(request) as! [Article]
        } catch {
            print("Failed to fetch articles:", error)
            
            return []
        }
    }
    
    func removeArticle(article: Article) {
        context.delete(article)
    }

    func save() {
        do {
            try context.save()
        } catch (let error) {
            print("error saving:", error)
        }
    }
}
