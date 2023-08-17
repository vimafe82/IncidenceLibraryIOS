//
//  User.swift
//  IncidenceApp
//
//  Created by Xavi Nuño on 04/06/2021.
//

import UIKit

class User:Codable {
    var id: Int?
    var alias: String?
    var name: String?
    var phone: String?
    var email: String?
    var identityType: IdentityType?
    var dni: String?
    var birthday: String?
    var checkTerms: Int?
    var checkAdvertising: Int?
}
