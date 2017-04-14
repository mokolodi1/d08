//
//  ViewController.swift
//  d08
//
//  Created by Teo FLEMING on 4/14/17.
//  Copyright © 2017 Teo Fleming. All rights reserved.
//

import UIKit
import tfleming2017

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = ArticleManager()
        
        print("articles already loaded:", manager.getAllArticles().count)
        
        let newArticle = manager.newArticle(title: "Hello", content: "This is the contents", language: "en")
        print("new article:", newArticle)

        print("articles loaded now:", manager.getAllArticles().count)
        
        print("removing article")
        manager.removeArticle(article: newArticle)

        print("articles loaded now:", manager.getAllArticles().count)
        
        print("going to load a bunch of articles (ahem two)")
        manager.newArticle(title: "Hello", content: "Something in English", language: "en")
        manager.newArticle(title: "Bonjour", content: "Qch en francais", language: "fr")
        
        print("articles loaded now:", manager.getAllArticles().count)
        print("French count:", manager.getArticles(withLang: "fr").count)
        print("Containing string something:", manager.getArticles(containingString: "something").count)
        
        print("Saving...")
        manager.save()
    }
}

