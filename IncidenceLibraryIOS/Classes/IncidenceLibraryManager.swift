
@objc public final class IncidenceLibraryManager: NSObject {
    
    public static let shared = IncidenceLibraryManager()
    
    // MARK: -

    private static var config: IncidenceLibraryConfig?
    
    private let apiKey: String
    private let env: Environment
    
    private var validApiKey: Bool? = nil
    private var screens: [String] = [String]()

    public class func setup(_ config: IncidenceLibraryConfig) {
        IncidenceLibraryManager.config = config
        
        shared.validateApiKey();
    }
    
    // Initialization

    private override init() {
        guard let config = IncidenceLibraryManager.config else {
            fatalError("Error - you must call setup before accessing MySingleton.shared")
        }
        
        apiKey = config.apiKey.apiKeyString
        env = config.env
    }
    
    public func printStatusConfig() {
        log.error("Config ok " + String(describing: env))
    }
    
    private func validateApiKey(
        completionCall: ((Error?) -> Void)? = nil
    ) {
        Api.shared.validateApiKey(apiKey: apiKey, completion: { result in
            
            print("IncidenceLibraryManager setConnectionInfoAndConnect finish")
            
            if (result.isSuccess())
            {
                self.validApiKey = true
                
                self.screens.append("SCREEN1")
                self.screens.append("SCREEN2")
            }
            else
            {
                self.validApiKey = false
                
                //self.onBadResponse(result: result)
                if (result.message != nil)
                {
                    print(result.message)
                }
            }
       })
    }
    
    func validateScreen(screen: String) -> String {
        if (validApiKey == nil) {
            return "CALLIG_VALIDATE_API_KEY"
        } else if (validApiKey == false) {
            return "NO_VALID_API_KEY"
        } else if (self.screens.contains(screen)) {
            return "SCREEN_OK"
        } else {
            return "SCREEN_KO"
        }
    }
    
    public func getDeviceListViewController() -> IABaseViewController {
        let res = validateScreen(screen: DeviceListViewController.storyboardFileName)
        if (res == "SCREEN_OK") {
            let viewModel = DeviceListViewModel()
            let viewController = DeviceListViewController.create(with: viewModel)
            return viewController
        } else {
            return processScreenError(error: res)
        }
    }
    
    func processScreenError(error: String) -> IABaseViewController {
        /*
        if (error == "NO_VALID_API_KEY") {
            let viewController = ErrorViewController.create()
            return viewController
        }
         */
        let viewModel = ErrorViewModel(error: error)
        let viewController = ErrorViewController.create(with: viewModel)
        return viewController
    }
}
