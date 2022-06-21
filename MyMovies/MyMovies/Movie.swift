//
//  Movie.swift
//  MyMovies
//
//  Created by José Roberto Bognar Junior on 20/06/22.
//

import UIKit

class Movie {
    var title: String!
    var description: String!
    var image: UIImage!
    
    init(title: String, description: String, image: String) {
        self.title = title
        self.description = description
        self.image = UIImage(named: image)
    }
}
