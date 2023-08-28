
@objc public final class IncidenceLibraryManager: NSObject {
    
    public static let shared = IncidenceLibraryManager()
    
    // MARK: -

    private static var config: IncidenceLibraryConfig?
    
    let apiKey: String
    let env: Environment

    public class func setup(_ config: IncidenceLibraryConfig){
        IncidenceLibraryManager.config = config
        
        shared.setConnectionInfoAndConnect();
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
    
    private func setConnectionInfoAndConnect(
        completionCall: ((Error?) -> Void)? = nil
    ) {
        Api.shared.validateApiKey(apiKey: apiKey, completion: { result in
            
            print("IncidenceLibraryManager setConnectionInfoAndConnect finish")
            
            if (result.isSuccess())
            {
                
            }
            else
            {
                //self.onBadResponse(result: result)
                if (result.message != nil)
                {
                    print(result.message)
                }
            }
       })
    }
}
