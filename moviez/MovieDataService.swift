//
//  MovieDataService.swift
//  moviez
//
//  Created by R. Maia on 8/7/16.
//  Copyright © 2016 RM. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class MovieDataService {
    
    static let instance = MovieDataService()
    
    private var _movies = [Movie]()
    var movies: [Movie] {
        return _movies
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self._movies = results as! [Movie]
        }
        catch {
            print("Error")
        }

    }
}