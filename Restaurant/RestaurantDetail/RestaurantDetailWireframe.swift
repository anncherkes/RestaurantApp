//
//  RestaurantDetailWireframe.swift
//  Restaurant
//
//  Created by Anna Cherkes on 5/18/19.
//  Copyright © 2019 AnnaCherkes. All rights reserved.
//

import UIKit

public protocol RestaurantDetailWireframeProtocol: BaseWireframe {
    
}

public class RestaurantDetailWireframe: RestaurantDetailWireframeProtocol {

    public var navigationController: UINavigationController!
    
    public func build(data: AnyObject?) -> UIViewController {
        
        let viewController = createRestaurantDetailFromStoryboard()
        let presenter = RestaurantDetailPresenter()
        let interactor = RestaurantDetailInteractor()
        
        viewController.presenter = presenter
        
        presenter.wireframe = self
        presenter.interactor = interactor
        presenter.view = viewController
        
        guard let title = data as? String else {
            return viewController
        }
        
        viewController.restaurantTitle = title
        
        return viewController
    }
    
    private func createRestaurantDetailFromStoryboard() -> RestaurantDetailViewController {
        let storyboard = UIStoryboard.init(name: "RestaurantDetail", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "restaurantDetailViewController") as! RestaurantDetailViewController
        return viewController
    }
}
