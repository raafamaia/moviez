//
//  MovieCell.swift
//  moviez
//
//  Created by R. Maia on 8/7/16.
//  Copyright © 2016 RM. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var descriptionMovie: UILabel!
    @IBOutlet weak var urlMovie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.clipsToBounds = true;
        img.layer.cornerRadius = img.frame.size.width / 2
    }

    func configureCell(movie: Movie) {
        
        self.titleMovie.text = movie.title
        self.descriptionMovie.text = movie.desc
        self.urlMovie.text = movie.url
        self.img.image = movie.getMovieImage()
        
    }

}
