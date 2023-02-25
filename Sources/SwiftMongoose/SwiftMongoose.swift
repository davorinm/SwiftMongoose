import Foundation
import Mongoose

public class SwiftMongoose {
    // Event manager
    private var mgr: mg_mgr = mg_mgr()
    
    // HTTP port
    private let s_http_addr = "http://localhost:8000"
    
    private let fn: mg_event_handler_t = { (a: UnsafeMutablePointer<mg_connection>?, b: Int32, c: UnsafeMutableRawPointer?, d: UnsafeMutableRawPointer?) in
        
    }
    
    /// Initializer
    public init() {
        // Set to 3 to enable debug
        mg_log_set(Int32(MG_LL_INFO));
        
        // Initialise event manager
        mg_mgr_init(&mgr);
    }
    
    deinit {
        mg_mgr_free(&mgr);
    }
    
    public func start() {
        // Create HTTP listener
        mg_http_listen(&mgr, s_http_addr, fn, nil)
        
        // Infinite event loop
        while(true) {
            mg_mgr_poll(&mgr, 1000);
        }
    }
    
    private func fn3(_ c: UnsafeMutablePointer<mg_connection>?, _ ev: Int32, _ ev_data: UnsafeMutableRawPointer?, _ fn_data: UnsafeMutableRawPointer?) {
        
    }
}
