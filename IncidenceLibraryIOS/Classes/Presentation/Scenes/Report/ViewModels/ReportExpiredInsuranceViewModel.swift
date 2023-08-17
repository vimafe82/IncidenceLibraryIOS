//
//  ReportExpiredInsuranceViewModel.swift
//  IncidenceApp
//
//  Created by Carles Garcia Puigardeu on 3/6/21.
//

import UIKit

class ReportExpiredInsuranceViewModel: IABaseViewModel {
    public override var navigationTitle: String? {
        get { return "report_incidence".localized() }
        set { }
    }

    let titleText: String = "policy_expired".localized()
    let descriptionText: String = "policy_expired_desc".localized()

    let lightImage = UIImage(named: "Light")?.withRenderingMode(.alwaysTemplate)
    let lightText = "incidence_tip_lights".localized()
    
    let chalecoImage = UIImage(named: "Chaleco")?.withRenderingMode(.alwaysTemplate)
    let chalecoText = "incidence_tip_vest".localized()
    
    let outImage = UIImage(named: "Property")?.withRenderingMode(.alwaysTemplate)
    let outText = "incidence_tip_exit_car".localized()
    
    let acceptButtonText: String = "policy_update".localized()
}
