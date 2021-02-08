//
//  NetworkReachabilityManager.swift
//  WeasyVendor
//
//  Created by Sherif on 08/02/2021.
//  Copyright © 2021 Amal Elgalant. All rights reserved.
//

import Foundation
import Alamofire

class ReachabilityManager {
    
    // MARK: - singletone
    static let shared = ReachabilityManager()
    let reachabilityManager = Alamofire.NetworkReachabilityManager()
    
    func isConnected() -> Bool{
        guard let reachabilityManager = reachabilityManager else {return false}
        return reachabilityManager.isReachable
    }
}
