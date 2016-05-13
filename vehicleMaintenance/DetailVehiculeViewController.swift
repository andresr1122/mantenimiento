//
//  DetailVehiculeViewController.swift
//  vehicleMaintenance
//
//  Created by Christian Orrego on 5/8/16.
//  Copyright © 2016 tallerSoftware. All rights reserved.
//

import Foundation

import UIKit
import Firebase

class DetailVehiculeViewController: UIViewController {
  
    // MARK: - IBOutles
    
    @IBOutlet weak var placaLabel: UILabel!
    @IBOutlet weak var tipoLabel: UILabel!
    @IBOutlet weak var kilometrajeLabel: UILabel!
    @IBOutlet weak var marcaLabel: UILabel!
    @IBOutlet weak var lineaLabel: UILabel!
    @IBOutlet weak var modeloLabel: UILabel!
    @IBOutlet weak var capacidadtanqueLabel: UILabel!
    @IBOutlet weak var cambioaceiteLabel: UILabel!
    @IBOutlet weak var frecuenciaLabel: UILabel!
    @IBOutlet weak var tecnoLabel: UILabel!
    @IBOutlet weak var soatLabel: UILabel!
    
    // MARK: - IBAction
    
    @IBAction func editButon(sender: AnyObject) {
        
    }
    
    
    var modelo = Vehicle()
    var ref: Firebase?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        ref = Firebase(url: "https://vehicle.firebaseio.com")
        
        self.modeloLabel.text = "\(self.modelo.model!)"
        self.marcaLabel.text = "\(self.modelo.make!)"
        self.kilometrajeLabel.text = "\(self.modelo.kilometers!)"
        self.cambioaceiteLabel.text = "\(self.modelo.oilchange!)"
        self.capacidadtanqueLabel.text = "\(self.modelo.tank!)"
        self.tecnoLabel.text = "\(self.modelo.tecno!)"
        self.soatLabel.text = "\(self.modelo.soat!)"
        self.placaLabel.text = "\(self.modelo.placa!)"
        self.tipoLabel.text = "\(self.modelo.tipo!)"
        self.lineaLabel.text = "\(self.modelo.linea!)"
        self.frecuenciaLabel.text = "\(self.modelo.frecuenciaaceite!)"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let destionationVC = segue.destinationViewController as? VehicleViewController {
            
            if segue.identifier == "editVehicle" {
                destionationVC.vehicle = modelo
                destionationVC.identifierView = "editVehicle"
            }else{
                destionationVC.identifierView = "addVehicle"
            }
            
        }
        
    }

    
}

