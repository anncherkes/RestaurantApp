//
//  RestaurantListPresenter.swift
//  Restaurant
//
//  Created by Anna Cherkes on 5/18/19.
//  Copyright © 2019 AnnaCherkes. All rights reserved.
//

import UIKit

public protocol RestaurantListPresenterProtocol {
    func getRestaurants()
    func showDetail( _ title: String)
    var restaurantItems: [RestaurantDTO] { get }
}

public class RestaurantListPresenter: RestaurantListPresenterProtocol {
    
    public weak var view: RestaurantListVCProtocol?
    public var interactor: RestaurantListInteractorProtocol!
    public var wireframe: RestaurantListWireframeProtocol!
    
    public var restaurantItems = [RestaurantDTO]()
    
    public func getRestaurants() {
        interactor.loadRestaurants { [weak self] (items, error) in
            
            guard let `self` = self else { return }
            
            DispatchQueue.main.async {
                if error == nil {
                    
                    guard let restor = items else {
                        self.getRestaurants()
                        return
                    }
                    
                    if restor.isEmpty {
                        return
                    }
                    
                    self.restaurantItems = restor
                    self.view?.reload()
                }
            }
        }
    }
    
    public func showDetail(_ title: String) {
        wireframe.showRestaurantDetail(with: title)
    }
}
