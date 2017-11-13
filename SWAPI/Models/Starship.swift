////
////  Starship.swift
////  SWAPI
////
////  Created by Marcus Klausen on 11/11/2017.
////  Copyright © 2017 Treehouse. All rights reserved.
////
//
//import Foundation
//
//
////
////  Character.swift
////  SWAPI
////
////  Created by Marcus Klausen on 02/11/2017.
////  Copyright © 2017 Treehouse. All rights reserved.
////
//
//import Foundation
//
//
//
//class Starship: Entity{
//    let name: String
//    let make: String
//    let cost: Int
//    let lenght: Int
//    let classType: String
//    let crew: String
//
//
//    init(name: String, make: String, cost: Int, lenght: Int, classType: String, crew: String) {
//        self.name = name
//        self.make = make
//        self.cost = cost
//        self.lenght = lenght
//        self.classType = classType
//        self.crew = crew
//
//    }
//}
//
//extension Starship {
//    convenience init?(withJson json: [String: Any]) {
//        struct Key {
//            static let name = "name"
//            static let make = "manufacturer"
//            static let cost = "cost_in_credits"
//            static let lenght = "lenght"
//            static let classType = "starship_class"
//            static let crew = "crew"
//        }
//
//        guard   let name        = json[Key.name] as? String,
//            let make      = json[Key.make] as? String,
//            let cost        = json[Key.cost] as? String,
//            let length   = json[Key.lenght] as? String,
//            let classType   = json[Key.classType] as? String,
//            let crew    = json[Key.crew] as? String
//            else {
//                return nil
//        }
//
//
//
//
//        guard let costAsInt = Int(cost), let lengthAsInt = Int(length) else { return nil }
//
//        self.init(name: name, make: make, cost: costAsInt, lenght: lengthAsInt, classType: classType, crew: crew)
//    }
//}

