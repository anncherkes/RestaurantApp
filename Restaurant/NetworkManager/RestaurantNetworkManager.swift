//
//  RestaurantNetworkManager.swift
//  Restaurant
//
//  Created by Anna Cherkes on 5/18/19.
//  Copyright © 2019 AnnaCherkes. All rights reserved.
//

import UIKit

public protocol RestaurantNetworkManagerProtocol {
    func loadRestaurants(completion: @escaping ([RestaurantDTO]?, NSError?) -> Void)
}

public class RestaurantNetworkManager: NetworkService, RestaurantNetworkManagerProtocol {
    
    public func loadRestaurants(completion: @escaping ([RestaurantDTO]?, NSError?) -> Void) {
        
        let url = BASE_URL + "gonchs/b657e6043e17482cae77a633d78f8e83/raw/7654c0db94a3f430888fac0caac675c7e811030a/test_data.json"
        
        requestManager.request(url: url, method: .get) { (response: [RestaurantDTO]?, error: NSError?) in
            completion(response,error)
        }
    }
}
