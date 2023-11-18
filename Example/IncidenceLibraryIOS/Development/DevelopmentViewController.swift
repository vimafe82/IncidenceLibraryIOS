//
//  ViewController.swift
//  IncidenceApp
//
//  Created by Carles Garcia Puigardeu on 5/5/21.
//

import UIKit
import IncidenceLibraryIOS

class DevelopmentViewController: UIViewController, StoryboardInstantiable {
    
    static var storyboardFileName = "DevelopmentScene"
    
    var dniIdentityType: IdentityType!
    var vehicleType: VehicleType!
    var color: ColorType!
    var policy: Policy!
    var user: User!
    var vehicle: Vehicle!
    var incidenceType: IncidenceType!
    var incidence: Incidence!    
    
    static func create() -> DevelopmentViewController {
        print("DevelopmentViewController create")
        
        let view = DevelopmentViewController.instantiateViewController()
        //view.baseViewModel = DevelopmentViewModel()
        return view
    }
    
    override func viewDidLoad() {
        print("DevelopmentViewController viewDidLoad")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dniIdentityType = IdentityType();
        dniIdentityType.name = "dni"; // (tipo de documento de identidad: dni, nie, cif)

        vehicleType = VehicleType();
        vehicleType.name = "Coche";

        color = ColorType();
        color.name = "Rojo";

        policy = Policy();
        policy.policyNumber = "222222222"; // (número de la póliza)
        policy.policyEnd = "2024-10-09"; // (fecha caducidad de la póliza)
        policy.identityType = dniIdentityType; // (tipo de documento identidad del asegurador)
        policy.dni = "22222222T"; // (documento de identidad del asegurador)

        user = User();
        user.externalUserId = "10002"; // (identificador externo del usuario)
        user.name = "Nombre TEST"; // (nombre del usuario)
        user.phone = "600010002"; // (teléfono)
        user.email = "sdkm2@tridenia.com"; // (e-mail)
        user.identityType = dniIdentityType;
        user.dni = "22222222T"; // (número del documento de identidad)
        user.birthday = "1979-09-29"; // (fecha de Nacimiento)
        user.checkTerms = 1; // (aceptación de la privacidad)

        vehicle = Vehicle();
        vehicle.externalVehicleId = "11002";
        vehicle.licensePlate = "2222XXX"; // (matrícula del vehículo)
        vehicle.registrationYear = 2022; // (fecha de matriculación)
        vehicle.vehicleType = vehicleType; // (tipo del vehículo)
        vehicle.brand = "Seat"; // (marca del vehículo)
        vehicle.model = "Laguna"; // (modelo del vehículo)
        vehicle.color = color; // (color del vehículo)
        vehicle.policy = policy;

        incidenceType = IncidenceType();
        //incidenceType.id = 5; // Pinchazo
        incidenceType.externalId = "B10"; // Pinchazo

        incidence = Incidence();
        incidence.incidenceType = incidenceType;
        incidence.street = "Carrer Major, 2";
        incidence.city = "Barcelona";
        incidence.country = "España";
        incidence.latitude = 41.4435945;
        incidence.longitude = 2.2319534;
        incidence.externalIncidenceId = "12002";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func deviceCreatePressed(_ sender: Any) {
        let viewController = IncidenceLibraryManager.shared.getDeviceCreateViewController(user: user, vehicle: vehicle)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func deviceListPressed(_ sender: Any) {
        let viewController = IncidenceLibraryManager.shared.getDeviceListViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func incidenceCreatePressed(_ sender: Any) {
        let viewController = IncidenceLibraryManager.shared.getIncidenceCreateViewController(user: user, vehicle: vehicle, incidence: incidence)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func incidenceClosePressed(_ sender: Any) {
        let viewController = IncidenceLibraryManager.shared.getIncidenceCloseViewController(user: user, vehicle: vehicle, incidence: incidence)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func ecommercePressed(_ sender: Any) {
        let viewController = IncidenceLibraryManager.shared.getEcommerceViewController(user: user, vehicle: vehicle)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
