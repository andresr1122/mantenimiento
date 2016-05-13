//
//  Vehicle.swift
//  vehicleMaintenance
//
//  Created by centro docente de computos on 4/15/16.
//  Copyright © 2016 tallerSoftware. All rights reserved.
//

import Foundation
import Firebase

class Vehicle {
    
    // MARK: - Properties
    var id:String?
    var model:String?
    var make:String?
    var kilometers:String?
    var oilchange:String?
    var tank:String?
    var soat:String?
    var tecno:String?
    
    var placa:String?
    var tipo:String?
    var linea:String?
    var frecuenciaaceite:String?
    
    
    // MARK: Init
    init(id:String,model:String, make:String, kilometers:String, oilchange:String, tank:String, soat:String, tecno:String, placa:String, tipo:String, linea:String, frecuenciaaceite:String){
        self.id  = id
        self.model = model
        self.make = make
        self.kilometers = kilometers
        self.oilchange = oilchange
        self.tank = tank
        self.soat = soat
        self.tecno = tecno
        self.placa = placa
        self.tipo = tipo
        self.linea = linea
        self.frecuenciaaceite = frecuenciaaceite
        
    }

    convenience init(){
        self.init(id:"",model:"", make:"",kilometers:"", oilchange:"", tank:"", soat:"", tecno:"", placa:"", tipo:"",linea:"", frecuenciaaceite:"")
    }
    
    
    convenience init(snapshot:FDataSnapshot){
        self.init(id:snapshot.key,
            model:snapshot.value["model"] as! String,
            make:snapshot.value["make"] as! String,
            kilometers:snapshot.value["kilometers"] as! String,
            oilchange:snapshot.value["oilchange"] as! String,
            tank:snapshot.value["tank"] as! String,
            soat:snapshot.value["soat"] as! String,
            tecno:snapshot.value["tecno"] as! String,
            placa:snapshot.value["placa"] as! String,
            tipo:snapshot.value["tipo"] as! String,
            linea:snapshot.value["linea"] as! String,
            frecuenciaaceite:snapshot.value["frecuenciaaceite"] as! String)
    }
    
    
    func toDictionary() -> Dictionary<String,String> {
        return [
            "model":model!,
            "make":make!,
            "kilometers":kilometers!,
            "oilchange":oilchange!,
            "tank":tank!,
            "soat":soat!,
            "tecno":tecno!,
            "placa":placa!,
            "tipo":tipo!,
            "linea":linea!,
            "frecuenciaaceite":frecuenciaaceite!
        ]
    }
    
    
//     // MARK: Utils
//    class func vehicles() ->[Vehicle]{
//        var data = [Vehicle]()
//        let rawData = [
//            ["model":"Model 1", "make":"Make 1", "kilometers":"Kilometers 1", "oilchange": "Oil 1", "tank":"tank 1","soat":"Soat 1","tecno":"tecno 1"],
//            ["model":"Model 2", "make":"Make 2", "kilometers":"Kilometers 2", "oilchange": "Oil 2", "tank":"tank 2","soat":"Soat 2","tecno":"tecno 2"]
//
//        ]
//        
//        for item in rawData{
//            let vehicle = Vehicle(id:"0",model: item["model"]!, make: item["make"]!, kilometers: item["kilometers"]!, oilchange: item["oilchange"]!,tank: item["tank"]!, soat: item["soat"]!, tecno: item["tecno"]!)
//            
//            data.append(vehicle)
//        }
//        
//        return data
//    }
    
    
    
}
