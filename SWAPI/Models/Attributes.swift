//
//  Attributes.swift
//  SWAPI
//
//  Created by Marcus Klausen on 04/11/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

enum Attributes {
    case name
    case height
    case mass
    case hairColor
    case skinColor
    case eyeColor
    case birthYear
    case gender
    case make
    case cost
    case length
    case classType
    case crew
	
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
    init?(name: String) {
        switch name {
        case "name": self = .name
        case "height": self = .height
        case "mass": self = .mass
        case "hair_color": self = .hairColor
        case "skin_color": self = .skinColor
        case "eye_color": self = .eyeColor
        case "birth_year": self = .birthYear
        case "gender": self = .gender
        case "manufacturer": self = .make
        case "cost_in_credits": self = .cost
        case "length": self = .length
        case "starship_class": self = .classType
        case "crew": self = .crew
        default: return nil
        }
    }
}
