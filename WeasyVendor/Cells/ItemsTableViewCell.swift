//
//  ItemsTableViewCell.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/12/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit
import SDWebImage

public protocol ItemsTableViewDelegate: class {
    func changeAvailablilty(available: Bool, itemIndex: Int)
}

class ItemsTableViewCell: UITableViewCell {
    @IBOutlet weak var itemIamgeView: UIImageView!
    @IBOutlet weak var itemNameLbl: UILabel!
    open weak var Delegate: ItemsTableViewDelegate?

    @IBOutlet weak var isAvailableSwitch: UISwitch!
    @IBOutlet weak var itemPriceLbl: UILabel!
    var index = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(item: Item, itemIndex: Int){
        itemIamgeView.sd_setImage(with: URL(string: item.image), placeholderImage: UIImage(named: "placeholder.png"))
        itemNameLbl.text = item.name
        itemPriceLbl.text = String(item.price)
        isAvailableSwitch.isOn = item.isAvailable
        index = itemIndex
        
    }

    @IBAction func isAvailableAction(_ sender: UISwitch) {
        Delegate?.changeAvailablilty(available: sender.isOn,itemIndex: index)
        
    }
}
