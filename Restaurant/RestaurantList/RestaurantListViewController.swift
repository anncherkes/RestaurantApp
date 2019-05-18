//
//  RestaurantListViewController.swift
//  Restaurant
//
//  Created by Anna Cherkes on 5/18/19.
//  Copyright © 2019 AnnaCherkes. All rights reserved.
//

import UIKit

public protocol RestaurantListVCProtocol: class {
    func reload()
}

public class RestaurantListViewController: UIViewController, RestaurantListVCProtocol {
    
    public var presenter: RestaurantListPresenterProtocol!
    @IBOutlet weak var tableView: UITableView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        cunfigure()
        presenter.getRestaurants()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    public func reload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func cunfigure() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    deinit {
        tableView.delegate = nil
    }
}

extension RestaurantListViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 199.0
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.restaurantItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! RestaurantTableViewCell
        guard let item = presenter.restaurantItems[safe: indexPath.row] else { return cell }
        cell.setup(with: item)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = presenter.restaurantItems[safe: indexPath.row] else { return }
        guard let restaurant = item.restaurant else { return }
        presenter.showDetail(restaurant)
    }
}
