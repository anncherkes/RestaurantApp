//
//  RestaurantDetailPresenter.swift
//  Restaurant
//
//  Created by Anna Cherkes on 5/18/19.
//  Copyright © 2019 AnnaCherkes. All rights reserved.
//

import UIKit

public protocol RestaurantDetailPresenterProtocol {
    
}

public class RestaurantDetailPresenter: RestaurantDetailPresenterProtocol {
    public weak var view: RestaurantDetailVCProtocol?
    public var interactor: RestaurantDetailInteractorProtocol!
    public var wireframe: RestaurantDetailWireframeProtocol!
}
