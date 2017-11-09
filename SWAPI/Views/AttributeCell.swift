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
    @IBOutlet weak var attributeName: UILabel!
    @IBOutlet weak var attributeValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        convertValueSwitch.isHidden = true
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func showConvertSwitch(_ hidden: Bool) {
            convertValueSwitch.isHidden = hidden
    }

}
