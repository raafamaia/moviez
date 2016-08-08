//
//  Movie.swift
//  moviez
//
//  Created by R. Maia on 8/7/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movie: NSManagedObject {

    func setMovieImage(image: UIImage) {
        let data = UIImagePNGRepresentation(image)
        self.image = data
    }
    
    func getMovieImage() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }

}
