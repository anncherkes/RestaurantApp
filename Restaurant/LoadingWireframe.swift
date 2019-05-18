//
//  LoadingWireframe.swift
//  Restaurant
//
//  Created by Anna Cherkes on 5/18/19.
//  Copyright © 2019 AnnaCherkes. All rights reserved.
//

import UIKit

public protocol BaseWireframe {
    func build(data: AnyObject?) -> UIViewController
    var navigationController: UINavigationController! { set get }
}

class LoadingWireframe {
    public func installRootViewControllerIntoWindow(window: UIWindow) {
        window.rootViewController = loadRestaurantList(window: window)
        window.makeKeyAndVisible()
    }
    
    private func loadRestaurantList(window: UIWindow) -> UIViewController {
        var wireframe: RestaurantListWireframeProtocol = RestaurantListWireframe()
        let navigationController = UINavigationController(rootViewController: wireframe.build(data: nil))
        wireframe.navigationController = navigationController
        return navigationController
    }
}
