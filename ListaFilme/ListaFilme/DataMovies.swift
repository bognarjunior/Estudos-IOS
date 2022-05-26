//
//  DataMovies.swift
//  ListaFilme
//
//  Created by José Roberto Bognar Junior on 25/05/22.
//

import Foundation

class DataMovies {
    static var movies:[Movie] = []
    
    static func getFavoriteMovies() -> [Movie] {
        var favoriteMovies:[Movie] = []
        
        for movie in DataMovies.movies {
            if movie.isMyFavorite {
                favoriteMovies.append(movie)
            }
        }
        
        return favoriteMovies
    }
}
