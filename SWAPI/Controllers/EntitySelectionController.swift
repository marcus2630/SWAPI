//
//  EntitySelectionController.swift
//  SWAPI
//
//  Created by Marcus Klausen on 25/10/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class EntitySelectionController: UITableViewController {
    
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCharacters" {
            if let destination = segue.destination as? EntityDetailController {
                destination.navigationItem.title = "Characters"
                destination.entities = Stub.characters
            }
        }
        if segue.identifier == "showStarships" {
            if let destination = segue.destination as? EntityDetailController {
                destination.navigationItem.title = "Starships"
            }
        }
        if segue.identifier == "showVehicles" {
            if let destination = segue.destination as? EntityDetailController {
                destination.navigationItem.title = "Vehicles"
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let navigationControllerHeight = self.navigationController?.navigationBar.frame.height {
        
            let statusBarHeight = CGFloat(15)
            
            let viewHeight = self.view.frame.height - navigationControllerHeight - statusBarHeight
            let rows = CGFloat(tableView.numberOfRows(inSection: 0))
        
            let heightForRow = viewHeight/rows
            
            return heightForRow
        } else {
            let viewHeight = self.view.frame.height
            let rows = CGFloat(tableView.numberOfRows(inSection: 0))
            
            let heightForRow = viewHeight/rows
            
            return heightForRow
        }
        
        
        
        
        
    }
}
