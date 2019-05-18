//
//  RestaurantTableViewCell.swift
//  Restaurant
//
//  Created by Anna Cherkes on 5/18/19.
//  Copyright © 2019 AnnaCherkes. All rights reserved.
//

import UIKit
import SDWebImage

public class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerForImage: UIView!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var restaurantTitlte: UILabel!
    @IBOutlet weak var foodTitle: UILabel!
    @IBOutlet weak var price: UILabel!
    
    private var placeholder: UIImage? = UIImage(named: "placeholder")

    public func setup(with item: RestaurantDTO) {
        restaurantTitlte.text = item.restaurant
        foodTitle.text = item.food_name
        
        if let itemPrice = item.price {
            price.text = String(format: "$%.2f", locale: Locale(identifier: "en"), CGFloat(itemPrice))
        }
        
        guard let itemUrl = item.image_url,
            let url = URL(string: itemUrl) else {
            return
        }
        
        self.foodImageView.sd_setImage(with: url, placeholderImage: placeholder, options: SDWebImageOptions.continueInBackground) { (image, error, cache, url) in
            if error == nil {
                self.foodImageView.image = image
            }
        }
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }
    
    private func setupStyle() {
        containerForImage.layer.borderColor = UIColor.color(hex: "#D1D1D1").cgColor
        containerForImage.layer.borderWidth = 1.0
    }
}
