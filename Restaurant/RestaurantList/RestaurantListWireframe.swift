//
//  RestaurantListWireframe.swift
//  Restaurant
//
//  Created by Anna Cherkes on 5/18/19.
//  Copyright © 2019 AnnaCherkes. All rights reserved.
//

import UIKit

public protocol RestaurantListWireframeProtocol: BaseWireframe {
    func showRestaurantDetail(with title: String)
}

public class RestaurantListWireframe: RestaurantListWireframeProtocol {

    public var navigationController: UINavigationController!
    
    public func build(data: AnyObject?) -> UIViewController {
        
        let viewController = createRestaurantListFromStoryboard()
        let presenter = RestaurantListPresenter()
        let interactor = RestaurantListInteractor()
        
        viewController.presenter = presenter
        
        presenter.wireframe = self
        presenter.interactor = interactor
        presenter.view = viewController
        
        return viewController
    }
    
    private func createRestaurantListFromStoryboard() -> RestaurantListViewController {
        let storyboard = UIStoryboard.init(name: "RestaurantList", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "restaurantListViewController") as! RestaurantListViewController
        return viewController
    }
    
    public func showRestaurantDetail(with title: String) {
        let wireframe: RestaurantDetailWireframeProtocol = RestaurantDetailWireframe()
        let vc = wireframe.build(data: title as AnyObject)
        navigationController.show(vc, sender: nil)
    }
}
