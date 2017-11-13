//
//  Attributes.swift
//  SWAPI
//
//  Created by Marcus Klausen on 04/11/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

enum Attributes {
    case name(String)
    case height(Int)
    case mass(Int)
    case hairColor(String)
    case skinColor(String)
    case eyeColor(String)
    case birthYear(String)
    case gender(String)
    case make(String)
    case cost(Int)
    case length(Int)
    case classType(String)
    case crew(String)
    
    var displayName: String {
        switch self {
        case .name: return "Name"
        case .height: return "Height"
        case .mass: return "Mass"
        case .hairColor: return "Hair"
        case .skinColor: return "Skin"
        case .eyeColor: return "Eyes"
        case .birthYear: return "Born"
        case .gender: return "Gender"
        case .make: return "Make"
        case .cost: return "Cost"
        case .length: return "Length"
        case .classType: return "Class"
        case .crew: return "Crew"
        }
    }
    var key: String {
        switch self {
        case .name: return "name"
        case .height: return "height"
        case .mass: return "mass"
        case .hairColor: return "hair_color"
        case .skinColor: return "skin_color"
        case .eyeColor: return "eye_color"
        case .birthYear: return "birth_year"
        case .gender: return "gender"
        case .make: return "manufacturer"
        case .cost: return "cost_in_credits"
        case .length: return "length"
        case .classType: return "starship_class"
        case .crew: return "crew"
        }
    }
}

extension Attributes {
    init?(name: String, value: Any) {
        switch name {
        case "name": self = .name(value as! String)
        case "height": self = .height(value as! Int)
        case "mass": self = .mass(value as! Int)
        case "hair_color": self = .hairColor(value as! String)
        case "skin_color": self = .skinColor(value as! String)
        case "eye_color": self = .eyeColor(value as! String)
        case "birth_year": self = .birthYear(value as! String)
        case "gender": self = .gender(value as! String)
        case "manufacturer": self = .make(value as! String)
        case "cost_in_credits": self = .cost(value as! Int)
        case "length": self = .length(value as! Int)
        case "starship_class": self = .classType(value as! String)
        case "crew": self = .crew(value as! String)
        default: return nil
        }
    }
}
