//
//  Extensions.swift
//  SWAPI
//
//  Created by Marcus Klausen on 01/11/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


extension String {
    var firstUppercased: String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
}
