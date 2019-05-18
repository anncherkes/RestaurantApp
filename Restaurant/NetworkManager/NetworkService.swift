//
//  NetworkService.swift
//  Restaurant
//
//  Created by Anna Cherkes on 5/18/19.
//  Copyright © 2019 AnnaCherkes. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public enum NetworkServiceError: String {
    case networkDomain = "NetworkErrorDomain"
    case badResponceNetworkDomain = "BadResponceErrorDomain"
    case badObjectModelNetworkDomain = "BadObjectModelErrorDomain"
    case badUrlNetworkDomain = "BadUrlErrorDomain"
}

open class NetworkService {
    public let requestManager: Request
    public init(requestManager: Request = DefaultRequest()) {
        self.requestManager = requestManager
    }
}
