//
//  Character.swift
//  SWAPI
//
//  Created by Marcus Klausen on 02/11/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


class Character {
    let name: String
    let height: Int
    let mass: Int
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    
    
    init(name: String, height: Int, mass: Int, hairColor: String, skinColor: String, eyeColor: String, birthYear: String, gender: String) {
        self.name = name
        self.height = height
        self.mass = mass
        self.hairColor = hairColor
        self.skinColor = skinColor
        self.eyeColor = eyeColor
        self.birthYear = birthYear
        self.gender = gender
    }
}

extension Character {
    convenience init?(withJson json: [String: String]) {
        struct Key {
            static let name = "name"
            static let height = "height"
            static let mass = "mass"
            static let hairColor = "hair_color"
            static let skinColor = "skin_color"
            static let eyeColor = "eye_color"
            static let birthYear = "birth_year"
            static let gender = "gender"
        }
        
        guard   let name        = json[Key.name],
                var height      = json[Key.height],
                var mass        = json[Key.mass],
                let hairColor   = json[Key.hairColor],
                let skinColor   = json[Key.skinColor],
                let eyeColor    = json[Key.eyeColor],
                let birthYear   = json[Key.birthYear],
                let gender      = json[Key.gender]
        else {
            return nil
        }
        
        let heightAsInt = Int(height)
        let massAsInt = Int(mass)
        
        
            
        
        self.init(name: name, height: heightAsInt, mass: massAsInt, hairColor: hairColor, skinColor: skinColor, eyeColor: eyeColor, birthYear: birthYear, gender: gender)
    }
}
