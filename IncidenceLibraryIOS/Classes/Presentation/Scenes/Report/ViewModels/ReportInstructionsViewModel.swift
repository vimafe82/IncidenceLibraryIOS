//
//  ReportInstructionsViewModel.swift
//  IncidenceApp
//
//  Created by Carles Garcia Puigardeu on 31/5/21.
//

import UIKit

class ReportInstructionsViewModel: IABaseViewModel {
    
    var vehicle:Vehicle?
    var incidenceTypeId:Int?
    var openFromNotification:Bool = false
    
    init(vehicle: Vehicle?, incidenceTypeId:Int?, openFromNotification:Bool) {
        self.vehicle = vehicle
        self.incidenceTypeId = incidenceTypeId
        self.openFromNotification = openFromNotification
    }
    
    public override var navigationTitle: String? {
        get { return "report_incidence".localized() }
        set { }
    }

    let descriptionText: String = "calling_grua_tip".localized()
    
    let balizaImage = UIImage(named: "Type=Yes")?.withRenderingMode(.alwaysTemplate)
    let balizaText = "incidence_tip_beacon".localized()
    
    let lightImage = UIImage(named: "Light")?.withRenderingMode(.alwaysTemplate)
    let lightText = "incidence_tip_lights".localized()
    
    let chalecoImage = UIImage(named: "Chaleco")?.withRenderingMode(.alwaysTemplate)
    let chalecoText = "incidence_tip_vest".localized()
    
    let outImage = UIImage(named: "Property")?.withRenderingMode(.alwaysTemplate)
    let outText = "incidence_tip_exit_car".localized()
    
    let acceptButtonText: String = "accept".localized()
    let cancelButtonText: String = "cancel".localized()
    
    
}
