//
//  frmVehicleViewController.swift
//  vehicleMaintenance
//
//  Created by centro docente de computos on 15/04/16.
//  Copyright © 2016 tallerSoftware. All rights reserved.
//

import UIKit
import Firebase

// ---- Add code to save vihicle  

class VehicleViewController: UIViewController {
    
     //MARK: - Properties
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var kilometerTextField: UITextField!
    @IBOutlet weak var oilchangeTextField: UITextField!
    @IBOutlet weak var tankTextField: UITextField!
    @IBOutlet weak var soatTextField: UITextField!
    @IBOutlet weak var tecnoTextField: UITextField!
    
    
    @IBAction func save(sender: AnyObject) {
        
        let vehicle = Vehicle(id:"0",model: modelTextField.text!, make: makeTextField.text!, kilometers: kilometerTextField.text!, oilchange: oilchangeTextField.text!, tank: tankTextField.text!, soat: soatTextField.text!,tecno: tecnoTextField.text!)
        
        let vehicleRef = ref!.childByAutoId()
        
        vehicleRef.setValue(vehicle.toDictionary(), withCompletionBlock: { (error, ref) in
            if error != nil {
                
                self.makeAlertWithMessage("Ha ocurrido un error al guardar el vehiculo")
            
            }else{
                self.makeAlertWithMessage("Su vehiculo ha sido guardado")
            }
            
        })
    }
    var ref: Firebase!

    override func viewDidLoad() {
        super.viewDidLoad()
        
         ref = Firebase(url: "https://vehicle.firebaseio.com")

        // Do any additional setup after loading the view.
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
    
    // MARK: - Utils
    func makeAlertWithMessage(message: String) {
        
        let alert = UIAlertController(title: "Alerta", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            
            self.navigationController?.popViewControllerAnimated(true)
            
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

}
