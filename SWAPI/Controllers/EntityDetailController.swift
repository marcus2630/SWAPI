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
    
    
    var entities = [Entity]()
    
    // - Grab entity of choice
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let attributeCell = tableView.dequeueReusableCell(withIdentifier: "AttributeCell", for: indexPath) as? AttributeCell else { fatalError() }
		
        attributeCell.attributeValue.text = nil
        attributeCell.attributeName.text = nil
        
        
			// - Grab entity of choice
			var entity = entities[0]
			
			// Remove nested dictionaries from attributes
			entities[0].attributes = removeUnwantedData(from: entities[0].attributes)
			// Get all keys of the attributes property
			let keys = Array(entities[0].attributes.keys)
			
			// Get current key for indexPath
			let currentKey = keys[indexPath.row]
			
			
			
			// FIXME: - Needs work once I accept attributes as Ints instead for strings for conversion
			if let value = entity.attributes[keys[indexPath.row]] as? String {
				attributeCell.attributeValue.text = String(value)?.firstUppercased
				attributeCell.attributeName.text = Attributes(name: currentKey)?.displayName
			}
		
        
        
        return attributeCell
        }
		
		
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return entities[0].name
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
