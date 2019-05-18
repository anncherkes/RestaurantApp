//
//  RequestManager.swift
//  Restaurant
//
//  Created by Anna Cherkes on 5/18/19.
//  Copyright © 2019 AnnaCherkes. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public protocol Request {
    func request<T:Decodable>(url: String, method: HTTPMethod, completion: @escaping (T?, NSError?) -> Swift.Void)
}

public class DefaultRequest: Request {
    
    public init() {}
    
    private lazy var manager : Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15
        configuration.timeoutIntervalForResource = 30
        return Alamofire.SessionManager(configuration: configuration)
    } ()
    
    public func request<T:Decodable>(url: String, method: HTTPMethod, completion: @escaping (T?, NSError?) -> Swift.Void){
        
        manager.request(url, method: method, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate(contentType: ["text/plain"])
            .validate()
            .responseJSON { response in
                
                switch response.result {
                case .success:
                    if let value = response.result.value {
                        
                        let json = JSON(value)
                        
                        guard let data = try? json.rawData() else {
                            completion(nil, NSError.init(domain: NetworkServiceError.badResponceNetworkDomain.rawValue, code: 0, userInfo: nil))
                            return
                        }
                        
                        let decoder = JSONDecoder()
                        
                        guard let items = try? decoder.decode(T.self , from: data) else {
                            completion(nil, NSError(domain: "Can't parse data for entity \(T.self)", code: 0))
                            return
                        }
                        
                        completion(items, nil)
                    }
                case .failure(let error):
                    completion(nil, error as NSError?)
                }
        }
    }
}
