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
  
    @IBOutlet weak var modelLabel: UILabel!
    
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var kilometerLabel: UILabel!
    
    @IBOutlet weak var oilchangeLable: UILabel!
    @IBOutlet weak var tankLabel: UILabel!
    @IBOutlet weak var tecnoLabel: UILabel!
    
    @IBOutlet weak var soatLabel: UILabel!
    
    var modelo = Vehicle()
    var ref: Firebase?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        ref = Firebase(url: "https://vehicle.firebaseio.com")
        
        self.modelLabel.text = "\(self.modelo.model!)"
        self.makeLabel.text = "\(self.modelo.make!)"
        self.kilometerLabel.text = "\(self.modelo.kilometers!)"
        self.oilchangeLable.text = "\(self.modelo.oilchange!)"
        self.tankLabel.text = "\(self.modelo.tank!)"
        self.tecnoLabel.text = "\(self.modelo.tecno!)"
        self.soatLabel.text = "\(self.modelo.soat!)"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

