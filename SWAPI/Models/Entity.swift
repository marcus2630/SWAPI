//
//  Entity.swift
//  SWAPI
//
//  Created by Marcus Klausen on 11/11/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

protocol Entity {
    var name: String { get }
    var attributes: [String : Any] { get set }
	init(name: String, attributes: [String : Any])
	init?(withJson json: [String : Any])
}
