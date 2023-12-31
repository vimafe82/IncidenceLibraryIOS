//
//  DeviceDetailViewModel.swift
//  IncidenceApp
//
//  Created by Carles Garcia Puigardeu on 11/5/21.
//

import Foundation

class DeviceDetailViewModel: IABaseViewModel {
    
    public override var navigationTitle: String? {
        get { return useName ? device.name : "beacon".localized() }
        set { }
    }
    
    public var device: Beacon
    var useName: Bool
    
    public init(device: Beacon, useName: Bool) {
        self.device = device
        self.useName = useName
    }
    
    var fieldNameTitle: String = "name".localized()
    var fieldModelTitle: String = "model".localized()
    var fieldLinkedVehicleTitle: String = "link_with".localized()
    var deleteButtonText: String = "delete_device".localized()
    var addButtonText: String = "link_with_vehicle".localized()
    var validateDeviceButtonText: String = "validate_device".localized()
    
}

