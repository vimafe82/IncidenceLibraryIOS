//
//  ReportIDKViewModel.swift
//  IncidenceApp
//
//  Created by Carles Garcia Puigardeu on 3/6/21.
//

import UIKit

class ReportIDKViewModel: IABaseViewModel {
    public override var navigationTitle: String? {
        get { return "report_incidence".localized() }
        set { }
    }

    let insuranceImage: UIImage? = UIImage(named: "Name=AXA")
    let descriptionText: String = "your_insurance_contact_you".localized()
    
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
