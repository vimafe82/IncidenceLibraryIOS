//
//  APIEndpoints.swift
//  IncidenceApp
//
//  Created by Xavi Nuño on 10/05/2021.
//

import Foundation
//import E510_Networking

struct APIEndpoints {
    #if PRO
        static let API_BASE_URL = "https://api-pro.incidence.eu"
    #elseif PRE
        static let API_BASE_URL = "https://api-pre.incidence.eu"
    #else
        static let API_BASE_URL = "https://api-test.incidence.eu"
    #endif
    /*
    
    static func basicHeaders() -> [String: String] {
        var headers:[String: String] = [:]
        
        headers["deviceId"] = UIDevice.current.identifierForVendor?.uuidString
        headers["lang"] = Locale.current.languageCode
        
        return headers
    }

    static func signIn(parameters: [String: Any?]) -> Endpoint<IResponse> {
        return Endpoint(path: "users/login",
                        method: .post,
                        headerParamaters: basicHeaders(),
                        bodyParamaters: parameters,
                        serviceType: .miniApps(token: false))
    }
    */
}
