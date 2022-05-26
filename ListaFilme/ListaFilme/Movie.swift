//
//  Movie.swift
//  ListaFilme
//
//  Created by José Roberto Bognar Junior on 25/05/22.
//

import Foundation

class Movie {
    var name: String
    var imageName: String
    var isMyFavorite: Bool
    
    init(name:String, imageName:String, isMyFavorite:Bool) {
        self.name = name
        self.imageName = imageName
        self.isMyFavorite = isMyFavorite
    }
}
