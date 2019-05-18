//
//  RestaurantDTO.swift
//  Restaurant
//
//  Created by Anna Cherkes on 5/18/19.
//  Copyright © 2019 AnnaCherkes. All rights reserved.
//

import Foundation

public struct RestaurantDTO: Decodable {
    public let restaurant: String?
    public let food_name: String?
    public let price: Double?
    public let image_url: String?
}
