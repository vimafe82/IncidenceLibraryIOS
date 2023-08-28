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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func assesmentPressed(_ sender: Any) {
        //let vm = ReportAssesmentViewModel()
        //let viewController = ReportAssesmentViewController.create(with: vm)
        //navigationController?.setViewControllers([viewController], animated: false)
    }
    
    @IBAction func accountPressed(_ sender: Any) {
        let vm = AccountViewModel()
        let viewController = AccountViewController.create(with: vm)
        //navigationController?.setViewControllers([viewController], animated: false)
        
        
        
        //self.navigationController?.pushViewController(viewController, animated: true)
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func inicioSesionPressed(_ sender: Any) {
        //let viewModel = RegistrationStepsViewModel(completedSteps: [], origin: .registration)
        //let viewController = RegistrationStepsViewController.create(with: viewModel)
       
        //navigationController?.setViewControllers([viewController], animated: false)
    }
    
    @IBAction func addPressed(_ sender: Any) {
        //let viewModel = AddSelectionViewModel()
        //let viewController = AddSelectionViewController.create(with: viewModel)
       
        //navigationController?.setViewControllers([viewController], animated: false)
        
    }
    
    @IBAction func devicesPressed(_ sender: Any) {
        let viewModel = DeviceListViewModel()
        let viewController = DeviceListViewController.create(with: viewModel)
       
        //navigationController?.setViewControllers([viewController], animated: true)
        //self.present(viewController, animated: true, completion: nil)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func incidencesPressed(_ sender: Any) {
        //let viewModel = IncidencesCarsListViewModel()
        //let viewController = IncidencesCarsListViewController.create(with: viewModel)
       
        //navigationController?.setViewControllers([viewController], animated: false)
    }
    
    @IBAction func vehiculosPressed(_ sender: Any) {
        //let viewModel = VehiclesListViewModel()
        //let viewController = VehiclesListViewController.create(with: viewModel)
       
        //navigationController?.setViewControllers([viewController], animated: false)
    }
    
    @IBAction func homePressed(_ sender: Any) {
        //let viewModel = HomeViewModel()
        //let viewController = HomeViewController.create(with: viewModel)
       
        //navigationController?.setViewControllers([viewController], animated: false)
    }
}
