//
//  maintenanceGarage.swift
//  vehicleMaintenance
//
//  Created by centro docente de computos on 15/04/16.
//  Copyright © 2016 tallerSoftware. All rights reserved.
//

import Foundation


class MaintenanceGarage {
    
    // MARK: - Properties
    var name:String?
    var service:String?
    var contactnumber:String?
    var address:String?
    var city:String?
    
    // MARK: Init
    init(name:String, service:String, contactnumber:String, address:String, city:String){
        self.name = name
        self.service = service
        self.contactnumber = contactnumber
        self.address = address
        self.city = city
    }
    
    convenience init(){
        self.init(name:"", service:"", contactnumber:"", address:"", city:"")
    }
    
    // MARK: Utils
    class func garage() ->[MaintenanceGarage]{
        var data = [MaintenanceGarage]()
        let rawData = [
            ["name":"Auto montaña", "service":"taller especializado en mazda, todos los servicios", "contactnumber":"4480089", "address":"calle 10", "city":"Medellin"],
            ["name":"montallantas", "service":"se parchan neumaticos, se bulcanizan llantas, se infla con helio", "contactnumber":"3517908", "address":"calle 20 barrio antioquia", "city":"Medellin"]
            
        ]
        
        for item in rawData{
            let garage = MaintenanceGarage(name:item["name"]! as String, service:item["service"]! as String, contactnumber: item["contactnumber"]! as String, address: item["address"]! as String, city: item["city"]! as String)
            
            data.append(garage)
        }
        
        return data
    }
    
}
