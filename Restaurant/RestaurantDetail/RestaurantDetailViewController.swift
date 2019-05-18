//
//  RestaurantDetailViewController.swift
//  Restaurant
//
//  Created by Anna Cherkes on 5/18/19.
//  Copyright © 2019 AnnaCherkes. All rights reserved.
//

import UIKit

public protocol RestaurantDetailVCProtocol: class {
    
}

public class RestaurantDetailViewController: UIViewController, RestaurantDetailVCProtocol {

    @IBOutlet weak var tiltleLabel: UILabel!
    
    public var presenter: RestaurantDetailPresenterProtocol!
    public var restaurantTitle: String?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUi()
        setTitle()
    }
    
    private func setupUi() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.topViewController?.title = "Detail screen"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.color(hex: "#292929")]
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(back))
        self.navigationController?.navigationBar.barTintColor = UIColor.color(hex: "#DDDDDD")
    }
    
    private func setTitle() {
        guard let title = self.restaurantTitle else { return }
        tiltleLabel.text = title
    }
    
    @objc private func back() {
        navigationController?.popToRootViewController(animated: true)
    }
}
