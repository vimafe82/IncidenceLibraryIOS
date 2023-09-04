//
//  AppDelegate.swift
//  ios-base
//
//  Created by Rootstrap on 15/2/16.
//  Copyright © 2016 Rootstrap Inc. All rights reserved.
//

import UIKit
import IncidenceLibraryIOS

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  static let shared: AppDelegate = {
    guard let appD = UIApplication.shared.delegate as? AppDelegate else {
      return AppDelegate()
    }
    return appD
  }()

  var window: UIWindow?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
      //let rootVC = AppNavigator.shared.rootViewController
      
      let config = IncidenceLibraryConfig(apiKey: .init("mapfre"))
      IncidenceLibraryManager.setup(config)
      IncidenceLibraryManager.shared.printStatusConfig()
      
      let firstViewController = DevelopmentViewController.create()
      let rootVC = UINavigationController(rootViewController: firstViewController)
      rootVC.isNavigationBarHidden = true
      
      window?.rootViewController = rootVC

      return true
  }
}
