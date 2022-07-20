//
//  Store.swift
//  MyTravels
//
//  Created by José Roberto Bognar Junior on 19/07/22.
//

import UIKit

class Store{
    let KEY = "MYTRAVELS"
    var travels: [Dictionary<String, String>] = []
    
    func getDefauls() -> UserDefaults {
        return UserDefaults.standard
    }
    
    func addTravel(travel: Dictionary<String, String>) {
        travels = self.getTravels()
        travels.append(travel)
        self.getDefauls().set(travel, forKey: self.KEY)
        self.getDefauls().synchronize()
    }
    
    func getTravels() -> [Dictionary<String, String>] {
        let data =  self.getDefauls().object(forKey: self.KEY)
        if data != nil {
            return (data as? [Dictionary<String, String>])!
        }
        return []
    }
    
    func removeTravel() {
        
    }
}
