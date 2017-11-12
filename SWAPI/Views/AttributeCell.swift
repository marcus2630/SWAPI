//
//  AttributeCell.swift
//  SWAPI
//
//  Created by Marcus Klausen on 30/10/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class AttributeCell: UITableViewCell {

    @IBOutlet weak var convertValueSwitch: UIStackView!
    @IBOutlet weak var leftUnit: UILabel!
    @IBOutlet weak var rightUnit: UILabel!
    
    
    
    @IBOutlet weak var attributeName: UILabel!
    @IBOutlet weak var attributeValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        convertValueSwitch.isHidden = false
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
//    func determineConvertSwitchVisibilityFor(_ attribute: String) {
//        switch attribute {
//        case Attribute.height.key:
//            convertValueSwitch.isHidden = false
//        case Attribute.cost.key:
//            convertValueSwitch.isHidden = false
//            leftUnit.text = "USD"
//            rightUnit.text = "Credit"
//        default:
//            convertValueSwitch.isHidden = true
//        }
//    }
    


}
