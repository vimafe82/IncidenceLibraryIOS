//
//  Vehicle.swift
//  IncidenceApp
//
//  Created by Carles Garcia Puigardeu on 11/5/21.
//

import Foundation

public class Vehicle:Codable {
    
    var id: Int?
    var licensePlate: String?
    var registrationYear: Int?
    var brand: String?
    var model: String?
    var vehicleType:VehicleType?
    var color:ColorType?
    var policy: Policy?
    var insurance: Insurance?
    var beacon: Beacon?
    var incidences: [Incidence]?
    var drivers: [Driver]?
    
    //vehiculo ya creado
    var image:String?
    
    init()
    {
    }
    
    init(_ v:Vehicle)
    {
        self.id = v.id
        self.licensePlate = v.licensePlate
        self.registrationYear = v.registrationYear
        self.brand = v.brand
        self.model = v.model
        self.vehicleType = v.vehicleType
        self.color = v.color
        self.policy = v.policy
        self.insurance = v.insurance
        self.beacon = v.beacon
        self.incidences = v.incidences
        self.drivers = v.drivers
        self.image = v.image
    }

    func getName() -> String
    {
        return (brand ?? "") + " " + (model ?? "")
    }
    
    func hasIncidencesActive() -> Bool
    {
        var res = false
        
        if (incidences != nil)
        {
            for incidence in incidences! {
                if (!incidence.isClosed() && !incidence.isCanceled()) {
                    res = true
                    break
                }
            }
        }
        
        return res
    }
    
    func hasPolicyIncompleted() -> Bool
    {
        var res = true
        
        if (insurance != nil && insurance?.name != nil)
        {
            if (policy != nil && policy?.policyNumber != nil && policy?.dni != nil && policy?.policyEnd != nil)
            {
                res = false
            }
        }
        
        return res
    }
    
    func formattedLicencePlate() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        formatter.locale = Locale.current
        let string = licensePlate?.separate(every: 1, with: " ")
        
        return string.map( { if let value = Int($0) {
            return formatter.string(from: NSNumber(integerLiteral: value))!
        }
            return $0
        })
    }
}

