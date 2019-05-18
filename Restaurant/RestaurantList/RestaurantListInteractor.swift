//
//  RestaurantListInteractor.swift
//  Restaurant
//
//  Created by Anna Cherkes on 5/18/19.
//  Copyright © 2019 AnnaCherkes. All rights reserved.
//

import UIKit

public protocol RestaurantListInteractorProtocol {
    func loadRestaurants(completion: @escaping ([RestaurantDTO]?, NSError?) -> Void)
}

public class RestaurantListInteractor: RestaurantListInteractorProtocol {

    private var dataManager: RestaurantDataManagerProtocol

    public init(dataManager: RestaurantDataManagerProtocol = RestaurantDataManager()) {
        self.dataManager = dataManager
    }
    
    public func loadRestaurants(completion: @escaping ([RestaurantDTO]?, NSError?) -> Void) {
        dataManager.loadRestaurants { (items, error) in
            completion(items, error)
        }
    }
}
