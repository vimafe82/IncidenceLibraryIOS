
@objc public final class IncidenceLibraryManager: NSObject {
    
    //public static let shared = IncidenceLibraryManager()
    public static var shared: IncidenceLibraryManager!
    
    // MARK: -

    private var config: IncidenceLibraryConfig?
    
    let apiKey: String
    private let env: Environment
    
    private var validApiKey: Bool? = nil
    private var screens: [String] = [String]()

    public class func setup(_ config: IncidenceLibraryConfig) {
        //IncidenceLibraryManager.config = config
        //shared.config = config
        //shared.validateApiKey();
        
        IncidenceLibraryManager.shared = IncidenceLibraryManager(config: config)
        Api.shared.setup(env: config.env);
        shared.initFonts()
        shared.validateApiKey();
    }
    
    func initFonts() {
        for family: String in UIFont.familyNames {
            print("%@", family)
            for name: String in UIFont.fontNames(forFamilyName: family) {
                print("  %@", name)
            }
        }
        
        
        do {
            try IncidenceLibraryManager.shared.fontsURLs().forEach({ try IncidenceLibraryManager.shared.register(from: $0) })
        } catch {
            print(error)
        }
    }
    
    func register(from url: URL) throws {
            guard let fontDataProvider = CGDataProvider(url: url as CFURL) else {
                //throw SVError.internal("Could not create font data provider for \(url).")
                fatalError("Could not create font data provider for \(url).")
            }
            let font = CGFont(fontDataProvider)!
            var error: Unmanaged<CFError>?
            guard CTFontManagerRegisterGraphicsFont(font, &error) else {
                throw error!.takeUnretainedValue()
            }
        }
    
    func fontsURLs() -> [URL] {
        let bundle = Bundle(for: IncidenceLibraryManager.self)
        let fileNames = ["Silka-Regular", "Silka-Thin", "Silka-Bold", "Silka-Medium", "Silka-SemiBold"]
        return fileNames.map({ bundle.url(forResource: $0, withExtension: "otf")! })
    }
    
    // Initialization

    private init(config: IncidenceLibraryConfig) {
        //guard config != nil else {
        //    fatalError("Error - you must call setup before accessing MySingleton.shared")
        //}
        
        self.config = config
        self.apiKey = config.apiKey.apiKeyString
        self.env = config.env
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
                
                self.screens = result.getList(key: "functionalities") ?? [String]()
                self.screens.append(Constants.SCREEN_DEVICE_CREATE)
                
                Core.shared.registerDevice()
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
    
    public func getDeviceCreateViewController() -> IABaseViewController {
        let res = validateScreen(screen: Constants.SCREEN_DEVICE_CREATE)
        if (res == "SCREEN_OK") {
            let vm = RegistrationBeaconViewModel(origin: .addBeacon)
            vm.fromBeacon = true
            let viewController = RegistrationBeaconSelectTypeViewController.create(with: vm)
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
