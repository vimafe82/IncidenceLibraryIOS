//
//  RegistrationInsuranceViewModel.swift
//  IncidenceApp
//
//  Created by Carles Garcia Puigardeu on 30/4/21.
//

import UIKit

class RegistrationInsuranceViewModel: IABaseViewModel {
    
    public override var navigationTitle: String? {
        get { return "create_account_step2".localized() }
        set { }
    }
    
    public var origin: RegistrationOrigin
    
    internal init(origin: RegistrationOrigin = .registration) {
        self.origin = origin
    }
    
    lazy var searchFieldText: String = {
        return "search_insurance".localized()
    }()
    
    lazy var newInsuranceLabelText: String = {
        return "insurance_not_found_desc".localized()
    }()
    
    lazy var newInsuranceFieldTitleView: String = {
        return "new_insurance".localized()
    }()
    
    lazy var newInsuranceButtonText: String = {
        return "add_insurance".localized()
    }()
    
    lazy var highlightInsurances: [Insurance] = {
        /*return [Insurance(name: "Axa", image: UIImage(named: "Name=AXA")),
                Insurance(name: "Mapfre", image: UIImage(named: "Name=Mapfre")),
                Insurance(name: "Verti", image: UIImage(named: "Name=Verti")),
                Insurance(name: "Mutua Madrileña", image: UIImage(named: "Name=MutuaMadrilena")),
        ]*/
        return [Insurance]()
    }()
    
    lazy var insurances: [Insurance] = {
        /*
        return [Insurance(name: "Direct Seguros", image: UIImage(named: "Name=DirectSeguros")),
                Insurance(name: "Liberty Seguros", image: UIImage(named: "Name=Liberty Seguros")),
                Insurance(name: "Reale", image: UIImage(named: "Name=Reale")),
        ]*/
        return [Insurance]()
    }()
    
    lazy var allInsurances: [Insurance] = {
        var array: [Insurance] = []
        array.append(contentsOf: highlightInsurances)
        array.append(contentsOf: insurances)
        
        return array
    }()

    var filteredInsurances: [Insurance] = []
    
    public var selectedInsurance: Insurance? = nil
    public var vehicle:Vehicle?
}
