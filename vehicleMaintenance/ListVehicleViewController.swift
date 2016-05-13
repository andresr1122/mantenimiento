//
//  listvehicleViewController.swift
//  vehicleMaintenance
//
//  Created by centro docente de computos on 4/15/16.
//  Copyright © 2016 tallerSoftware. All rights reserved.
//

import UIKit
import Firebase

class ListVehicleViewController: UITableViewController
 {
    //detalilVehiculeViewControllerDelegate
    
    var vehicles = [Vehicle]()
    var vehicle =  Vehicle()
    let cellIdentifier = "vehicleCell"
    var handle: UInt!
    var ref: Firebase!

    override func viewDidLoad() {
        super.viewDidLoad()
        //vehicles = Vehicle.vehicles()
        // Do any additional setup after loading the view.
         ref = Firebase(url: "https://vehicle.firebaseio.com")
       
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        handle = ref.queryOrderedByKey().observeEventType(.Value, withBlock: { (snapshot) in
            
            if snapshot.exists(){
                self.vehicles = [Vehicle]()
                for item in snapshot.children{
                    let vehicle = Vehicle(snapshot: item as! FDataSnapshot)
                    self.vehicles.append(vehicle)
                }
                
                self.tableView.reloadData()
            }
        })
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        ref.removeObserverWithHandle(handle)
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    
    // MARK: - UITableViewDataSource
  
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let vehicle = vehicles[indexPath.row]
        //cell.textLabel!.numberOfLines = 0
        cell.textLabel!.text = vehicle.make! + " " + vehicle.linea!
        cell.detailTextLabel!.text = vehicle.kilometers
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vehicle = vehicles[indexPath.row]
        self.performSegueWithIdentifier("detailvehicle", sender: vehicle)
    }
    
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Destructive, title: "Borrar" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            self.vehicle = self.vehicles[indexPath.row]
            
            let vehicleRef = self.ref.childByAppendingPath(self.vehicle.id)
            
            vehicleRef.removeValueWithCompletionBlock({ (error, ref) -> Void in
                
                if error != nil {
                    self.makeAlertWithMessage("Ha ocurrido un error al borrar")
                    print(error.localizedDescription)
                }else{
                    self.makeAlertWithMessage("El contacto ha sido borrado")
                }
                
            })
        })
        
        return [deleteAction]
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let  destionationVC = segue.destinationViewController as? DetailVehiculeViewController
        {
            if segue.identifier == "detailvehicle" {
                if let vehicule = sender as? Vehicle {
                    destionationVC.modelo = vehicule
                }
                
            }
            
            
        }
    }

    
    
    // MARK: - DetailViewControllerDelegate
    //func updateVehicle(vehicle: Vehicle, withKilometer kilometers: Int) {
//        let index = vehicles.indexOf { $0 === vehicle }
//        if index != nil{
//            vehicle.kilometers = "\(kilometers)"
//            vehicles[index!] = vehicle
//            tableView.reloadData()
//        }
        
   // }
    
    func makeAlertWithMessage(message: String) {
        
        let alert = UIAlertController(title: "Alerta", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            
            self.navigationController?.popViewControllerAnimated(true)
            
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    
}

    
    
    



    



