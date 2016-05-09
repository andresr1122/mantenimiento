//
//  maintenanceGarageViewController.swift
//  vehicleMaintenance
//
//  Created by centro docente de computos on 15/04/16.
//  Copyright © 2016 tallerSoftware. All rights reserved.
//

import UIKit
import Firebase

class MaintenanceGarageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  
    var garages = [MaintenanceGarage]()
    let cellIdentifier = "garageCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        garages = MaintenanceGarage.garage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        let garage = garages[indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = garage.name
        cell?.detailTextLabel?.text = garage.service
        
        return cell!

    }
    

}
