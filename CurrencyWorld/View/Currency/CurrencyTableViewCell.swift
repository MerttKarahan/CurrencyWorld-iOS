//
//  CurrencyTableViewCell.swift
//  CurrencyWorld
//
//  Created by emn on 18.05.2022.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {


    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
//    var onFavoriteTap: ( () -> Void )?
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        addFavoriteImage.isUserInteractionEnabled = true
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(favoriteTap))
//        addFavoriteImage.addGestureRecognizer(gesture)
    }
    
//    @objc func favoriteTap() {
//        onFavoriteTap?()
//
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
