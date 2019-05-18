//
//  RestaurantDataManager.swift
//  Restaurant
//
//  Created by Anna Cherkes on 5/18/19.
//  Copyright © 2019 AnnaCherkes. All rights reserved.
//

import UIKit

public protocol RestaurantDataManagerProtocol {
    func loadRestaurants(completion: @escaping ([RestaurantDTO]?, NSError?) -> Void)
}

public class RestaurantDataManager: RestaurantDataManagerProtocol {
    
    private var network: RestaurantNetworkManagerProtocol
    
    public init(network: RestaurantNetworkManagerProtocol = RestaurantNetworkManager()) {
        self.network = network
    }
    
    public func loadRestaurants(completion: @escaping ([RestaurantDTO]?, NSError?) -> Void) {
        network.loadRestaurants { (items, error) in
            completion(items,error)
        }
    }
}
