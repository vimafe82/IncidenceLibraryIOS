//
//  Policy.swift
//  IncidenceApp
//
//  Created by Xavi Nuño on 15/06/2021.
//

import UIKit

class Policy:Codable {

    var id: Int? = nil
    var policyNumber: String? = nil
    var identityType: IdentityType? = nil
    var dni: String? = nil
    var policyStart: String? = nil
    var policyEnd: String? = nil
}
