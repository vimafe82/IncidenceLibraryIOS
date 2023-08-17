//
//  DeviceDetailViewController.swift
//  IncidenceApp
//
//  Created by Carles Garcia Puigardeu on 11/5/21.
//

import UIKit

class DeviceDetailViewController: IABaseViewController, StoryboardInstantiable {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameTextFieldView: FieldView!
    @IBOutlet weak var modelTextFieldView: FieldView!
    @IBOutlet weak var linkedVehicleTextFieldView: FieldView!
    @IBOutlet weak var deleteDeviceButton: MenuView!
    @IBOutlet weak var addCarButton: MenuView!
    @IBOutlet weak var validateDeviceButton: MenuView!
    
    var contentInsetPreKeyboardDisplay: UIEdgeInsets?
    var bottomSheetController: BottomSheetViewController?
    
    static var storyboardFileName = "DevicesScene"
    private var viewModel: DeviceDetailViewModel! { get { return baseViewModel as? DeviceDetailViewModel }}
    
    private var isPrincipal = false

    
    // MARK: - Lifecycle
    static func create(with viewModel: DeviceDetailViewModel) -> DeviceDetailViewController {
        let view = DeviceDetailViewController.instantiateViewController()
        view.baseViewModel = viewModel
        
        //cogemos el vehicle de getVehicles porque ahí si informa los drivers
        if let ve = viewModel.device.vehicle, let veId = ve.id {
            let vehicle = Core.shared.getVehicle(idVehicle: veId)
            if (Core.shared.isUserPrimaryForVehicle(vehicle)) {
                view.isPrincipal = true
            }
        }
        
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EventNotification.addObserver(self, code: .BEACON_UPDATED, selector: #selector(beaconUpdated))
    }
    
    override func setUpUI() {
        super.setUpUI()
        
        if (self.isPrincipal) {
            deleteDeviceButton.configure(text: viewModel.deleteButtonText, color: .red)
            deleteDeviceButton.onTap { [weak self] in
                self?.configureBottomSheet()
                guard let vc = self?.bottomSheetController else { return }
                self?.navigationController?.present(vc, animated: true)
            }
        }
        else {
            deleteDeviceButton.isHidden = true
        }
        
        
        addCarButton.configure(text: viewModel.addButtonText)
        addCarButton.isHidden = viewModel.device.vehicle != nil
        addCarButton.onTap { [weak self] in
            let vm = RegistrationPlateViewModel(origin: .add)
            let viewController = RegistrationPlateViewController.create(with: vm)
            self?.navigationController?.pushViewController(viewController, animated: true)
        }
        if (addCarButton.isHidden) {
            addCarButton.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }
        
        validateDeviceButton.configure(text: viewModel.validateDeviceButtonText)
        validateDeviceButton.isHidden = viewModel.device.beaconType?.id != 2
        validateDeviceButton.onTap { [weak self] in
            if let beacon = self?.viewModel {
                let vc = DeviceDetailInfoViewController.create(with: beacon)
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        setUpNavigation()
    }
    
    override func loadData() {
        nameTextFieldView.configure(titleText: viewModel.fieldNameTitle, valueText: viewModel.device.name ?? "-")
        modelTextFieldView.configure(titleText: viewModel.fieldModelTitle, valueText: viewModel.device.beaconType?.name ?? "")
        linkedVehicleTextFieldView.configure(titleText: viewModel.fieldLinkedVehicleTitle, valueText: viewModel.device.vehicle?.getName() ?? "-")
    }
    
    private func configureBottomSheet() {
        let view = ButtonsBottomSheetView()

        let name = viewModel.device.vehicle != nil ? viewModel.device.vehicle?.getName() ?? "" : ""
        let title = viewModel.device.vehicle != nil ? String(format: "delete_device_vinculated_message".localized(), viewModel.device.name ?? "") : String(format: "delete_device_message".localized(), name)
        view.configure(delegate: self, title:nil, desc: title, firstButtonText: "cancel".localized(), secondButtonText: "delete".localized(), identifier: nil)
        
        let controller = BottomSheetViewController(contentView: view)
        controller.sheetCornerRadius = 16
        controller.sheetSizingStyle = .adaptive
        controller.handleStyle = .inside
        controller.contentInsets = UIEdgeInsets(top: 44, left: 24, bottom: 24, right: 24)
        bottomSheetController = controller
    }
    
    private func setUpNavigation() {
        
        if (self.isPrincipal) {
            let editButton = UIBarButtonItem(image: UIImage(named: "icon_edit")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(editPressed))
            editButton.imageInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 4)
            navigationItem.rightBarButtonItem = editButton
        }
        else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    @objc func editPressed() {
        let vm = DeviceEditNameViewModel(device: viewModel.device)
        let vc = DeviceEditViewController.create(with: vm)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func beaconUpdated(_ notification: Notification) {
        if let beacon = notification.object as? Beacon {
            viewModel.device = beacon
            loadData()
        }
    }
}

extension DeviceDetailViewController: ButtonsBottomSheetDelegate {
    func firstButtonPressed(identifier: Any?) {
        bottomSheetController?.dismiss(animated: true, completion: nil)
    }
    
    func secondButtonPressed(identifier: Any?) {
        bottomSheetController?.dismiss(animated: true, completion: {
            
            self.showHUD()
            Api.shared.deleteBeacon(beacon: self.viewModel.device, completion: { result in
                self.hideHUD()
                if (result.isSuccess())
                {
                    //cogemos el vehicle de getVehicles porque ahí si informa los drivers
                    if let ve = self.viewModel.device.vehicle, let veId = ve.id {
                        if let vehicle = Core.shared.getVehicle(idVehicle: veId){
                            vehicle.beacon = nil
                            Core.shared.saveVehicle(vehicle: vehicle)
                            EventNotification.post(code: .VEHICLE_UPDATED, object: vehicle)
                        }
                    }
                    
                    EventNotification.post(code: .BEACON_DELETED, object: self.viewModel.device)
                    self.navigationController?.popViewController(animated: true)
                }
                else
                {
                    self.onBadResponse(result: result)
                }
           })
            
            
            
        })
    }
}
