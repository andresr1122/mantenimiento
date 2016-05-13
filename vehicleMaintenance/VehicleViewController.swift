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
    var ref: Firebase!
    var tipo:String = "Carro"
    
    var vehicle =  Vehicle()
    var identifierView : String?
    

    //MARK: - IBOutles
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var kilometerTextField: UITextField!
    @IBOutlet weak var oilchangeTextField: UITextField!
    @IBOutlet weak var tankTextField: UITextField!
    @IBOutlet weak var soatTextField: UITextField!
    @IBOutlet weak var tecnoTextField: UITextField!
    
    @IBOutlet weak var placaTextField: UITextField!
    @IBOutlet weak var lineaTextField: UITextField!
    @IBOutlet weak var frecuenciaaceiteTextField: UITextField!
    
    @IBOutlet weak var botonCarro: UISegmentedControl!
    @IBOutlet weak var botonMoto: UISegmentedControl!
    
    //MARK: - IBAction
    @IBAction func carroButon(sender: AnyObject) {
        self.tipo = "Carro"
    }
    @IBAction func motoButon(sender: AnyObject) {
        self.tipo = "Moto"
    }
  
    @IBAction func save(sender: AnyObject) {
        
        if identifierView == "editVehicle" {
            
            vehicle.tipo = self.tipo
            vehicle.kilometers = self.kilometerTextField.text
            vehicle.tank = self.tankTextField.text
            vehicle.oilchange = self.oilchangeTextField.text
            vehicle.frecuenciaaceite = self.frecuenciaaceiteTextField.text
            vehicle.soat = self.soatTextField.text
            vehicle.tecno = self.tecnoTextField.text
            
            let vehicleRef = ref!.childByAppendingPath(vehicle.id)
            
            vehicleRef?.updateChildValues(vehicle.toDictionary(), withCompletionBlock: { (error, ref) in
                if error != nil {
                    self.makeAlertWithMessage("Ha ocurrido un error al actualizar")
                }else{
                    self.makeAlertWithMessage("Su vehiculo ha sido actualizado")
                }
            })

            
            
        }else{
            let vehicle = Vehicle(id:"0",model: modelTextField.text!, make: makeTextField.text!, kilometers: kilometerTextField.text!, oilchange: oilchangeTextField.text!, tank: tankTextField.text!, soat: soatTextField.text!,tecno: tecnoTextField.text!, placa: placaTextField.text! , tipo: tipo, linea: lineaTextField.text!, frecuenciaaceite: frecuenciaaceiteTextField.text!)
            
            let vehicleRef = ref!.childByAutoId()
            
            vehicleRef.setValue(vehicle.toDictionary(), withCompletionBlock: { (error, ref) in
                if error != nil {
                    
                    self.makeAlertWithMessage("Ha ocurrido un error al guardar el vehiculo.")
                    
                }else{
                    self.makeAlertWithMessage("Su vehiculo ha sido guardado satisfactoriamente.")
                }
                
            })
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
         ref = Firebase(url: "https://vehicle.firebaseio.com")

        
        if identifierView == "editVehicle" {
            self.title = "Detalle Vehiculo"
            self.placaTextField.text = vehicle.placa
            self.placaTextField.enabled = false
            self.tipo = vehicle.tipo!
            if vehicle.tipo == "Carro"{
                self.botonCarro.selected = true
                self.botonMoto.selected = false
                
            }else{
                self.botonCarro.selected = false
                self.botonMoto.selected = true
            }
            
            
            self.kilometerTextField.text = vehicle.kilometers
            
            self.makeTextField.text = vehicle.make
            self.makeTextField.enabled = false
            
            self.lineaTextField.text = vehicle.linea
            self.lineaTextField.enabled = false
            
            self.modelTextField.text = vehicle.model
            self.modelTextField.enabled = false
            
            self.tankTextField.text = vehicle.tank
            
            self.oilchangeTextField.text = vehicle.oilchange
            
            self.frecuenciaaceiteTextField.text = vehicle.frecuenciaaceite
            
            self.soatTextField.text = vehicle.soat
            
            self.tecnoTextField.text = vehicle.tecno
            
        }else{
            self.title = "Adicionar Vehiculo"
        }

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
        
        let alert = UIAlertController(title: "Sr. usuario", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            
            self.navigationController?.popViewControllerAnimated(true)
            
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

}
