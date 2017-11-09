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
    
    let character = Character(withJson: Stub.characterDict)
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let attributeCell = tableView.dequeueReusableCell(withIdentifier: "AttributeCell", for: indexPath) as? AttributeCell else { fatalError() }
        
        
        let keys = Array(Stub.characterDict.keys)
        let dataSourceNameMargin = 1
        let currentKey = keys[indexPath.row+dataSourceNameMargin]
        
        
        if currentKey == Attribute.height.jsonKey {
            attributeCell.showConvertSwitch(false)
        }
        
        
        
        attributeCell.attributeValue.text = Stub.characterDict[currentKey]?.firstUppercased
        attributeCell.attributeName.text = Attribute(name: currentKey)?.displayName
        
        return attributeCell
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Stub.character?.name
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
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
        return Stub.pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = Stub.pickerData[row]
        
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
