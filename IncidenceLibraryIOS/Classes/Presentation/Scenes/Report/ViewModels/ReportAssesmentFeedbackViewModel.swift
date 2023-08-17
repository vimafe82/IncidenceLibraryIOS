//
//  ReportAssesmentFeedbackViewModel.swift
//  IncidenceApp
//
//  Created by Carles Garcia Puigardeu on 2/6/21.
//

import Foundation

class ReportAssesmentFeedbackViewModel: IABaseViewModel {
    
    var incidence: Incidence
    var answers: [Int]?
    var customAnswer:String?
    
    init(incidence: Incidence, answers:[Int]?, customAnswer:String?) {
        self.incidence = incidence
        self.answers = answers
        self.customAnswer = customAnswer
    }
    
    public override var navigationTitle: String? {
        get { return "service_valoration".localized() }
        set { }
    }

    let descriptionText: String = "ask_valoration_comment".localized()
    let placeholderText: String = "write_comment".localized()
    let continueText: String = "send_valoration".localized()
}

