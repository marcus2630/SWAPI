//
//  Stub.swift
//  SWAPI
//
//  Created by Marcus Klausen on 28/10/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import UIKit

class Stub {
    
    
    static let characters: [Character] = [Stub.character!, Stub.characterSecond!]
	static let starships: [Starship] = [Stub.starship!, Stub.starshipSecond!]
	
    
    static let character = Character(withJson: characterDict)
    static let characterSecond = Character(withJson: characterDictSecond)
	static let starship = Starship(withJson: starshipDict)
	static let starshipSecond = Starship(withJson: starshipDictSecond)
    
    // static let starship = Starship(withJson: starshipDict)
    
    static let characterDict: [String: Any] = ["name": "Luke Skywalker",
                                "height": "172",
                                "mass": "77",
                                "hair_color": "blond",
                                "skin_color": "fair",
                                "eye_color": "blue",
                                "birth_year": "19BBY",
                                "gender": "male"]
	
    static let characterDictSecond: [String: Any] = ["name": "C-3PO",
                                                     "height": "167",
                                                     "mass": "75",
                                                     "hair_color": "n/a",
                                                     "skin_color": "gold",
                                                     "eye_color": "yellow",
                                                     "birth_year": "112BBY",
                                                     "gender": "n/a"]
    
    static let starshipDict: [String: Any] = ["name": "Death Star",
                               "model": "DS-1 Orbital Battle Station",
                               "manufacturer": "Imperial Department of Military Research, Sienar Fleet Systems",
                               "cost_in_credits": "1000000000000",
                               "length": "120000",
                               "max_atmosphering_speed": "n/a",
                               "crew": "342953",
                               "passengers": "843342",
                               "cargo_capacity": "1000000000000",
                               "consumables": "3 years",
                               "hyperdrive_rating": "4.0",
                               "MGLT": "10",
                               "starship_class": "Deep Space Mobile Battlestation",
                               "pilots": [],
                               "films": ["https://swapi.co/api/films/1/"],
                               "created": "2014-12-10T16:36:50.509000Z",
                               "edited": "2014-12-22T17:35:44.452589Z",
                            "url": "https://swapi.co/api/starships/9/"]
	static let starshipDictSecond: [String : Any] = ["name": "Star Destroyer",
													 "model": "Imperial I-class Star Destroyer",
													 "manufacturer": "Kuat Drive Yards",
													 "cost_in_credits": "150000000",
													 "length": "1,600",
													 "max_atmosphering_speed": "975",
													 "crew": "47060",
													 "passengers": "0",
													 "cargo_capacity": "36000000",
													 "consumables": "2 years",
													 "hyperdrive_rating": "2.0",
													 "MGLT": "60",
													 "starship_class": "Star Destroyer",
													 "pilots": [],
													 "films": [
														"https://swapi.co/api/films/2/",
														"https://swapi.co/api/films/3/",
														"https://swapi.co/api/films/1/"
		],
													 "created": "2014-12-10T15:08:19.848000Z",
													 "edited": "2014-12-22T17:35:44.410941Z",
													 "url": "https://swapi.co/api/starships/3/"]

    
}

