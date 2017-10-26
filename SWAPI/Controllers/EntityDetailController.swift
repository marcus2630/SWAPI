//
//  EntityDetailController.swift
//  SWAPI
//
//  Created by Marcus Klausen on 25/10/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class EntityDetailController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        
        let myColor = UIColor(red: (250/255.0), green: (222/255.0), blue: (74/255.0), alpha: (1/1.0))
        
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 20.0)!,NSForegroundColorAttributeName:myColor])
        return myTitle
    }
    
    
    let pickerData = ["Mozzarella","Gorgonzola","Provolone","Brie","Maytag Blue","Sharp Cheddar","Monterrey Jack","Stilton","Gouda","Goat Cheese", "Asiago"]
    
    
    
    @IBOutlet weak var characterPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        characterPicker.dataSource = self
        characterPicker.delegate = self
    
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
