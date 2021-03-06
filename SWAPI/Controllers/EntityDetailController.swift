//
//  EntityDetailController.swift
//  SWAPI
//
//  Created by Marcus Klausen on 25/10/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class EntityDetailController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var characterPicker: UIPickerView!
    @IBOutlet weak var characterSpecsTableView: UITableView!
    
    var entities = [Entity]()
    var headline = String()
    var entity: Entity?
    var measure: Measure = .metric
    
    @IBAction func didChangeMeasure(_ sender: Any) {
        print("pressed")
        // measure switch
        var lbs: Double = 0.0
        var feet: Double = 0.0
        
        
        switch measure {
        case .metric:
                measure = .english
                feet = 0.032808399
                lbs = 0.45359237
        case .english:
                measure = .metric
                feet = 30.48
                lbs = 2.20462262
        }
        
        if var entity = entity {
            
            // Dict for data collection
            var data: [String: Any] = entity.attributes
            
            for (key, value) in entity.attributes {
                
                // If value is int
                if let value = value as? Int {
                    
                    // Switch on different keys which holds different measures
                    switch key {
                    case Attributes.height.key:
                        let valueAsDouble = Double(value)
                        feet *= valueAsDouble
                        data[key] = Int(feet)
                    case Attributes.mass.key:
                        let valueAsDouble = Double(value)
                        lbs *= valueAsDouble
                        data[key] = Int(lbs)
                    default: break
                    }
                    
                }
                
                if let value = value as? Double {
                    switch key {
                    case Attributes.height.key:
                        let double = Double(value)
                        feet = double*feet
                        data[key] = Int(feet)
                    case Attributes.mass.key:
                        let double = Double(value)
                        lbs = double*lbs
                        data[key] = Int(lbs)
                    default: break
                    }
                }
            }
            
            // Put data back into attributes
            entity.attributes = data
        }
        
        characterSpecsTableView.reloadData()
    }
    
    
    
    // - Grab entity of choice
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let attributeCell = tableView.dequeueReusableCell(withIdentifier: "AttributeCell", for: indexPath) as? AttributeCell else { fatalError() }
		
        attributeCell.attributeValue.text = nil
        attributeCell.attributeName.text = nil
        
        
			
			// Get all keys of the attributes property
			let keys = Array(entities[0].attributes.keys)
			
			// Get current key for indexPath
			let currentKey = keys[indexPath.row]
			
			
			
			// FIXME: - Needs work once I accept attributes as Ints instead for strings for conversion
        
        if let entity = entity {
            print(entity.attributes)
            if let value = entity.attributes[keys[indexPath.row]] as? String {
                attributeCell.attributeValue.text = String(value)?.firstUppercased
                attributeCell.attributeName.text = Attributes(name: currentKey)?.displayName
            } else if let value = entity.attributes[keys[indexPath.row]] as? Int {
                attributeCell.attributeValue.text = String(value)
                attributeCell.attributeName.text = Attributes(name: currentKey)?.displayName
            } else if let value = entity.attributes[keys[indexPath.row]] as? Float {
                attributeCell.attributeValue.text = String(value)
                attributeCell.attributeName.text = Attributes(name: currentKey)?.displayName
            } else if let value = entity.attributes[keys[indexPath.row]] as? Double {
                attributeCell.attributeValue.text = String(value)
                attributeCell.attributeName.text = Attributes(name: currentKey)?.displayName
            }
            
            attributeCell.convertValueSwitch.isHidden = true
            
            if (entity.attributes[keys[indexPath.row]] as? Int) != nil {
                attributeCell.convertValueSwitch.isHidden = false
            }
            
            if (entity.attributes[keys[indexPath.row]] as? Float) != nil {
                attributeCell.convertValueSwitch.isHidden = false
            }
            if (entity.attributes[keys[indexPath.row]] as? Double) != nil {
                attributeCell.convertValueSwitch.isHidden = false
            }
            
        }

		
        
        
        return attributeCell
        }
		
		
    

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headline
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	
            // Remove nested dictionaries from attributes
            entities[0].attributes = removeUnwantedData(from: entities[0].attributes)
			return entities[0].attributes.count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.textAlignment = .center
        header.textLabel?.font = UIFont.systemFont(ofSize: 27.0)
        NSLayoutConstraint(item: header, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        header.backgroundView?.backgroundColor = UIColor(red: 28/255.0, green: 32/255.0, blue: 36/255.0, alpha: 1.0)
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set pickerview data source and delegates to self
        characterPicker.dataSource = self
        characterPicker.delegate = self
        
        
        // Reload title for display
        headline = entities[0].name as String
        entity = entities[0] as Entity
        characterPicker.selectRow(0, inComponent: 0, animated: true)
        
        if var entity = entity {
            entity.attributes = removeUnwantedData(from: entity.attributes)
        }
        
        characterSpecsTableView.reloadData()
        
        // obsolute but still cool
        
    
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



// MARK: - Pickerview

extension EntityDetailController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent  component: Int) {
        let characterSelected = entities[row].name as String
        headline = characterSelected
        entity = entities[row] as Entity
        if var entity = entity {
            entity.attributes = removeUnwantedData(from: entity.attributes)
        }
        characterSpecsTableView.reloadData()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Stub.characters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
		
        guard let entity: Entity = entities[row] else { return nil }
        
        let titleData = entity.name
        
        let myColor = UIColor(red: (250/255.0), green: (222/255.0), blue: (74/255.0), alpha: (1/1.0))
        let shadow = NSShadow()
        
        
        let myTitle = NSAttributedString(string: titleData,
                                         attributes: [
                                            NSFontAttributeName:UIFont(name: "Georgia", size: 25.0)!,
                                            NSForegroundColorAttributeName:myColor,
                                            NSShadowAttributeName: shadow
                                            ]
                                        )
        return myTitle
    }
    
    
    
}
