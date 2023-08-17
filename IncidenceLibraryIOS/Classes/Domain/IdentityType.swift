//
//  IdentityType.swift
//  IncidenceApp
//
//  Created by Xavi Nuño on 05/06/2021.
//

import UIKit

class IdentityType:Codable {
    
    var id: Int?
    var name: String
    
    init(){
        self.id = nil
        self.name = ""
    }
    
    internal init(id: Int? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
