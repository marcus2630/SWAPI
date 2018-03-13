//
//  Helper.swift
//  SWAPI
//
//  Created by Marcus Klausen on 14/11/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

func removeUnwantedData(from dictionary: [String : Any]) -> [String : Any] {

	var flatDictionary = [String : Any]()

	for (key, value) in dictionary {
		if let value = value as? String {
			if key != "url", key != "created", key != "edited", key != "films" {
			flatDictionary.updateValue(value, forKey: key)
			}
		}
        if let value = value as? Int {
            flatDictionary.updateValue(value, forKey: key)
        }
        if let value = value as? Double {
            flatDictionary.updateValue(value, forKey: key)
            print("double")
        }
        if let value = value as? Float {
            flatDictionary.updateValue(value, forKey: key)
        }
    }
	return flatDictionary
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}
